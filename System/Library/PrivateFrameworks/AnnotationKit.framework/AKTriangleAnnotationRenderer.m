@implementation AKTriangleAnnotationRenderer

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
    v21 = (const CGPath *)objc_msgSend(a1, "_newPathScaledToModelSpaceForAnnotation:", v9);
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
  uint64_t v12;
  const CGPath *v13;
  int v14;
  uint64_t v15;
  void *v16;
  id v17;
  double Alpha;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  AKTSDShape *v25;
  double v26;
  double v27;
  id v28;
  CGAffineTransform v29[2];

  v7 = a5;
  v10 = a3;
  v11 = a6;
  CGContextSaveGState(a4);
  v12 = objc_msgSend(a1, "_newPathScaledToModelSpaceForAnnotation:", v10);
  if (v12)
  {
    v13 = (const CGPath *)v12;
    objc_msgSend(a1, "_transformContextToModelCoordinates:forAnnotation:forDisplay:pageControllerOrNil:", a4, v10, v7, v11);
    v14 = objc_msgSend(v10, "hasShadow");
    if (v14)
      +[AKAnnotationRendererUtilities beginShadowInContext:forAnnotation:](AKAnnotationRendererUtilities, "beginShadowInContext:forAnnotation:", a4, v10);
    CGContextSaveGState(a4);
    memset(&v29[1], 0, sizeof(CGAffineTransform));
    +[AKGeometryHelper rotationTransformForRectangularAnnotation:hasRotation:](AKGeometryHelper, "rotationTransformForRectangularAnnotation:hasRotation:", v10, 0);
    v29[0] = v29[1];
    CGContextConcatCTM(a4, v29);
    CGContextSaveGState(a4);
    objc_msgSend(v10, "fillColor");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      objc_msgSend(v10, "fillColor");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      Alpha = CGColorGetAlpha((CGColorRef)objc_msgSend(v17, "CGColor"));

      if (Alpha != 0.0)
      {
        objc_msgSend(v10, "fillColor");
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v19, "CGColor"));

        CGContextAddPath(a4, v13);
        CGContextFillPath(a4);
      }
    }
    objc_msgSend(v10, "strokeColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      if (objc_msgSend(v10, "brushStyle"))
      {
        v21 = objc_msgSend(v10, "brushStyle");
        objc_msgSend(v10, "strokeColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "strokeWidth");
        +[AKTSDBrushStroke strokeWithType:color:width:](AKTSDBrushStroke, "strokeWithType:color:width:", v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        +[AKTSDBezierPath bezierPathWithCGPath:](AKTSDBezierPath, "bezierPathWithCGPath:", v13);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_alloc_init(AKTSDShape);
        -[AKTSDShape setStroke:](v25, "setStroke:", v23);
        -[AKTSDShape setPath:](v25, "setPath:", v24);
        -[AKTSDShape drawInContext:](v25, "drawInContext:", a4);

      }
      else
      {
        objc_msgSend(v10, "strokeWidth");
        v27 = v26;
        objc_msgSend(v10, "strokeColor");
        v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend(v28, "CGColor"));

        +[AKAnnotationRendererUtilities setStandardLineStateInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineStateInContext:forLineWidth:", a4, v27);
        if (objc_msgSend(v10, "isDashed"))
          +[AKAnnotationRendererUtilities setStandardLineDashInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineDashInContext:forLineWidth:", a4, v27);
        CGContextAddPath(a4, v13);
        CGContextStrokePath(a4);
      }
    }
    CGContextRestoreGState(a4);
    +[AKTextAnnotationRenderHelper renderAnnotationText:intoContext:isForScreen:pageControllerOrNil:](AKTextAnnotationRenderHelper, "renderAnnotationText:intoContext:isForScreen:pageControllerOrNil:", v10, a4, v7, v11);
    CGContextRestoreGState(a4);
    if (v14)
      +[AKAnnotationRendererUtilities endShadowInContext:](AKAnnotationRendererUtilities, "endShadowInContext:", a4);
    CGPathRelease(v13);
  }
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
  v10 = (const CGPath *)objc_msgSend(a1, "_newPathScaledToModelSpaceForAnnotation:", v9);
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
  v8 = (const CGPath *)objc_msgSend(a1, "_newPathScaledToModelSpaceForAnnotation:", v7);
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

+ (CGPath)_newPathScaledToModelSpaceForAnnotation:(id)a3
{
  id v3;
  double v4;
  double v5;
  double width;
  double height;
  double MidX;
  double MidY;
  int64_t v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  _OWORD *v20;
  void *v21;
  const CGPath *v22;
  CGFloat v23;
  CGFloat v24;
  CGPath *v25;
  CGFloat MinY;
  CGFloat v27;
  CGFloat MaxY;
  CGPath *Mutable;
  double v30;
  double v31;
  CGPath *v32;
  CGFloat v34[2];
  CGFloat MaxX;
  CGFloat v36[2];
  CGFloat yb[2];
  CGFloat y;
  CGFloat ya[2];
  CGFloat xb[2];
  CGFloat x;
  CGFloat xa[2];
  CGAffineTransform v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGAffineTransform v51;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v54;
  CGRect v55;
  CGRect v56;
  CGRect BoundingBox;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v3 = a3;
  objc_msgSend(v3, "rectangle");
  v4 = v55.origin.x;
  v5 = v55.origin.y;
  width = v55.size.width;
  height = v55.size.height;
  MidX = CGRectGetMidX(v55);
  v56.origin.x = v4;
  v56.origin.y = v5;
  v56.size.width = width;
  v56.size.height = height;
  MidY = CGRectGetMidY(v56);
  v10 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", objc_msgSend(v3, "originalExifOrientation"));
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v10, v4, v5, width, height, MidX, MidY);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v3, "path");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (_OWORD *)MEMORY[0x24BDBD8B8];
  if (v19)
  {
    objc_msgSend(v3, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (const CGPath *)objc_msgSend(v21, "newCGPathForPlatformBezierPath");

    BoundingBox = CGPathGetBoundingBox(v22);
    v23 = v16 / fmax(BoundingBox.size.width, 0.0005);
    *(_OWORD *)xb = v20[1];
    *(_OWORD *)&v54.a = *v20;
    *(_OWORD *)yb = *(_OWORD *)&v54.a;
    *(_OWORD *)&v54.c = *(_OWORD *)xb;
    v24 = v18 / fmax(BoundingBox.size.height, 0.0005);
    *(_OWORD *)&v54.tx = v20[2];
    *(_OWORD *)v34 = *(_OWORD *)&v54.tx;
    CGAffineTransformMakeTranslation(&t2, -BoundingBox.origin.x, -BoundingBox.origin.y);
    *(_OWORD *)&t1.a = *(_OWORD *)yb;
    *(_OWORD *)&t1.c = *(_OWORD *)xb;
    *(_OWORD *)&t1.tx = *(_OWORD *)v34;
    CGAffineTransformConcat(&v54, &t1, &t2);
    CGAffineTransformMakeScale(&v51, v23, v24);
    v50 = v54;
    CGAffineTransformConcat(&t1, &v50, &v51);
    v54 = t1;
    CGAffineTransformMakeTranslation(&v49, v12, v14);
    v50 = v54;
    CGAffineTransformConcat(&t1, &v50, &v49);
    v54 = t1;
    v25 = (CGPath *)MEMORY[0x22E2C0A54](v22, &v54);
    CGPathRelease(v22);
  }
  else
  {
    v58.origin.x = v12;
    v58.origin.y = v14;
    v58.size.width = v16;
    v58.size.height = v18;
    x = CGRectGetMinX(v58);
    v59.origin.x = v12;
    v59.origin.y = v14;
    v59.size.width = v16;
    v59.size.height = v18;
    y = CGRectGetMinY(v59);
    v60.origin.x = v12;
    v60.origin.y = v14;
    v60.size.width = v16;
    v60.size.height = v18;
    MaxX = CGRectGetMaxX(v60);
    v61.origin.x = v12;
    v61.origin.y = v14;
    v61.size.width = v16;
    v61.size.height = v18;
    MinY = CGRectGetMinY(v61);
    v62.origin.x = v12;
    v62.origin.y = v14;
    v62.size.width = v16;
    v62.size.height = v18;
    v27 = CGRectGetMidX(v62);
    v63.origin.x = v12;
    v63.origin.y = v14;
    v63.size.width = v16;
    v63.size.height = v18;
    MaxY = CGRectGetMaxY(v63);
    Mutable = CGPathCreateMutable();
    v25 = Mutable;
    if (Mutable)
    {
      CGPathMoveToPoint(Mutable, 0, x, y);
      CGPathAddLineToPoint(v25, 0, MaxX, MinY);
      CGPathAddLineToPoint(v25, 0, v27, MaxY);
      CGPathCloseSubpath(v25);
    }
  }
  *(_OWORD *)ya = v20[1];
  *(_OWORD *)xa = *v20;
  *(_OWORD *)&v54.a = *v20;
  *(_OWORD *)&v54.c = *(_OWORD *)ya;
  *(_OWORD *)&v54.tx = v20[2];
  v36[1] = v54.ty;
  +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", v10, MidX, MidY, *(_QWORD *)&v54.tx);
  t1 = v54;
  CGAffineTransformConcat(&v54, &t1, &v48);
  if ((objc_msgSend(v3, "horizontallyFlipped") & 1) != 0 || objc_msgSend(v3, "verticallyFlipped"))
  {
    *(_OWORD *)&t1.a = *(_OWORD *)xa;
    *(_OWORD *)&t1.c = *(_OWORD *)ya;
    *(_OWORD *)&t1.tx = *(_OWORD *)v36;
    CGAffineTransformMakeTranslation(&v47, -MidX, -MidY);
    *(_OWORD *)&v50.a = *(_OWORD *)xa;
    *(_OWORD *)&v50.c = *(_OWORD *)ya;
    *(_OWORD *)&v50.tx = *(_OWORD *)v36;
    CGAffineTransformConcat(&t1, &v50, &v47);
    if (objc_msgSend(v3, "horizontallyFlipped"))
      v30 = -1.0;
    else
      v30 = 1.0;
    if (objc_msgSend(v3, "verticallyFlipped"))
      v31 = -1.0;
    else
      v31 = 1.0;
    CGAffineTransformMakeScale(&v46, v30, v31);
    v45 = t1;
    CGAffineTransformConcat(&v50, &v45, &v46);
    t1 = v50;
    CGAffineTransformMakeTranslation(&v44, MidX, MidY);
    v45 = t1;
    CGAffineTransformConcat(&v50, &v45, &v44);
    t1 = v50;
    v45 = v54;
    v43 = v50;
    CGAffineTransformConcat(&v50, &v45, &v43);
    v54 = v50;
  }
  if (v25)
  {
    v32 = (CGPath *)MEMORY[0x22E2C0A54](v25, &v54);
    CGPathRelease(v25);
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

@end
