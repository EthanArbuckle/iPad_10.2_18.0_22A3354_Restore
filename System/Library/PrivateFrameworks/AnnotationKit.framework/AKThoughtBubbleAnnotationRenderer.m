@implementation AKThoughtBubbleAnnotationRenderer

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
  CGFloat v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v19;
  CGFloat v20;
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
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect result;
  CGRect v53;

  v3 = a3;
  objc_msgSend(v3, "rectangle");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "pointyBitPoint");
  v13 = v12;
  objc_msgSend(v3, "pointyBitPoint");
  v53.origin.y = v14;
  v53.size.width = 0.0;
  v53.size.height = 0.0;
  v46.origin.x = v5;
  v46.origin.y = v7;
  v46.size.width = v9;
  v46.size.height = v11;
  v53.origin.x = v13;
  v47 = CGRectUnion(v46, v53);
  x = v47.origin.x;
  y = v47.origin.y;
  width = v47.size.width;
  height = v47.size.height;
  objc_msgSend(v3, "strokeWidth");
  v20 = v19 * -4.0;
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  v49 = CGRectInset(v48, v20, v20);
  v21 = v49.origin.x;
  v22 = v49.origin.y;
  v23 = v49.size.width;
  v24 = v49.size.height;
  objc_msgSend(v3, "rotationAngle");
  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", v21, v22, v23, v24, v25);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  if (objc_msgSend(v3, "hasShadow"))
  {
    +[AKAnnotationRendererUtilities outsetRectForShadow:onAnnotation:](AKAnnotationRendererUtilities, "outsetRectForShadow:onAnnotation:", v3, v27, v29, v31, v33);
    v27 = v34;
    v29 = v35;
    v31 = v36;
    v33 = v37;
  }
  v50.origin.x = v27;
  v50.origin.y = v29;
  v50.size.width = v31;
  v50.size.height = v33;
  v51 = CGRectInset(v50, -1.0, -1.0);
  v38 = v51.origin.x;
  v39 = v51.origin.y;
  v40 = v51.size.width;
  v41 = v51.size.height;

  v42 = v38;
  v43 = v39;
  v44 = v40;
  v45 = v41;
  result.size.height = v45;
  result.size.width = v44;
  result.origin.y = v43;
  result.origin.x = v42;
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
    v21 = (const CGPath *)objc_msgSend(a1, "_newCloudPathScaledToModelSpaceForAnnotation:", v9);
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

