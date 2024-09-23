@implementation AKTextBoxAnnotationRenderer

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
  id v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;
  double v13;
  CGSize result;

  v3 = a3;
  objc_msgSend(v3, "fillColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_3:
    v6 = *MEMORY[0x24BDBF148];
    v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
    goto LABEL_12;
  }
  objc_msgSend(v3, "strokeColor");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v3, "strokeWidth");
    v10 = v9;

    if (v10 > 0.0)
      goto LABEL_3;
  }
  v11 = +[AKGeometryHelper exifOrientationHasReversedAxes:](AKGeometryHelper, "exifOrientationHasReversedAxes:", objc_msgSend(v3, "originalExifOrientation"));
  if (v11)
    v5 = -5.0;
  else
    v5 = -1.0;
  if (v11)
    v6 = -1.0;
  else
    v6 = -5.0;
LABEL_12:

  v12 = v6;
  v13 = v5;
  result.height = v13;
  result.width = v12;
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
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  objc_msgSend(v9, "strokeWidth");
  v11 = v10;
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  if (CGRectIsEmpty(v29))
  {
    objc_msgSend(v9, "rectangle");
    x = v12;
    y = v13;
    width = v14;
    height = v15;
  }
  v16 = v11 * 0.5;
  objc_msgSend(v9, "originalModelBaseScaleFactor");
  v18 = v11 * 0.5 + v17 * 2.0;
  objc_msgSend(v9, "originalModelBaseScaleFactor");
  v20 = v16 + v19 * 2.0;
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  v31 = CGRectInset(v30, v18, v20);
  v21 = v31.origin.x;
  v22 = v31.origin.y;
  v23 = v31.size.width;
  v24 = v31.size.height;

  v25 = v21;
  v26 = v22;
  v27 = v23;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
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
  CGFloat v12;
  double v13;
  double v14;
  CGRect v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  objc_msgSend(v8, "strokeWidth");
  v10 = v9 * 0.5;
  objc_msgSend(v8, "originalModelBaseScaleFactor");
  v12 = -(v10 + v11 * 2.0);
  objc_msgSend(v8, "originalModelBaseScaleFactor");
  v14 = v13;

  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  return CGRectInset(v15, v12, -(v10 + v14 * 2.0));
}

