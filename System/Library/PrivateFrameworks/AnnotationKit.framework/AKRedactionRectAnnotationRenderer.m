@implementation AKRedactionRectAnnotationRenderer

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
  CGRect v14;

  v3 = a3;
  objc_msgSend(v3, "rectangle");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "rotationAngle");
  v13 = v12;

  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", v5, v7, v9, v11, v13);
  return CGRectInset(v14, -1.0, -1.0);
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
  CGPath *Mutable;
  void *v19;
  const CGPath *v20;
  CGPath *MutableCopy;
  CGRect v23;
  CGRect v24;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  objc_msgSend(v9, "strokeWidth");
  v11 = v10 * 0.5;
  objc_msgSend(v9, "originalModelBaseScaleFactor");
  v13 = v11 + v12 * 2.0;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v24 = CGRectInset(v23, v13, v13);
  v14 = v24.origin.x;
  v15 = v24.origin.y;
  v16 = v24.size.width;
  v17 = v24.size.height;
  Mutable = CGPathCreateMutable();
  if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:", v14, v15, v16, v17))
  {
    v19 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v19, "setRectangle:", v14, v15, v16, v17);
    v20 = (const CGPath *)objc_msgSend(a1, "_newPathForAnnotation:axisAlignedForStroke:alignToScreenUsingPageController:orAlignToContext:", v19, 0, 0, 0);
    CGPathAddPath(Mutable, 0, v20);
    CGPathRelease(v20);

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
  const CGPath *v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  CGColorSpace *ColorSpace;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat MaxX;
  CGFloat MaxY;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGAffineTransform transform;
  CGFloat v34;
  CGFloat v35;
  uint64_t v36;
  CGRect BoundingBox;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v7 = a5;
  v36 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  CGContextSaveGState(a4);
  objc_msgSend(a1, "_transformContextToModelCoordinates:forAnnotation:forDisplay:pageControllerOrNil:", a4, v10, v7, v11);
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:hasRotation:](AKGeometryHelper, "rotationTransformForRectangularAnnotation:hasRotation:", v10, 0);
  memset(&transform, 0, sizeof(transform));
  CGContextConcatCTM(a4, &transform);
  v12 = (const CGPath *)objc_msgSend(a1, "_newPathForAnnotation:axisAlignedForStroke:alignToScreenUsingPageController:orAlignToContext:", v10, 0, v11, a4);

  BoundingBox = CGPathGetBoundingBox(v12);
  x = BoundingBox.origin.x;
  y = BoundingBox.origin.y;
  width = BoundingBox.size.width;
  height = BoundingBox.size.height;
  if ((objc_msgSend(v10, "isHighlighted") & 1) != 0)
  {
    CGContextSetRGBStrokeColor(a4, 0.0, 0.0, 0.0, 1.0);
    CGContextSetLineWidth(a4, 1.0);
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    CGContextStrokeRect(a4, v38);
  }
  else
  {
    if (objc_msgSend(v10, "isOpaque"))
      v17 = 1.0;
    else
      v17 = 0.65;
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "colorWithAlphaComponent:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_retainAutorelease(v19);
    CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v20, "CGColor"));
    CGContextAddPath(a4, v12);
    CGContextFillPath(a4);
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    CGContextClipToRect(a4, v39);
    objc_msgSend(MEMORY[0x24BDF6950], "darkGrayColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "colorWithAlphaComponent:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_retainAutorelease(v22);
    ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v23, "CGColor"));
    if (ColorSpace)
    {
      CGContextSetStrokeColorSpace(a4, ColorSpace);
      CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend(objc_retainAutorelease(v23), "CGColor"));
      v40.origin.x = x;
      v40.origin.y = y;
      v40.size.width = width;
      v40.size.height = height;
      MinX = CGRectGetMinX(v40);
      v41.origin.x = x;
      v41.origin.y = y;
      v41.size.width = width;
      v41.size.height = height;
      MinY = CGRectGetMinY(v41);
      transform.a = MinX;
      transform.b = MinY;
      v42.origin.x = x;
      v42.origin.y = y;
      v42.size.width = width;
      v42.size.height = height;
      MaxX = CGRectGetMaxX(v42);
      v43.origin.x = x;
      v43.origin.y = y;
      v43.size.width = width;
      v43.size.height = height;
      MaxY = CGRectGetMaxY(v43);
      transform.c = MaxX;
      transform.d = MaxY;
      v44.origin.x = x;
      v44.origin.y = y;
      v44.size.width = width;
      v44.size.height = height;
      v29 = CGRectGetMinX(v44);
      v45.origin.x = x;
      v45.origin.y = y;
      v45.size.width = width;
      v45.size.height = height;
      v30 = CGRectGetMaxY(v45);
      transform.tx = v29;
      transform.ty = v30;
      v46.origin.x = x;
      v46.origin.y = y;
      v46.size.width = width;
      v46.size.height = height;
      v31 = CGRectGetMaxX(v46);
      v47.origin.x = x;
      v47.origin.y = y;
      v47.size.width = width;
      v47.size.height = height;
      v32 = CGRectGetMinY(v47);
      v34 = v31;
      v35 = v32;
      CGContextSetLineWidth(a4, 1.0);
      CGContextStrokeLineSegments(a4, (const CGPoint *)&transform, 4uLL);
    }

  }
  CGPathRelease(v12);
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
  v11 = 0.0;
  if (a5 >= 0.0)
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
  id v8;
  id v9;
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
  CGPath *v22;
  CGRect v24;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "rectangle");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  if (!+[AKGeometryHelper annotationHasRotation:outAngle:](AKGeometryHelper, "annotationHasRotation:outAngle:", v8, 0))
  {
    +[AKGeometryHelper renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:](AKGeometryHelper, "renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:", v9, a6, v8, v11, v13, v15, v17, 0.0);
    v11 = v18;
    v13 = v19;
    v15 = v20;
    v17 = v21;
  }
  v24.origin.x = v11;
  v24.origin.y = v13;
  v24.size.width = v15;
  v24.size.height = v17;
  v22 = CGPathCreateWithRect(v24, 0);

  return v22;
}

@end
