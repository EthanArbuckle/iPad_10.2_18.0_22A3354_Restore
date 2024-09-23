@implementation AKStarAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGRect result;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___AKStarAnnotationRenderer;
  objc_msgSendSuper2(&v7, sel__concreteDrawingBoundsOfAnnotation_, a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGRect)_concreteTextBoundsOfAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4 optionalText:(id)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect result;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___AKStarAnnotationRenderer;
  objc_msgSendSuper2(&v9, sel__concreteTextBoundsOfAnnotation_withOptionalAnnotationRect_optionalText_, a3, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

+ (CGRect)_concreteRectangleForAnnotation:(id)a3 withTextBounds:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___AKStarAnnotationRenderer;
  objc_msgSendSuper2(&v8, sel__concreteRectangleForAnnotation_withTextBounds_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKStarAnnotationRenderer;
  objc_msgSendSuper2(&v6, sel__concreteRenderAnnotation_intoContext_forDisplay_pageControllerOrNil_, a3, a4, a5, a6);
}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKStarAnnotationRenderer;
  return objc_msgSendSuper2(&v6, sel__concretePointIsOnBorder_ofAnnotation_minimumBorderThickness_, a4, a3.x, a3.y, a5);
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___AKStarAnnotationRenderer;
  return objc_msgSendSuper2(&v5, sel__concretePointIsOnInside_ofAnnotation_, a4, a3.x, a3.y);
}

+ (double)defaultInnerRadiusForStar:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;

  v3 = a3;
  v4 = objc_msgSend(v3, "pointCount");
  objc_msgSend(v3, "rectangle");
  +[AKGeometryHelper verticesOfPolygonWithPointCount:inRect:rotation:flippedVertically:](AKGeometryHelper, "verticesOfPolygonWithPointCount:inRect:rotation:flippedVertically:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "akPointValue");
  v8 = v7;
  v10 = v9;

  objc_msgSend(v5, "objectAtIndex:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "akPointValue");
  v13 = v12;
  v15 = v14;

  objc_msgSend(v5, "objectAtIndex:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "akPointValue");
  v18 = v17;
  v20 = v19;

  v21 = v10;
  v22 = v8;
  if ((unint64_t)objc_msgSend(v3, "pointCount") >= 4)
  {
    objc_msgSend(v5, "objectAtIndex:", 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "akPointValue");
    v22 = v24;
    v21 = v25;

  }
  +[AKGeometryHelper intersectLineSegmentStartingAt:ending:withAnotherSegmentStartingAt:ending:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withAnotherSegmentStartingAt:ending:", v8, v10, v18, v20, v13, v15, v22, v21);
  v27 = v26;
  v29 = v28;
  objc_msgSend(v3, "rectangle");
  +[AKGeometryHelper ellipseToCenteredCircleTransform:](AKGeometryHelper, "ellipseToCenteredCircleTransform:");
  objc_msgSend(v3, "rectangle");
  +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:");
  v31 = hypot(v29 * 0.0 + 0.0 * v27 + 0.0, v29 * 0.0 + 0.0 * v27 + 0.0) / v30;

  return v31;
}

+ (double)innerRadiusFactorForPoint:(CGPoint)a3 inAnnotation:(id)a4 onPageController:(id)a5
{
  double y;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat width;
  CGFloat height;
  double MidX;
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
  double v31;
  double v32;
  double v33;
  double v34;
  BOOL v35;
  double result;
  double v37;
  double v38;
  double x;
  CGRect v40;
  CGRect v41;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  objc_msgSend(a1, "_innerStarPoints:withInnerRadiusFactor:", v7, 0.5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "akPointValue");
  v11 = v10;
  v13 = v12;

  objc_msgSend(v7, "rectangle");
  v14 = v40.origin.x;
  v15 = v40.origin.y;
  width = v40.size.width;
  height = v40.size.height;
  MidX = CGRectGetMidX(v40);
  v41.origin.x = v14;
  v41.origin.y = v15;
  v41.size.width = width;
  v41.size.height = height;
  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", objc_msgSend(v7, "originalExifOrientation")), v11, v13, MidX, CGRectGetMidY(v41));
  v37 = v20;
  v38 = v19;
  objc_msgSend(v7, "rectangle");
  +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:");
  v22 = v21;
  objc_msgSend(v7, "rectangle");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  +[AKGeometryHelper ellipseToCenteredCircleTransform:](AKGeometryHelper, "ellipseToCenteredCircleTransform:", v24, v26, v28, v30);
  +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, v37), (float64x2_t)0, v38)));
  v33 = (v31 * (y * 0.0 + 0.0 * x + 0.0) + (y * 0.0 + 0.0 * x + 0.0) * v32) / v22;
  v34 = 1.0;
  if (v33 <= 1.0)
    v34 = v33;
  v35 = v33 < 0.0;
  result = 0.0;
  if (!v35)
    return v34;
  return result;
}