+ (void)_fillAndStrokePath:(CGPath *)a3 forAnnotation:(id)a4 inContext:(CGContext *)a5
{
  uint64_t v7;
  void *v8;
  id v9;
  double Alpha;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  AKTSDShape *v17;
  double v18;
  double v19;
  id v20;
  id v21;

  v21 = a4;
  CGContextSaveGState(a5);
  objc_msgSend(v21, "fillColor");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v21, "fillColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    Alpha = CGColorGetAlpha((CGColorRef)objc_msgSend(v9, "CGColor"));

    if (Alpha != 0.0)
    {
      objc_msgSend(v21, "fillColor");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetFillColorWithColor(a5, (CGColorRef)objc_msgSend(v11, "CGColor"));

      CGContextAddPath(a5, a3);
      CGContextFillPath(a5);
    }
  }
  objc_msgSend(v21, "strokeColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (objc_msgSend(v21, "brushStyle"))
    {
      v13 = objc_msgSend(v21, "brushStyle");
      objc_msgSend(v21, "strokeColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "strokeWidth");
      +[AKTSDBrushStroke strokeWithType:color:width:](AKTSDBrushStroke, "strokeWithType:color:width:", v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      +[AKTSDBezierPath bezierPathWithCGPath:](AKTSDBezierPath, "bezierPathWithCGPath:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc_init(AKTSDShape);
      -[AKTSDShape setStroke:](v17, "setStroke:", v15);
      -[AKTSDShape setPath:](v17, "setPath:", v16);
      -[AKTSDShape drawInContext:](v17, "drawInContext:", a5);

    }
    else
    {
      objc_msgSend(v21, "strokeWidth");
      v19 = v18;
      objc_msgSend(v21, "strokeColor");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetStrokeColorWithColor(a5, (CGColorRef)objc_msgSend(v20, "CGColor"));

      +[AKAnnotationRendererUtilities setStandardLineStateInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineStateInContext:forLineWidth:", a5, v19);
      if (objc_msgSend(v21, "isDashed"))
        +[AKAnnotationRendererUtilities setStandardLineDashInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineDashInContext:forLineWidth:", a5, v19);
      CGContextAddPath(a5, a3);
      CGContextStrokePath(a5);
    }
  }
  CGContextRestoreGState(a5);

}

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  const CGPath *v12;
  const CGPath *v13;
  uint64_t v14;
  const CGPath *v15;
  CGAffineTransform v16[2];

  v7 = a5;
  v10 = a3;
  v11 = a6;
  CGContextSaveGState(a4);
  v12 = (const CGPath *)objc_msgSend(a1, "_newCloudPathScaledToModelSpaceForAnnotation:", v10);
  v13 = (const CGPath *)objc_msgSend(a1, "_newLargestBubblePathScaledToModelSpaceForAnnotation:", v10);
  v14 = objc_msgSend(a1, "_newSmallestBubblePathScaledToModelSpaceForAnnotation:", v10);
  v15 = (const CGPath *)v14;
  if (v12 && v13 && v14)
  {
    objc_msgSend(a1, "_transformContextToModelCoordinates:forAnnotation:forDisplay:pageControllerOrNil:", a4, v10, v7, v11);
    CGContextSaveGState(a4);
    memset(&v16[1], 0, sizeof(CGAffineTransform));
    +[AKGeometryHelper rotationTransformForRectangularAnnotation:hasRotation:](AKGeometryHelper, "rotationTransformForRectangularAnnotation:hasRotation:", v10, 0);
    v16[0] = v16[1];
    CGContextConcatCTM(a4, v16);
    CGContextSaveGState(a4);
    if (objc_msgSend(v10, "hasShadow"))
    {
      +[AKAnnotationRendererUtilities beginShadowInContext:forAnnotation:](AKAnnotationRendererUtilities, "beginShadowInContext:forAnnotation:", a4, v10);
      objc_msgSend(a1, "_fillAndStrokePath:forAnnotation:inContext:", v12, v10, a4);
      objc_msgSend(a1, "_fillAndStrokePath:forAnnotation:inContext:", v13, v10, a4);
      objc_msgSend(a1, "_fillAndStrokePath:forAnnotation:inContext:", v15, v10, a4);
      CGContextRestoreGState(a4);
      +[AKTextAnnotationRenderHelper renderAnnotationText:intoContext:isForScreen:pageControllerOrNil:](AKTextAnnotationRenderHelper, "renderAnnotationText:intoContext:isForScreen:pageControllerOrNil:", v10, a4, v7, v11);
      CGContextRestoreGState(a4);
      +[AKAnnotationRendererUtilities endShadowInContext:](AKAnnotationRendererUtilities, "endShadowInContext:", a4);
    }
    else
    {
      objc_msgSend(a1, "_fillAndStrokePath:forAnnotation:inContext:", v12, v10, a4);
      objc_msgSend(a1, "_fillAndStrokePath:forAnnotation:inContext:", v13, v10, a4);
      objc_msgSend(a1, "_fillAndStrokePath:forAnnotation:inContext:", v15, v10, a4);
      CGContextRestoreGState(a4);
      +[AKTextAnnotationRenderHelper renderAnnotationText:intoContext:isForScreen:pageControllerOrNil:](AKTextAnnotationRenderHelper, "renderAnnotationText:intoContext:isForScreen:pageControllerOrNil:", v10, a4, v7, v11);
      CGContextRestoreGState(a4);
    }
  }
  CGPathRelease(v12);
  CGPathRelease(v13);
  CGPathRelease(v15);
  CGContextRestoreGState(a4);

}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  double v10;
  uint64_t v11;
  const CGPath *v12;
  CGPath *v13;
  const CGPath *v14;
  BOOL v15;
  uint64_t v16;
  const CGPath *v17;
  CGPath *v18;
  const CGPath *v19;
  BOOL v20;
  BOOL v21;
  uint64_t v22;
  const CGPath *v23;
  CGPath *v24;
  const CGPath *v25;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform m;
  CGPoint v30;
  CGPoint v31;
  CGPoint v32;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  objc_msgSend(v9, "strokeWidth");
  if (v10 > a5)
    a5 = v10;
  memset(&m, 0, sizeof(m));
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:hasRotation:](AKGeometryHelper, "rotationTransformForRectangularAnnotation:hasRotation:", v9, 0);
  v27 = m;
  CGAffineTransformInvert(&v28, &v27);
  m = v28;
  v11 = objc_msgSend(a1, "_newCloudPathScaledToModelSpaceForAnnotation:", v9);
  if (v11)
  {
    v12 = (const CGPath *)v11;
    v13 = +[AKAnnotationRendererUtilities newStandardStrokedBorderPathWithPath:withStrokeWidth:](AKAnnotationRendererUtilities, "newStandardStrokedBorderPathWithPath:withStrokeWidth:", v11, a5);
    if (v13)
    {
      v14 = v13;
      v30.x = x;
      v30.y = y;
      v15 = CGPathContainsPoint(v13, &m, v30, 0);
      CGPathRelease(v14);
      CGPathRelease(v12);
      if (v15)
        goto LABEL_11;
    }
    else
    {
      CGPathRelease(v12);
    }
  }
  v16 = objc_msgSend(a1, "_newLargestBubblePathScaledToModelSpaceForAnnotation:", v9);
  if (v16)
  {
    v17 = (const CGPath *)v16;
    v18 = +[AKAnnotationRendererUtilities newStandardStrokedBorderPathWithPath:withStrokeWidth:](AKAnnotationRendererUtilities, "newStandardStrokedBorderPathWithPath:withStrokeWidth:", v16, a5);
    if (v18)
    {
      v19 = v18;
      v31.x = x;
      v31.y = y;
      v20 = CGPathContainsPoint(v18, &m, v31, 0);
      CGPathRelease(v19);
      CGPathRelease(v17);
      if (v20)
      {
LABEL_11:
        v21 = 1;
        goto LABEL_19;
      }
    }
    else
    {
      CGPathRelease(v17);
    }
  }
  v22 = objc_msgSend(a1, "_newSmallestBubblePathScaledToModelSpaceForAnnotation:", v9);
  if (v22)
  {
    v23 = (const CGPath *)v22;
    v24 = +[AKAnnotationRendererUtilities newStandardStrokedBorderPathWithPath:withStrokeWidth:](AKAnnotationRendererUtilities, "newStandardStrokedBorderPathWithPath:withStrokeWidth:", v22, a5);
    if (v24)
    {
      v25 = v24;
      v32.x = x;
      v32.y = y;
      v21 = CGPathContainsPoint(v24, &m, v32, 0);
      CGPathRelease(v25);
    }
    else
    {
      v21 = 0;
    }
    CGPathRelease(v23);
  }
  else
  {
    v21 = 0;
  }
LABEL_19:

  return v21;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  const CGPath *v8;
  const CGPath *v9;
  BOOL v10;
  const CGPath *v11;
  const CGPath *v12;
  BOOL v13;
  BOOL v14;
  const CGPath *v15;
  const CGPath *v16;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform m;
  CGPoint v21;
  CGPoint v22;
  CGPoint v23;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  memset(&m, 0, sizeof(m));
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:hasRotation:](AKGeometryHelper, "rotationTransformForRectangularAnnotation:hasRotation:", v7, 0);
  v18 = m;
  CGAffineTransformInvert(&v19, &v18);
  m = v19;
  v8 = (const CGPath *)objc_msgSend(a1, "_newCloudPathScaledToModelSpaceForAnnotation:", v7);
  if (v8)
  {
    v9 = v8;
    v21.x = x;
    v21.y = y;
    v10 = CGPathContainsPoint(v8, &m, v21, 0);
    CGPathRelease(v9);
    if (v10)
      goto LABEL_5;
  }
  v11 = (const CGPath *)objc_msgSend(a1, "_newLargestBubblePathScaledToModelSpaceForAnnotation:", v7);
  if (v11 && (v12 = v11, v22.x = x, v22.y = y, v13 = CGPathContainsPoint(v11, &m, v22, 0), CGPathRelease(v12), v13))
  {
LABEL_5:
    v14 = 1;
  }
  else
  {
    v15 = (const CGPath *)objc_msgSend(a1, "_newSmallestBubblePathScaledToModelSpaceForAnnotation:", v7);
    if (v15)
    {
      v16 = v15;
      v23.x = x;
      v23.y = y;
      v14 = CGPathContainsPoint(v15, &m, v23, 0);
      CGPathRelease(v16);
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

+ (CGPoint)_unitAnnotationPointyPointForAnnotation:(id)a3
{
  id v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat MinY;
  CGFloat tx;
  CGFloat ty;
  CGFloat v14;
  CGFloat v15;
  double a;
  double b;
  double c;
  double d;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CGAffineTransform v32;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v35;
  CGPoint result;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v3 = a3;
  objc_msgSend(v3, "rectangle");
  x = v37.origin.x;
  y = v37.origin.y;
  width = v37.size.width;
  height = v37.size.height;
  v28 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v30 = *MEMORY[0x24BDBD8B8];
  v8 = *(double *)(MEMORY[0x24BDBD8B8] + 32);
  v9 = *(double *)(MEMORY[0x24BDBD8B8] + 40);
  v10 = -CGRectGetMinX(v37);
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  MinY = CGRectGetMinY(v38);
  CGAffineTransformMakeTranslation(&t2, v10, -MinY);
  *(_OWORD *)&t1.a = v30;
  *(_OWORD *)&t1.c = v28;
  t1.tx = v8;
  t1.ty = v9;
  CGAffineTransformConcat(&v35, &t1, &t2);
  v29 = *(_OWORD *)&v35.c;
  v31 = *(_OWORD *)&v35.a;
  tx = v35.tx;
  ty = v35.ty;
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  v14 = 1.0 / CGRectGetWidth(v39);
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  v15 = CGRectGetHeight(v40);
  CGAffineTransformMakeScale(&v32, v14, 1.0 / v15);
  *(_OWORD *)&t1.a = v31;
  *(_OWORD *)&t1.c = v29;
  t1.tx = tx;
  t1.ty = ty;
  CGAffineTransformConcat(&v35, &t1, &v32);
  a = v35.a;
  b = v35.b;
  c = v35.c;
  d = v35.d;
  v20 = v35.tx;
  v21 = v35.ty;
  objc_msgSend(v3, "pointyBitPoint");
  v23 = v22;
  v25 = v24;

  v26 = v20 + c * v25 + a * v23;
  v27 = v21 + d * v25 + b * v23;
  result.y = v27;
  result.x = v26;
  return result;
}

+ (CGPoint)_unitCloudCenter
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.5;
  v3 = 0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

+ (double)_unitCloudRadius
{
  return 0.5;
}

+ (CGPoint)_templatePointyPointToCircleIntersect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  objc_msgSend(a1, "_unitCloudCenter");
  v4 = v3;
  v6 = v5;
  objc_msgSend(a1, "_unitCloudRadius");
  +[AKGeometryHelper intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:", 0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v4, v6, v4, v6, v7);
  result.y = v9;
  result.x = v8;
  return result;
}

+ (double)_templateToUnitPointyPointScaleForAnnotation:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  long double v9;
  double v10;
  long double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double result;
  double v21;

  objc_msgSend(a1, "_unitAnnotationPointyPointForAnnotation:", a3);
  v5 = v4;
  v7 = v6;
  objc_msgSend(a1, "_templatePointyPointToCircleIntersect");
  v9 = v8;
  v11 = v10;
  objc_msgSend(a1, "_unitCloudCenter");
  v13 = v12;
  v15 = v14;
  objc_msgSend(a1, "_unitCloudRadius");
  +[AKGeometryHelper intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:", 0, v5, v7, v13, v15, v13, v15, v16);
  v19 = v18;
  result = 1.0;
  if (v19 != v5 && v17 != v7 && v9 != 0.0 && v11 != 0.0)
  {
    v21 = hypot(v19 - v5, v17 - v7);
    return v21 / hypot(v9, v11);
  }
  return result;
}

+ (CGPath)_newSmallestBubblePathScaledToModelSpaceForAnnotation:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPath *v12;
  double v14;
  double v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;

  v4 = a3;
  objc_msgSend(a1, "_unitAnnotationPointyPointForAnnotation:", v4);
  v14 = v6;
  v15 = v5;
  objc_msgSend(a1, "_unitCloudCenter");
  v8 = v7;
  v10 = v9;
  +[AKGeometryHelper angleBetweenPoint:andPoint:](AKGeometryHelper, "angleBetweenPoint:andPoint:", -v7, -v9, v15 - v7, v14 - v9);
  +[AKGeometryHelper rotationTransformAroundPoint:withAngle:](AKGeometryHelper, "rotationTransformAroundPoint:withAngle:", v8, v10, -v11);
  v12 = (CGPath *)objc_msgSend(a1, "_newSmallBubblePathForAnnotation:atCenter:withSize:", v4, vaddq_f64(vaddq_f64(v18, vmlaq_n_f64(vmulq_n_f64(v17, v14), v16, v15)), (float64x2_t)vdupq_n_s64(0x3FA47AE147AE147BuLL)), 0.08, 0.08);

  return v12;
}

+ (CGPath)_newLargestBubblePathScaledToModelSpaceForAnnotation:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat tx;
  CGFloat ty;
  CGFloat v15;
  CGFloat v16;
  float64x2_t v17;
  CGPath *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v30;

  v4 = a3;
  objc_msgSend(a1, "_templateToUnitPointyPointScaleForAnnotation:", v4);
  v6 = v5;
  objc_msgSend(a1, "_templatePointyPointToCircleIntersect");
  v8 = v7;
  v10 = v9;
  v20 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v23 = *MEMORY[0x24BDBD8B8];
  v11 = *(double *)(MEMORY[0x24BDBD8B8] + 32);
  v12 = *(double *)(MEMORY[0x24BDBD8B8] + 40);
  CGAffineTransformMakeTranslation(&t2, -v7, -v9);
  *(_OWORD *)&t1.a = v23;
  *(_OWORD *)&t1.c = v20;
  t1.tx = v11;
  t1.ty = v12;
  CGAffineTransformConcat(&v30, &t1, &t2);
  v21 = *(_OWORD *)&v30.c;
  v24 = *(_OWORD *)&v30.a;
  tx = v30.tx;
  ty = v30.ty;
  CGAffineTransformMakeScale(&v27, v6, v6);
  *(_OWORD *)&t1.a = v24;
  *(_OWORD *)&t1.c = v21;
  t1.tx = tx;
  t1.ty = ty;
  CGAffineTransformConcat(&v30, &t1, &v27);
  v22 = *(_OWORD *)&v30.c;
  v25 = *(_OWORD *)&v30.a;
  v15 = v30.tx;
  v16 = v30.ty;
  CGAffineTransformMakeTranslation(&v26, v8, v10);
  *(_OWORD *)&t1.a = v25;
  *(_OWORD *)&t1.c = v22;
  t1.tx = v15;
  t1.ty = v16;
  CGAffineTransformConcat(&v30, &t1, &v26);
  v17 = (float64x2_t)vdupq_n_s64(0x3FB999999999999AuLL);
  v18 = (CGPath *)objc_msgSend(a1, "_newSmallBubblePathForAnnotation:atCenter:withSize:", v4, vaddq_f64(*(float64x2_t *)&v30.tx, vmlaq_f64(vmulq_f64(*(float64x2_t *)&v30.c, v17), v17, *(float64x2_t *)&v30.a)), 0.13, 0.11);

  return v18;
}

+ (CGPath)_newSmallBubblePathForAnnotation:(id)a3 atCenter:(CGPoint)a4 withSize:(CGSize)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPath *Mutable;
  CGPath *v20;
  CGRect v22;

  height = a5.height;
  width = a5.width;
  y = a4.y;
  x = a4.x;
  v10 = a3;
  objc_msgSend(a1, "_unitCloudCenter");
  v12 = v11;
  v14 = v13;
  objc_msgSend(a1, "_unitAnnotationPointyPointForAnnotation:", v10);
  +[AKGeometryHelper angleBetweenPoint:andPoint:](AKGeometryHelper, "angleBetweenPoint:andPoint:", -v12, -v14, v15 - v12, v16 - v14);
  +[AKGeometryHelper rotationTransformAroundPoint:withAngle:](AKGeometryHelper, "rotationTransformAroundPoint:withAngle:", v12, v14, v17);
  v18 = y * 0.0 + 0.0 * x + 0.0;
  Mutable = CGPathCreateMutable();
  v22.origin.x = v18 + width * -0.5;
  v22.origin.y = v18 + height * -0.5;
  v22.size.width = width;
  v22.size.height = height;
  CGPathAddEllipseInRect(Mutable, 0, v22);
  v20 = (CGPath *)objc_msgSend(a1, "_newPathTransformedFromUnitToModelSpace:forAnnotation:", Mutable, v10);

  CGPathRelease(Mutable);
  return v20;
}

