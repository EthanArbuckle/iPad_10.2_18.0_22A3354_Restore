@implementation AKImageAnnotationRenderer

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
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect result;

  v3 = a3;
  objc_msgSend(v3, "rectangle");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "rotationAngle");
  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", v5, v7, v9, v11, v12);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  if (objc_msgSend(v3, "hasShadow"))
  {
    +[AKAnnotationRendererUtilities outsetRectForShadow:onAnnotation:](AKAnnotationRendererUtilities, "outsetRectForShadow:onAnnotation:", v3, v14, v16, v18, v20);
    v14 = v21;
    v16 = v22;
    v18 = v23;
    v20 = v24;
  }
  v33.origin.x = v14;
  v33.origin.y = v16;
  v33.size.width = v18;
  v33.size.height = v20;
  v34 = CGRectInset(v33, -1.0, -1.0);
  x = v34.origin.x;
  y = v34.origin.y;
  width = v34.size.width;
  height = v34.size.height;

  v29 = x;
  v30 = y;
  v31 = width;
  v32 = height;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
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
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double MidY;
  double v22;
  double v23;
  double v24;
  double v25;
  int64_t v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  void *v31;
  CGImage *v32;
  double MidX;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform transform;
  CGAffineTransform v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  CGContextSaveGState(a4);
  objc_msgSend(a1, "_transformContextToModelCoordinates:forAnnotation:forDisplay:pageControllerOrNil:", a4, v10, v7, v11);

  v12 = objc_msgSend(v10, "hasShadow");
  if (v12)
    +[AKAnnotationRendererUtilities beginShadowInContext:forAnnotation:](AKAnnotationRendererUtilities, "beginShadowInContext:forAnnotation:", a4, v10);
  CGContextSaveGState(a4);
  memset(&v40, 0, sizeof(v40));
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:hasRotation:](AKGeometryHelper, "rotationTransformForRectangularAnnotation:hasRotation:", v10, 0);
  transform = v40;
  CGContextConcatCTM(a4, &transform);
  objc_msgSend(v10, "rectangle");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  if ((objc_msgSend(v10, "horizontallyFlipped") & 1) != 0 || objc_msgSend(v10, "verticallyFlipped"))
  {
    v41.origin.x = v14;
    v41.origin.y = v16;
    v41.size.width = v18;
    v41.size.height = v20;
    MidX = CGRectGetMidX(v41);
    v42.origin.x = v14;
    v42.origin.y = v16;
    v42.size.width = v18;
    v42.size.height = v20;
    MidY = CGRectGetMidY(v42);
    CGAffineTransformMakeTranslation(&v38, MidX, MidY);
    CGContextConcatCTM(a4, &v38);
    if (objc_msgSend(v10, "horizontallyFlipped"))
      v22 = -1.0;
    else
      v22 = 1.0;
    if (objc_msgSend(v10, "verticallyFlipped"))
      v23 = -1.0;
    else
      v23 = 1.0;
    CGAffineTransformMakeScale(&v37, v22, v23);
    CGContextConcatCTM(a4, &v37);
    CGAffineTransformMakeTranslation(&v36, -MidX, -MidY);
    CGContextConcatCTM(a4, &v36);
  }
  CGAffineTransformMakeTranslation(&v35, v14, v16);
  CGContextConcatCTM(a4, &v35);
  v24 = *MEMORY[0x24BDBEFB0];
  v25 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v26 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", objc_msgSend(v10, "originalExifOrientation"));
  memset(&transform, 0, sizeof(transform));
  +[AKGeometryHelper affineTransformRecenteringAboutOriginForExifOrientation:withOriginalSize:](AKGeometryHelper, "affineTransformRecenteringAboutOriginForExifOrientation:withOriginalSize:", v26, v18, v20);
  v34 = transform;
  CGContextConcatCTM(a4, &v34);
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v26, v24, v25, v18, v20, v24, v25);
  v28 = v27;
  v30 = v29;
  objc_msgSend(v10, "image");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (CGImage *)objc_msgSend(v31, "akCGImage");

  CGContextSetInterpolationQuality(a4, kCGInterpolationHigh);
  v43.origin.x = v24;
  v43.origin.y = v25;
  v43.size.width = v28;
  v43.size.height = v30;
  CGContextDrawImage(a4, v43, v32);
  CGContextRestoreGState(a4);
  if (v12)
    +[AKAnnotationRendererUtilities endShadowInContext:](AKAnnotationRendererUtilities, "endShadowInContext:", a4);
  CGContextRestoreGState(a4);

}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  return 0;
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v6;
  const CGPath *v7;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGAffineTransform m;
  CGPoint v12;
  CGRect v13;

  y = a3.y;
  x = a3.x;
  v6 = a4;
  objc_msgSend(v6, "rectangle");
  v7 = CGPathCreateWithRect(v13, 0);
  memset(&m, 0, sizeof(m));
  +[AKGeometryHelper rotationTransformForRectangularAnnotation:hasRotation:](AKGeometryHelper, "rotationTransformForRectangularAnnotation:hasRotation:", v6, 0);

  v9 = m;
  CGAffineTransformInvert(&v10, &v9);
  m = v10;
  v12.x = x;
  v12.y = y;
  LOBYTE(v6) = CGPathContainsPoint(v7, &m, v12, 0);
  CGPathRelease(v7);
  return (char)v6;
}

@end
