@implementation AKRectAnnotationRenderer

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
  v13 = v12 * -0.5;
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
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPath *Mutable;
  void *v20;
  double v21;
  const CGPath *v22;
  CGPath *MutableCopy;
  CGRect v25;
  CGRect v26;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  objc_msgSend(v9, "cornerRadius");
  if (v10 <= 0.0001)
  {
    MutableCopy = 0;
  }
  else
  {
    objc_msgSend(v9, "strokeWidth");
    v12 = v11 * 0.5;
    objc_msgSend(v9, "originalModelBaseScaleFactor");
    v14 = v12 + v13 * 2.0;
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v26 = CGRectInset(v25, v14, v14);
    v15 = v26.origin.x;
    v16 = v26.origin.y;
    v17 = v26.size.width;
    v18 = v26.size.height;
    Mutable = CGPathCreateMutable();
    if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:", v15, v16, v17, v18))
    {
      v20 = (void *)objc_msgSend(v9, "copy");
      objc_msgSend(v20, "setRectangle:", v15, v16, v17, v18);
      objc_msgSend(v20, "cornerRadius");
      objc_msgSend(v20, "setCornerRadius:", v21 - v12);
      v22 = (const CGPath *)objc_msgSend(a1, "_newPathForAnnotation:axisAlignedForStroke:alignToScreenUsingPageController:orAlignToContext:", v20, 0, 0, 0);
      CGPathAddPath(Mutable, 0, v22);
      CGPathRelease(v22);

    }
    MutableCopy = CGPathCreateMutableCopy(Mutable);
    CGPathRelease(Mutable);
  }

  return MutableCopy;
}

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  int v12;
  uint64_t v13;
  void *v14;
  id v15;
  double Alpha;
  const CGPath *v17;
  id v18;
  void *v19;
  const CGPath *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  AKTSDShape *v25;
  const CGPath *v26;
  id v27;
  CGAffineTransform v28[2];

  v7 = a5;
  v10 = a3;
  v11 = a6;
  CGContextSaveGState(a4);
  objc_msgSend(a1, "_transformContextToModelCoordinates:forAnnotation:forDisplay:pageControllerOrNil:", a4, v10, v7, v11);
  v12 = objc_msgSend(v10, "hasShadow");
  if (v12)
    +[AKAnnotationRendererUtilities beginShadowInContext:forAnnotation:](AKAnnotationRendererUtilities, "beginShadowInContext:forAnnotation:", a4, v10);
  CGContextSaveGState(a4);
  memset(&v28[1], 0, sizeof(CGAffineTransform));
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:hasRotation:](AKGeometryHelper, "rotationTransformForRectangularAnnotation:hasRotation:", v10, 0);
  v28[0] = v28[1];
  CGContextConcatCTM(a4, v28);
  CGContextSaveGState(a4);
  objc_msgSend(v10, "fillColor");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v10, "fillColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    Alpha = CGColorGetAlpha((CGColorRef)objc_msgSend(v15, "CGColor"));

    if (Alpha != 0.0)
    {
      v17 = (const CGPath *)objc_msgSend(a1, "_newPathForAnnotation:axisAlignedForStroke:alignToScreenUsingPageController:orAlignToContext:", v10, 0, v11, a4);
      objc_msgSend(v10, "fillColor");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v18, "CGColor"));

      CGContextAddPath(a4, v17);
      CGContextFillPath(a4);
      CGPathRelease(v17);
    }
  }
  objc_msgSend(v10, "strokeColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    if (objc_msgSend(v10, "brushStyle"))
    {
      v20 = (const CGPath *)objc_msgSend(a1, "_newPathForAnnotation:axisAlignedForStroke:alignToScreenUsingPageController:orAlignToContext:", v10, 0, 0, 0);
      v21 = objc_msgSend(v10, "brushStyle");
      objc_msgSend(v10, "strokeColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "strokeWidth");
      +[AKTSDBrushStroke strokeWithType:color:width:](AKTSDBrushStroke, "strokeWithType:color:width:", v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      +[AKTSDBezierPath bezierPathWithCGPath:](AKTSDBezierPath, "bezierPathWithCGPath:", v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc_init(AKTSDShape);
      -[AKTSDShape setStroke:](v25, "setStroke:", v23);
      -[AKTSDShape setPath:](v25, "setPath:", v24);
      -[AKTSDShape drawInContext:](v25, "drawInContext:", a4);
      CGPathRelease(v20);

    }
    else
    {
      v26 = (const CGPath *)objc_msgSend(a1, "_newPathForAnnotation:axisAlignedForStroke:alignToScreenUsingPageController:orAlignToContext:", v10, 1, v11, a4);
      objc_msgSend(v10, "strokeColor");
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend(v27, "CGColor"));

      objc_msgSend(v10, "strokeWidth");
      +[AKAnnotationRendererUtilities setStandardLineStateInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineStateInContext:forLineWidth:", a4);
      if (objc_msgSend(v10, "isDashed"))
      {
        objc_msgSend(v10, "strokeWidth");
        +[AKAnnotationRendererUtilities setStandardLineDashInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineDashInContext:forLineWidth:", a4);
      }
      CGContextAddPath(a4, v26);
      CGContextStrokePath(a4);
      CGPathRelease(v26);
    }
  }
  CGContextRestoreGState(a4);
  +[AKTextAnnotationRenderHelper renderAnnotationText:intoContext:isForScreen:pageControllerOrNil:](AKTextAnnotationRenderHelper, "renderAnnotationText:intoContext:isForScreen:pageControllerOrNil:", v10, a4, v7, v11);
  CGContextRestoreGState(a4);
  if (v12)
    +[AKAnnotationRendererUtilities endShadowInContext:](AKAnnotationRendererUtilities, "endShadowInContext:", a4);
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
  v10 = (const CGPath *)objc_msgSend(a1, "_newPathForAnnotation:axisAlignedForStroke:alignToScreenUsingPageController:orAlignToContext:", v9, 0, 0, 0);
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
  v8 = (const CGPath *)objc_msgSend(a1, "_newPathForAnnotation:axisAlignedForStroke:alignToScreenUsingPageController:orAlignToContext:", v7, 0, 0, 0);
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

+ (CGPath)_newPathForAnnotation:(id)a3 axisAlignedForStroke:(BOOL)a4 alignToScreenUsingPageController:(id)a5 orAlignToContext:(CGContext *)a6
{
  _BOOL4 v8;
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
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGPathRef v29;
  CGPath *v30;
  CGRect v32;
  CGRect v33;

  v8 = a4;
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "rectangle");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  if (!+[AKGeometryHelper annotationHasRotation:outAngle:](AKGeometryHelper, "annotationHasRotation:outAngle:", v9, 0))
  {
    v19 = 0.0;
    if (v8)
    {
      objc_msgSend(v9, "strokeWidth");
      v19 = v20;
    }
    +[AKGeometryHelper renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:](AKGeometryHelper, "renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:", v10, a6, v9, v12, v14, v16, v18, v19);
    v12 = v21;
    v14 = v22;
    v16 = v23;
    v18 = v24;
  }
  objc_msgSend(v9, "cornerRadius");
  if (v25 <= 0.0)
  {
    v33.origin.x = v12;
    v33.origin.y = v14;
    v33.size.width = v16;
    v33.size.height = v18;
    v29 = CGPathCreateWithRect(v33, 0);
  }
  else
  {
    objc_msgSend(v9, "cornerRadius");
    v27 = v18 / 2.01;
    if (v16 / 2.01 < v18 / 2.01)
      v27 = v16 / 2.01;
    if (v26 >= v27)
      v28 = v27;
    else
      v28 = v26;
    v32.origin.x = v12;
    v32.origin.y = v14;
    v32.size.width = v16;
    v32.size.height = v18;
    v29 = CGPathCreateWithRoundedRect(v32, v28, v28, 0);
  }
  v30 = v29;

  return v30;
}

@end