+ (CGPath)_newCloudPathScaledToModelSpaceForAnnotation:(id)a3
{
  id v4;
  CGPath *Mutable;
  CGPath *v6;

  v4 = a3;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.30244827, 0.01343505);
  CGPathAddCurveToPoint(Mutable, 0, 0.35887423, -0.00959289, 0.42427887, 0.00619094, 0.47937859, 0.04929641);
  CGPathAddCurveToPoint(Mutable, 0, 0.53032459, 0.00214956, 0.59395242, -0.01865431, 0.652297, 0.0);
  CGPathAddCurveToPoint(Mutable, 0, 0.71073129, 0.01868303, 0.7508165, 0.07273387, 0.76546521, 0.14101983);
  CGPathAddCurveToPoint(Mutable, 0, 0.83514999, 0.13778761, 0.89767936, 0.16238721, 0.93065127, 0.21400945);
  CGPathAddCurveToPoint(Mutable, 0, 0.9636971, 0.26574732, 0.95984616, 0.33276261, 0.9270475, 0.39417562);
  CGPathAddCurveToPoint(Mutable, 0, 0.98279027, 0.436392, 1.0, 0.49515658, 1.0, 0.55554747);
  CGPathAddCurveToPoint(Mutable, 0, 0.99918663, 0.61594457, 0.95336502, 0.66440709, 0.88878699, 0.69017171);
  CGPathAddCurveToPoint(Mutable, 0, 0.90457535, 0.75805935, 0.89117571, 0.82360221, 0.84620553, 0.86454625);
  CGPathAddCurveToPoint(Mutable, 0, 0.80122828, 0.90549673, 0.7345451, 0.9130876, 0.66813488, 0.89126836);
  CGPathAddCurveToPoint(Mutable, 0, 0.63656157, 0.95307559, 0.5838518, 0.99421009, 0.5227851, 0.99653725);
  CGPathAddCurveToPoint(Mutable, 0, 0.46172753, 0.99886408, 0.40591285, 0.9615682, 0.36877061, 0.90239532);
  CGPathAddCurveToPoint(Mutable, 0, 0.3045019, 0.9293305, 0.23732643, 0.92697529, 0.18866412, 0.88952898);
  CGPathAddCurveToPoint(Mutable, 0, 0.14002093, 0.85209719, 0.12074766, 0.78785582, 0.13033697, 0.71889516);
  CGPathAddCurveToPoint(Mutable, 0, 0.06360102, 0.69813851, 0.01336473, 0.65341583, 0.0, 0.59381692);
  CGPathAddCurveToPoint(Mutable, 0, -0.01339382, 0.53408908, 0.01328839, 0.47315176, 0.06520553, 0.42680233);
  CGPathAddCurveToPoint(Mutable, 0, 0.02695239, 0.36813353, 0.01654879, 0.30199402, 0.04470275, 0.24796491);
  CGPathAddCurveToPoint(Mutable, 0, 0.07287601, 0.19389922, 0.13305774, 0.16448633, 0.20298753, 0.16251968);
  CGPathAddCurveToPoint(Mutable, 0, 0.2105341, 0.094648, 0.24368711, 0.04628048, 0.30244827, 0.01343505);
  CGPathCloseSubpath(Mutable);
  v6 = (CGPath *)objc_msgSend(a1, "_newPathTransformedFromUnitToModelSpace:forAnnotation:", Mutable, v4);

  CGPathRelease(Mutable);
  return v6;
}

+ (CGPath)_newPathTransformedFromUnitToModelSpace:(CGPath *)a3 forAnnotation:(id)a4
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v9;
  CGFloat v10;
  CGFloat MinX;
  CGFloat MinY;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  objc_msgSend(a4, "rectangle");
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  v16 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v21.a = *MEMORY[0x24BDBD8B8];
  v15 = *(_OWORD *)&v21.a;
  *(_OWORD *)&v21.c = v16;
  *(_OWORD *)&v21.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  v14 = *(_OWORD *)&v21.tx;
  v9 = CGRectGetWidth(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v10 = CGRectGetHeight(v23);
  CGAffineTransformMakeScale(&t2, v9, v10);
  *(_OWORD *)&t1.a = v15;
  *(_OWORD *)&t1.c = v16;
  *(_OWORD *)&t1.tx = v14;
  CGAffineTransformConcat(&v21, &t1, &t2);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MinX = CGRectGetMinX(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MinY = CGRectGetMinY(v25);
  CGAffineTransformMakeTranslation(&v18, MinX, MinY);
  v17 = v21;
  CGAffineTransformConcat(&t1, &v17, &v18);
  v21 = t1;
  return (CGPath *)MEMORY[0x22E2C0A54](a3, &v21);
}

@end
