@implementation AKHeartAnnotationRenderer

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
  double x;
  double y;
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
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGPath *Mutable;
  CGFloat v20;
  CGFloat MinY;
  CGFloat MinX;
  double v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  CGFloat MaxY;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat MaxX;
  CGFloat v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  __int128 v56;
  CGPath *v57;
  uint64_t v59;
  double v60;
  double v61;
  CGAffineTransform v62;
  CGAffineTransform v63;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;

  v3 = a3;
  objc_msgSend(v3, "rectangle");
  x = v67.origin.x;
  y = v67.origin.y;
  width = v67.size.width;
  height = v67.size.height;
  MidX = CGRectGetMidX(v67);
  v68.origin.x = x;
  v68.origin.y = y;
  v68.size.width = width;
  v68.size.height = height;
  MidY = CGRectGetMidY(v68);
  v10 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", objc_msgSend(v3, "originalExifOrientation"));
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v10, x, y, width, height, MidX, MidY);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  Mutable = CGPathCreateMutable();
  if (Mutable)
  {
    v69.origin.x = v12;
    v69.origin.y = v14;
    v69.size.width = v16;
    v69.size.height = v18;
    v20 = CGRectGetMidX(v69);
    v70.origin.x = v12;
    v70.origin.y = v14;
    v70.size.width = v16;
    v70.size.height = v18;
    MinY = CGRectGetMinY(v70);
    CGPathMoveToPoint(Mutable, 0, v20, MinY);
    v71.origin.x = v12;
    v71.origin.y = v14;
    v71.size.width = v16;
    v71.size.height = v18;
    MinX = CGRectGetMinX(v71);
    v72.origin.x = v12;
    v72.origin.y = v14;
    v72.size.width = v16;
    v72.size.height = v18;
    v23 = CGRectGetMinY(v72);
    v73.origin.x = v12;
    v73.origin.y = v14;
    v73.size.width = v16;
    v73.size.height = v18;
    v59 = 0x3FD6666666666666;
    v24 = v23 + CGRectGetHeight(v73) * 0.35;
    v74.origin.x = v12;
    v74.origin.y = v14;
    v74.size.width = v16;
    v74.size.height = v18;
    v61 = MidX;
    v25 = CGRectGetMinX(v74);
    v75.origin.x = v12;
    v75.origin.y = v14;
    v75.size.width = v16;
    v75.size.height = v18;
    v60 = MidY;
    v26 = CGRectGetMinY(v75);
    v76.origin.x = v12;
    v76.origin.y = v14;
    v76.size.width = v16;
    v76.size.height = v18;
    v27 = CGRectGetHeight(v76);
    CGPathAddQuadCurveToPoint(Mutable, 0, MinX, v24, v25, v26 + v27 * 0.7);
    v77.origin.x = v12;
    v77.origin.y = v14;
    v77.size.width = v16;
    v77.size.height = v18;
    v28 = CGRectGetMinX(v77);
    v78.origin.x = v12;
    v78.origin.y = v14;
    v78.size.width = v16;
    v78.size.height = v18;
    v29 = v28 + CGRectGetWidth(v78) * 0.01;
    v79.origin.x = v12;
    v79.origin.y = v14;
    v79.size.width = v16;
    v79.size.height = v18;
    MaxY = CGRectGetMaxY(v79);
    v80.origin.x = v12;
    v80.origin.y = v14;
    v80.size.width = v16;
    v80.size.height = v18;
    v31 = CGRectGetMinX(v80);
    v81.origin.x = v12;
    v81.origin.y = v14;
    v81.size.width = v16;
    v81.size.height = v18;
    v32 = v31 + CGRectGetWidth(v81) * 0.25;
    v82.origin.x = v12;
    v82.origin.y = v14;
    v82.size.width = v16;
    v82.size.height = v18;
    v33 = CGRectGetMaxY(v82);
    CGPathAddQuadCurveToPoint(Mutable, 0, v29, MaxY, v32, v33);
    v83.origin.x = v12;
    v83.origin.y = v14;
    v83.size.width = v16;
    v83.size.height = v18;
    v34 = CGRectGetMidX(v83);
    v84.origin.x = v12;
    v84.origin.y = v14;
    v84.size.width = v16;
    v84.size.height = v18;
    v35 = CGRectGetMaxY(v84);
    v85.origin.x = v12;
    v85.origin.y = v14;
    v85.size.width = v16;
    v85.size.height = v18;
    v36 = CGRectGetMidX(v85);
    v86.origin.x = v12;
    v86.origin.y = v14;
    v86.size.width = v16;
    v86.size.height = v18;
    v37 = CGRectGetMinY(v86);
    v87.origin.x = v12;
    v87.origin.y = v14;
    v87.size.width = v16;
    v87.size.height = v18;
    v38 = CGRectGetHeight(v87);
    CGPathAddQuadCurveToPoint(Mutable, 0, v34, v35, v36, v37 + v38 * 0.7);
    v88.origin.x = v12;
    v88.origin.y = v14;
    v88.size.width = v16;
    v88.size.height = v18;
    v39 = CGRectGetMidX(v88);
    v89.origin.x = v12;
    v89.origin.y = v14;
    v89.size.width = v16;
    v89.size.height = v18;
    v40 = CGRectGetMaxY(v89);
    v90.origin.x = v12;
    v90.origin.y = v14;
    v90.size.width = v16;
    v90.size.height = v18;
    v41 = CGRectGetMinX(v90);
    v91.origin.x = v12;
    v91.origin.y = v14;
    v91.size.width = v16;
    v91.size.height = v18;
    v42 = v41 + CGRectGetWidth(v91) * 0.75;
    v92.origin.x = v12;
    v92.origin.y = v14;
    v92.size.width = v16;
    v92.size.height = v18;
    v43 = CGRectGetMaxY(v92);
    CGPathAddQuadCurveToPoint(Mutable, 0, v39, v40, v42, v43);
    v93.origin.x = v12;
    v93.origin.y = v14;
    v93.size.width = v16;
    v93.size.height = v18;
    MaxX = CGRectGetMaxX(v93);
    v94.origin.x = v12;
    v94.origin.y = v14;
    v94.size.width = v16;
    v94.size.height = v18;
    v45 = CGRectGetMaxY(v94);
    v95.origin.x = v12;
    v95.origin.y = v14;
    v95.size.width = v16;
    v95.size.height = v18;
    v46 = CGRectGetMaxX(v95);
    v96.origin.x = v12;
    v96.origin.y = v14;
    v96.size.width = v16;
    v96.size.height = v18;
    v47 = CGRectGetMinY(v96);
    v97.origin.x = v12;
    v97.origin.y = v14;
    v97.size.width = v16;
    v97.size.height = v18;
    v48 = CGRectGetHeight(v97);
    CGPathAddQuadCurveToPoint(Mutable, 0, MaxX, v45, v46, v47 + v48 * 0.7);
    v98.origin.x = v12;
    v98.origin.y = v14;
    v98.size.width = v16;
    v98.size.height = v18;
    v49 = CGRectGetMaxX(v98);
    v99.origin.x = v12;
    v99.origin.y = v14;
    v99.size.width = v16;
    v99.size.height = v18;
    v50 = CGRectGetMinY(v99);
    v100.origin.x = v12;
    v100.origin.y = v14;
    v100.size.width = v16;
    v100.size.height = v18;
    v51 = v50 + CGRectGetHeight(v100) * 0.35;
    v101.origin.x = v12;
    v101.origin.y = v14;
    v101.size.width = v16;
    v101.size.height = v18;
    v52 = CGRectGetMidX(v101);
    v102.origin.x = v12;
    v102.origin.y = v14;
    v102.size.width = v16;
    v102.size.height = v18;
    v53 = CGRectGetMinY(v102);
    v54 = v49;
    v55 = v51;
    MidY = v60;
    MidX = v61;
    CGPathAddQuadCurveToPoint(Mutable, 0, v54, v55, v52, v53);
    CGPathCloseSubpath(Mutable);
  }
  v56 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v66.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v66.c = v56;
  *(_OWORD *)&v66.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  if (objc_msgSend(v3, "verticallyFlipped", v59))
  {
    objc_msgSend(v3, "rectangle");
    +[AKGeometryHelper verticalFlipTransformForRect:](AKGeometryHelper, "verticalFlipTransformForRect:");
    t1 = v66;
    CGAffineTransformConcat(&v66, &t1, &t2);
  }
  +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", v10, MidX, MidY);
  v62 = v66;
  CGAffineTransformConcat(&t1, &v62, &v63);
  v66 = t1;
  if (Mutable)
  {
    v57 = (CGPath *)MEMORY[0x22E2C0A54](Mutable, &v66);
    CGPathRelease(Mutable);
  }
  else
  {
    v57 = 0;
  }

  return v57;
}

@end