+ (CGPath)_newConcreteTextExclusionPathForAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4
{
  return 0;
}

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  int v12;
  int *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  id v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  CGPathRef v35;
  const CGPath *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  AKTSDShape *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  id v46;
  void *v47;
  CGAffineTransform transform;
  CGAffineTransform v49;
  _BYTE v50[9];
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  CGContextSaveGState(a4);
  objc_msgSend(a1, "_transformContextToModelCoordinates:forAnnotation:forDisplay:pageControllerOrNil:", a4, v10, v7, v11);
  v12 = objc_msgSend(v10, "hasShadow");
  v13 = &OBJC_IVAR___AKSignaturesController__signaturesAlertViewController;
  if (v12)
    +[AKAnnotationRendererUtilities beginShadowInContext:forAnnotation:](AKAnnotationRendererUtilities, "beginShadowInContext:forAnnotation:", a4, v10);
  CGContextSaveGState(a4);
  v50[0] = 0;
  memset(&v49, 0, sizeof(v49));
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:hasRotation:](AKGeometryHelper, "rotationTransformForRectangularAnnotation:hasRotation:", v10, v50);
  transform = v49;
  CGContextConcatCTM(a4, &transform);
  CGContextSaveGState(a4);
  objc_msgSend(v10, "rectangle");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(v10, "highlightColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22 && v7)
  {
    objc_msgSend(v10, "highlightColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      goto LABEL_6;
LABEL_12:
    v24 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v10, "fillColor");
  v24 = (id)objc_claimAutoreleasedReturnValue();

  if (!v24)
    goto LABEL_13;
  objc_msgSend(v10, "fillColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
    goto LABEL_12;
LABEL_6:
  v24 = objc_retainAutorelease(v23);
  if (CGColorGetAlpha((CGColorRef)objc_msgSend(v24, "CGColor")) != 0.0)
  {
    v25 = v21;
    v26 = v19;
    v27 = v17;
    v28 = v15;
    if (!v50[0])
    {
      +[AKGeometryHelper renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:](AKGeometryHelper, "renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:", v11, a4, v10, v15, v17, v19, v21, 0.0);
      v28 = v29;
      v27 = v30;
      v26 = v31;
      v25 = v32;
    }
    v24 = objc_retainAutorelease(v24);
    CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v24, "CGColor"));
    v51.origin.x = v28;
    v51.origin.y = v27;
    v51.size.width = v26;
    v51.size.height = v25;
    CGContextFillRect(a4, v51);
  }
LABEL_13:
  objc_msgSend(v10, "strokeWidth");
  if (v33 > 0.0)
  {
    objc_msgSend(v10, "strokeColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      if (objc_msgSend(v10, "brushStyle"))
      {
        v52.origin.x = v15;
        v52.origin.y = v17;
        v52.size.width = v19;
        v52.size.height = v21;
        v35 = CGPathCreateWithRect(v52, 0);
        if (v35)
        {
          v36 = v35;
          +[AKTSDBezierPath bezierPathWithCGPath:](AKTSDBezierPath, "bezierPathWithCGPath:", v35);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v10, "brushStyle");
          objc_msgSend(v10, "strokeColor");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "strokeWidth");
          +[AKTSDBrushStroke strokeWithType:color:width:](AKTSDBrushStroke, "strokeWithType:color:width:", v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          v40 = objc_alloc_init(AKTSDShape);
          -[AKTSDShape setStroke:](v40, "setStroke:", v39);
          -[AKTSDShape setPath:](v40, "setPath:", v47);
          -[AKTSDShape drawInContext:](v40, "drawInContext:", a4);
          CGPathRelease(v36);

          v13 = &OBJC_IVAR___AKSignaturesController__signaturesAlertViewController;
        }
      }
      else
      {
        if (!v50[0])
        {
          objc_msgSend(v10, "strokeWidth");
          +[AKGeometryHelper renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:](AKGeometryHelper, "renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:", v11, a4, v10, v15, v17, v19, v21, v41);
          v15 = v42;
          v17 = v43;
          v19 = v44;
          v21 = v45;
        }
        objc_msgSend(v10, "strokeColor");
        v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend(v46, "CGColor"));

        objc_msgSend(v10, "strokeWidth");
        +[AKAnnotationRendererUtilities setStandardLineStateInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineStateInContext:forLineWidth:", a4);
        if (objc_msgSend(v10, "isDashed"))
        {
          objc_msgSend(v10, "strokeWidth");
          +[AKAnnotationRendererUtilities setStandardLineDashInContext:forLineWidth:](AKAnnotationRendererUtilities, "setStandardLineDashInContext:forLineWidth:", a4);
        }
        v53.origin.x = v15;
        v53.origin.y = v17;
        v53.size.width = v19;
        v53.size.height = v21;
        CGContextStrokeRect(a4, v53);
      }
    }
  }
  CGContextRestoreGState(a4);
  +[AKTextAnnotationRenderHelper renderAnnotationText:intoContext:isForScreen:pageControllerOrNil:](AKTextAnnotationRenderHelper, "renderAnnotationText:intoContext:isForScreen:pageControllerOrNil:", v10, a4, v7, v11);
  CGContextRestoreGState(a4);
  if (v12)
    objc_msgSend(v13 + 454, "endShadowInContext:", a4);
  CGContextRestoreGState(a4);

}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat width;
  CGFloat height;
  const CGPath *v26;
  BOOL v27;
  double v28;
  void *v29;
  void *v30;
  char v31;
  double v32;
  CGPath *v33;
  CGAffineTransform v35;
  char v36;
  CGPoint v37;
  CGPoint v38;
  CGPoint v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  objc_msgSend(v9, "rectangle");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(a1, "_concreteDraggingBoundsInsetsForAnnotation:", v9);
  v19 = v18;
  v21 = v20;
  v40.origin.x = v11;
  v40.origin.y = v13;
  v40.size.width = v15;
  v40.size.height = v17;
  v41 = CGRectInset(v40, v19, v21);
  v22 = v41.origin.x;
  v23 = v41.origin.y;
  width = v41.size.width;
  height = v41.size.height;
  v36 = 0;
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:hasRotation:](AKGeometryHelper, "rotationTransformForRectangularAnnotation:hasRotation:", v9, &v36, 0, 0, 0, 0, 0, 0);
  if (v36)
  {
    v42.origin.x = v22;
    v42.origin.y = v23;
    v42.size.width = width;
    v42.size.height = height;
    v26 = CGPathCreateWithRect(v42, &v35);
    v37.x = x;
    v37.y = y;
    if (CGPathContainsPoint(v26, 0, v37, 0))
    {
LABEL_3:
      v27 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    v43.origin.x = v22;
    v43.origin.y = v23;
    v43.size.width = width;
    v43.size.height = height;
    v39.x = x;
    v39.y = y;
    v26 = 0;
    if (CGRectContainsPoint(v43, v39))
      goto LABEL_3;
  }
  objc_msgSend(v9, "strokeWidth");
  if (v28 <= 0.0
    || (objc_msgSend(v9, "strokeColor"),
        v29 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(MEMORY[0x24BDF6950], "clearColor"),
        v30 = (void *)objc_claimAutoreleasedReturnValue(),
        v31 = objc_msgSend(v29, "akIsEqualToColor:", v30),
        v30,
        v29,
        (v31 & 1) != 0))
  {
    v27 = 0;
  }
  else
  {
    objc_msgSend(v9, "strokeWidth");
    if (v32 > a5)
      a5 = v32;
    if (!v26)
    {
      v44.origin.x = v22;
      v44.origin.y = v23;
      v44.size.width = width;
      v44.size.height = height;
      v26 = CGPathCreateWithRect(v44, &v35);
    }
    v33 = +[AKAnnotationRendererUtilities newStandardStrokedBorderPathWithPath:withStrokeWidth:](AKAnnotationRendererUtilities, "newStandardStrokedBorderPathWithPath:withStrokeWidth:", v26, a5);
    v38.x = x;
    v38.y = y;
    v27 = CGPathContainsPoint(v33, 0, v38, 0);
    CGPathRelease(v33);
  }
LABEL_13:
  CGPathRelease(v26);

  return v27;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  return 0;
}

@end