+ (id)starPoints:(id)a3
{
  id v3;
  double x;
  double y;
  double width;
  double height;
  double MidX;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  CGRect v19;
  CGRect v20;

  v3 = a3;
  objc_msgSend(v3, "rectangle");
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  MidX = CGRectGetMidX(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", objc_msgSend(v3, "originalExifOrientation")), x, y, width, height, MidX, CGRectGetMidY(v20));
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = objc_msgSend(v3, "pointCount");

  return +[AKGeometryHelper verticesOfPolygonWithPointCount:inRect:rotation:flippedVertically:](AKGeometryHelper, "verticesOfPolygonWithPointCount:inRect:rotation:flippedVertically:", v17, 0, v10, v12, v14, v16, 0.0);
}

+ (id)innerStarPoints:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "innerRadiusFactor");
  objc_msgSend(a1, "_innerStarPoints:withInnerRadiusFactor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_innerStarPoints:(id)a3 withInnerRadiusFactor:(double)a4
{
  id v5;
  unint64_t v6;
  double x;
  double y;
  double width;
  double height;
  double MidX;
  double MidY;
  uint64_t v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v5 = a3;
  v6 = objc_msgSend(v5, "pointCount");
  objc_msgSend(v5, "rectangle");
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  MidX = CGRectGetMidX(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  MidY = CGRectGetMidY(v23);
  v13 = objc_msgSend(v5, "originalExifOrientation");

  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", v13), x, y, width, height, MidX, MidY);
  v14 = v24.origin.x;
  v15 = v24.origin.y;
  v16 = v24.size.width;
  v17 = v24.size.height;
  v18 = 1.0 - a4;
  v19 = (1.0 - a4) * CGRectGetHeight(v24) * 0.5;
  v25.origin.x = v14;
  v25.origin.y = v15;
  v25.size.width = v16;
  v25.size.height = v17;
  v20 = v18 * CGRectGetWidth(v25) * 0.5;
  v26.origin.x = v14;
  v26.origin.y = v15;
  v26.size.width = v16;
  v26.size.height = v17;
  v27 = CGRectInset(v26, v20, v19);
  return +[AKGeometryHelper verticesOfPolygonWithPointCount:inRect:rotation:flippedVertically:](AKGeometryHelper, "verticesOfPolygonWithPointCount:inRect:rotation:flippedVertically:", v6, 0, v27.origin.x, v27.origin.y, v27.size.width, v27.size.height, (double)(0x168 / v6) * 0.5);
}

+ (double)_segLengthOfStarWithPoints:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  v3 = a3;
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "akPointValue");
  v6 = v5;
  v8 = v7;

  objc_msgSend(v3, "objectAtIndex:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "akPointValue");
  v11 = v10;
  v13 = v12;

  objc_msgSend(v3, "objectAtIndex:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "akPointValue");
  v16 = v15;
  v18 = v17;

  objc_msgSend(v3, "objectAtIndex:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "akPointValue");
  v21 = v20;
  v23 = v22;

  +[AKGeometryHelper intersectLineSegmentStartingAt:ending:withAnotherSegmentStartingAt:ending:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withAnotherSegmentStartingAt:ending:", v6, v8, v11, v13, v16, v18, v21, v23);
  return hypot(v24 - v6, v25 - v8);
}

+ (CGPath)_newPathForAnnotation:(id)a3
{
  id v3;
  CGPath *Mutable;
  void *v5;
  void *v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  int64_t v13;
  unint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  CGRect v34;
  CGRect v35;

  v3 = a3;
  Mutable = CGPathCreateMutable();
  +[AKStarAnnotationRenderer starPoints:](AKStarAnnotationRenderer, "starPoints:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKStarAnnotationRenderer innerStarPoints:](AKStarAnnotationRenderer, "innerStarPoints:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rectangle");
  x = v34.origin.x;
  y = v34.origin.y;
  width = v34.size.width;
  height = v34.size.height;
  MidX = CGRectGetMidX(v34);
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  MidY = CGRectGetMidY(v35);
  v13 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", objc_msgSend(v3, "originalExifOrientation"));
  if (objc_msgSend(v3, "pointCount"))
  {
    v14 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "akPointValue");
      v17 = v16;
      v19 = v18;

      objc_msgSend(v6, "objectAtIndex:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "akPointValue");
      v22 = v21;
      v24 = v23;

      +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v13, v17, v19, MidX, MidY);
      v26 = v25;
      v28 = v27;
      +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v13, v22, v24, MidX, MidY);
      v30 = v29;
      v32 = v31;
      if (v14)
        CGPathAddLineToPoint(Mutable, 0, v26, v28);
      else
        CGPathMoveToPoint(Mutable, 0, v26, v28);
      CGPathAddLineToPoint(Mutable, 0, v30, v32);
      ++v14;
    }
    while (v14 < objc_msgSend(v3, "pointCount"));
  }
  CGPathCloseSubpath(Mutable);

  return Mutable;
}

@end
