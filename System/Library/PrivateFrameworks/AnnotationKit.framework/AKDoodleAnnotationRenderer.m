@implementation AKDoodleAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  id v3;
  double v4;
  double x;
  double v6;
  double y;
  double v8;
  double width;
  double v10;
  double height;
  double v12;
  CGFloat v13;
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
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect result;

  v3 = a3;
  objc_msgSend(v3, "rectangle");
  x = v4;
  y = v6;
  width = v8;
  height = v10;
  if ((objc_msgSend(v3, "pathIsPrestroked") & 1) == 0)
  {
    objc_msgSend(v3, "strokeWidth");
    v13 = -v12;
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    v36 = CGRectInset(v35, v13, v13);
    x = v36.origin.x;
    y = v36.origin.y;
    width = v36.size.width;
    height = v36.size.height;
  }
  objc_msgSend(v3, "rotationAngle");
  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", x, y, width, height, v14);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  if (objc_msgSend(v3, "hasShadow"))
  {
    +[AKAnnotationRendererUtilities outsetRectForShadow:onAnnotation:](AKAnnotationRendererUtilities, "outsetRectForShadow:onAnnotation:", v3, v16, v18, v20, v22);
    v16 = v23;
    v18 = v24;
    v20 = v25;
    v22 = v26;
  }
  v37.origin.x = v16;
  v37.origin.y = v18;
  v37.size.width = v20;
  v37.size.height = v22;
  v38 = CGRectInset(v37, -1.0, -1.0);
  v27 = v38.origin.x;
  v28 = v38.origin.y;
  v29 = v38.size.width;
  v30 = v38.size.height;

  v31 = v27;
  v32 = v28;
  v33 = v29;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
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

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  int v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  void *v16;
  const CGPath *v17;
  void *v18;
  uint64_t v19;
  int64_t v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  CGPath *v26;
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
  int v38;
  id v39;
  CGColor *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  AKTSDShape *v45;
  CGAffineTransform v46[2];
  CGRect BoundingBox;
  CGRect v48;
  CGRect v49;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  CGContextSaveGState(a4);
  objc_msgSend(a1, "_transformContextToModelCoordinates:forAnnotation:forDisplay:pageControllerOrNil:", a4, v10, v7, v11);

  v12 = objc_msgSend(v10, "hasShadow");
  if (v12)
    +[AKAnnotationRendererUtilities beginShadowInContext:forAnnotation:](AKAnnotationRendererUtilities, "beginShadowInContext:forAnnotation:", a4, v10);
  CGContextSaveGState(a4);
  memset(&v46[1], 0, sizeof(CGAffineTransform));
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:hasRotation:](AKGeometryHelper, "rotationTransformForRectangularAnnotation:hasRotation:", v10, 0);
  v46[0] = v46[1];
  CGContextConcatCTM(a4, v46);
  objc_msgSend(v10, "rectangle");
  CGContextTranslateCTM(a4, v13, v14);
  objc_msgSend(v10, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v10, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (const CGPath *)objc_msgSend(v16, "newCGPathForPlatformBezierPath");

    if (v17)
    {
      objc_msgSend(v10, "strokeColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = objc_msgSend(v10, "originalExifOrientation");
        if (v19 != 1)
        {
          v20 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", v19);
          BoundingBox = CGPathGetBoundingBox(v17);
          x = BoundingBox.origin.x;
          y = BoundingBox.origin.y;
          width = BoundingBox.size.width;
          height = BoundingBox.size.height;
          MidX = CGRectGetMidX(BoundingBox);
          v48.origin.x = x;
          v48.origin.y = y;
          v48.size.width = width;
          v48.size.height = height;
          v26 = +[AKGeometryHelper newPathWithPath:applyingExifOrientation:aboutCenter:](AKGeometryHelper, "newPathWithPath:applyingExifOrientation:aboutCenter:", v17, v20, MidX, CGRectGetMidY(v48));
          CGPathRelease(v17);
          v17 = v26;
        }
        v49 = CGPathGetBoundingBox(v17);
        v27 = v49.origin.x;
        v28 = v49.origin.y;
        v29 = v49.size.width;
        v30 = v49.size.height;
        objc_msgSend(v10, "rectangle");
        v32 = v31 / fmax(v29, 0.0005);
        objc_msgSend(v10, "rectangle");
        v34 = v33 / fmax(v30, 0.0005);
        if (v32 >= v34)
          v35 = v34;
        else
          v35 = v32;
        if (v35 < 0.0005)
        {
          v35 = v32 >= v34 ? v32 : v34;
          if (v35 < 0.0005)
            v35 = 1.0;
        }
        objc_msgSend(v10, "strokeWidth");
        v37 = v36 / v35;
        v38 = objc_msgSend(v10, "pathIsPrestroked");
        objc_msgSend(v10, "strokeColor");
        v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v40 = (CGColor *)objc_msgSend(v39, "CGColor");
        if (v38)
        {
          CGContextSetFillColorWithColor(a4, v40);

        }
        else
        {
          CGContextSetStrokeColorWithColor(a4, v40);

          +[AKAnnotationRendererUtilities setStandardLineStateInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineStateInContext:forLineWidth:", a4, v37);
          if (objc_msgSend(v10, "isDashed"))
            +[AKAnnotationRendererUtilities setStandardLineDashInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineDashInContext:forLineWidth:", a4, v37);
        }
        CGContextScaleCTM(a4, v35, v35);
        CGContextTranslateCTM(a4, -v27, -v28);
        if ((objc_msgSend(v10, "pathIsPrestroked") & 1) != 0 || !objc_msgSend(v10, "brushStyle"))
        {
          CGContextAddPath(a4, v17);
          if (objc_msgSend(v10, "pathIsPrestroked"))
            CGContextFillPath(a4);
          else
            CGContextStrokePath(a4);
        }
        else
        {
          v41 = objc_msgSend(v10, "brushStyle");
          objc_msgSend(v10, "strokeColor");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          +[AKTSDBrushStroke strokeWithType:color:width:](AKTSDBrushStroke, "strokeWithType:color:width:", v41, v42, v37);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          +[AKTSDBezierPath bezierPathWithCGPath:](AKTSDBezierPath, "bezierPathWithCGPath:", v17);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_alloc_init(AKTSDShape);
          -[AKTSDShape setStroke:](v45, "setStroke:", v43);
          -[AKTSDShape setPath:](v45, "setPath:", v44);
          -[AKTSDShape drawInContext:](v45, "drawInContext:", a4);

        }
      }
    }
    CGPathRelease(v17);
  }
  CGContextRestoreGState(a4);
  if (v12)
    +[AKAnnotationRendererUtilities endShadowInContext:](AKAnnotationRendererUtilities, "endShadowInContext:", a4);
  CGContextRestoreGState(a4);

}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  CGFloat y;
  CGFloat x;
  id v8;
  void *v9;
  void *v10;
  const CGPath *v11;
  uint64_t v12;
  CGFloat v13;
  BOOL v14;
  int64_t v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat width;
  CGFloat height;
  double MidX;
  CGPath *v21;
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
  uint64_t v33;
  const CGPath *v34;
  double v35;
  double v36;
  CGPath *v37;
  CGFloat v38;
  const CGPath *v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  double v46;
  CGFloat v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGAffineTransform v54;
  CGAffineTransform v55;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v58;
  CGPoint v59;
  CGRect BoundingBox;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (const CGPath *)objc_msgSend(v10, "newCGPathForPlatformBezierPath");

    v12 = objc_msgSend(v8, "originalExifOrientation");
    v48 = x;
    v13 = y;
    if (v12 != 1)
    {
      v15 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", v12);
      BoundingBox = CGPathGetBoundingBox(v11);
      v16 = BoundingBox.origin.x;
      v17 = BoundingBox.origin.y;
      width = BoundingBox.size.width;
      height = BoundingBox.size.height;
      MidX = CGRectGetMidX(BoundingBox);
      v61.origin.x = v16;
      v61.origin.y = v17;
      v61.size.width = width;
      v61.size.height = height;
      v21 = +[AKGeometryHelper newPathWithPath:applyingExifOrientation:aboutCenter:](AKGeometryHelper, "newPathWithPath:applyingExifOrientation:aboutCenter:", v11, v15, MidX, CGRectGetMidY(v61));
      CGPathRelease(v11);
      v11 = v21;
    }
    v62 = CGPathGetBoundingBox(v11);
    v22 = v62.origin.x;
    v23 = v62.origin.y;
    v24 = v62.size.width;
    v25 = v62.size.height;
    objc_msgSend(v8, "rectangle");
    v27 = v26 / fmax(v24, 0.0005);
    objc_msgSend(v8, "rectangle");
    v29 = v28 / fmax(v25, 0.0005);
    if (v27 >= v29)
      v30 = v29;
    else
      v30 = v27;
    if (v30 < 0.0005)
    {
      v30 = v27 >= v29 ? v27 : v29;
      if (v30 < 0.0005)
        v30 = 1.0;
    }
    v51 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v58.a = *MEMORY[0x24BDBD8B8];
    v50 = *(_OWORD *)&v58.a;
    *(_OWORD *)&v58.c = v51;
    *(_OWORD *)&v58.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    v49 = *(_OWORD *)&v58.tx;
    CGAffineTransformMakeTranslation(&t2, -v22, -v23);
    *(_OWORD *)&t1.a = v50;
    *(_OWORD *)&t1.c = v51;
    *(_OWORD *)&t1.tx = v49;
    CGAffineTransformConcat(&v58, &t1, &t2);
    CGAffineTransformMakeScale(&v55, v30, v30);
    v54 = v58;
    CGAffineTransformConcat(&t1, &v54, &v55);
    v58 = t1;
    objc_msgSend(v8, "rectangle");
    CGAffineTransformMakeTranslation(&v53, v31, v32);
    v54 = v58;
    CGAffineTransformConcat(&t1, &v54, &v53);
    v58 = t1;
    v33 = MEMORY[0x22E2C0A54](v11, &v58);
    if (!v33)
    {
      v14 = 0;
LABEL_34:
      CGPathRelease(v11);
      goto LABEL_35;
    }
    v34 = (const CGPath *)v33;
    memset(&t1, 0, sizeof(t1));
    +[AKGeometryHelper rotationTransformForRectangularAnnotation:hasRotation:](AKGeometryHelper, "rotationTransformForRectangularAnnotation:hasRotation:", v8, 0);
    v52 = t1;
    CGAffineTransformInvert(&v54, &v52);
    t1 = v54;
    objc_msgSend(v8, "strokeWidth");
    if (v35 <= a5)
      v36 = a5;
    else
      v36 = v35;
    if (objc_msgSend(v8, "pathIsPrestroked"))
    {
      v59.x = v48;
      v59.y = v13;
      if (CGPathContainsPoint(v34, &t1, v59, 0))
      {
        v14 = 1;
LABEL_33:
        CGPathRelease(v34);
        goto LABEL_34;
      }
      if (objc_msgSend(v8, "pathIsDot"))
      {
        v63 = CGPathGetBoundingBox(v34);
        v41 = v63.origin.x;
        v42 = v63.origin.y;
        v43 = v63.size.width;
        v44 = v63.size.height;
        v45 = CGRectGetWidth(v63);
        if (v45 > a5)
          a5 = v45;
        v64.origin.x = v41;
        v64.origin.y = v42;
        v64.size.width = v43;
        v64.size.height = v44;
        v46 = CGRectGetMidX(v64);
        v65.origin.x = v41;
        v65.origin.y = v42;
        v65.size.width = v43;
        v65.size.height = v44;
        +[AKGeometryHelper rectWithSize:centeredAtPoint:](AKGeometryHelper, "rectWithSize:centeredAtPoint:", a5, a5, v46, CGRectGetMidY(v65));
        v37 = CGPathCreateWithEllipseInRect(v66, 0);
        goto LABEL_30;
      }
      v37 = +[AKAnnotationRendererUtilities newStandardStrokedBorderPathWithPath:withStrokeWidth:](AKAnnotationRendererUtilities, "newStandardStrokedBorderPathWithPath:withStrokeWidth:", v34, v36 * 0.5);
      if (v37)
      {
LABEL_30:
        v39 = v37;
        v38 = v48;
        v40 = v13;
        goto LABEL_31;
      }
    }
    else
    {
      v37 = +[AKAnnotationRendererUtilities newStandardStrokedBorderPathWithPath:withStrokeWidth:](AKAnnotationRendererUtilities, "newStandardStrokedBorderPathWithPath:withStrokeWidth:", v34, v36);
      v38 = v48;
      if (v37)
      {
        v39 = v37;
        v40 = v13;
LABEL_31:
        v14 = CGPathContainsPoint(v37, &t1, *(CGPoint *)&v38, 0);
        CGPathRelease(v39);
        goto LABEL_33;
      }
    }
    v14 = 0;
    goto LABEL_33;
  }
  v14 = 0;
LABEL_35:

  return v14;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  return 0;
}

@end
