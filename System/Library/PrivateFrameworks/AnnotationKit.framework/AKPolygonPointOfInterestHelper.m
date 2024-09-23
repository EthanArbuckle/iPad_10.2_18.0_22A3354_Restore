@implementation AKPolygonPointOfInterestHelper

+ (unint64_t)maxPolygonPoints
{
  return 12;
}

+ (unint64_t)minPolygonPoints
{
  return 3;
}

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
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
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  double v37;
  double v38;
  objc_super v39;
  id v40;
  id v41;

  v40 = 0;
  v41 = 0;
  v39.receiver = a1;
  v39.super_class = (Class)&OBJC_METACLASS___AKPolygonPointOfInterestHelper;
  v10 = a6;
  v11 = a5;
  objc_msgSendSuper2(&v39, sel__concretePointsOfInterest_withVisualStyle_ofAnnotation_pageControllerForPixelAlignment_, &v41, &v40, v11, v10);
  v12 = v41;
  v13 = v40;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v12, "count") + 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v13, "count") + 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pointForPointsControlOfPolygonWithNumberOfPoints:inAnnotation:onPageController:", objc_msgSend(v11, "pointCount"), v11, v10);
  v37 = v17;
  v38 = v16;
  objc_msgSend(v11, "rectangle");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(v11, "rotationAngle");
  v27 = v26;

  +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", v19, v21, v23, v25, v27);
  objc_msgSend(v10, "geometryHelper");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "screenPixelAlignedPointForPoint:", vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, v37), (float64x2_t)0, v38)));
  v30 = v29;
  v32 = v31;

  objc_msgSend(MEMORY[0x24BDD1968], "akValueWithPoint:", v30, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v33);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v34);

  objc_msgSend(v14, "addObjectsFromArray:", v12);
  objc_msgSend(v15, "addObjectsFromArray:", v13);
  v35 = objc_retainAutorelease(v14);
  *a3 = v35;
  v36 = objc_retainAutorelease(v15);
  *a4 = v36;

}

+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5
{
  objc_super v6;

  if (!a3)
    return 17;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKPolygonPointOfInterestHelper;
  return (unint64_t)objc_msgSendSuper2(&v6, sel__concreteDraggableAreaForPointOfInterestWithIndex_ofAnnotation_onPageController_, a3 - 1, a4, a5);
}

+ (CGPoint)_concreteValidatePoint:(CGPoint)a3 ofDraggableArea:(unint64_t)a4 forAnnotation:(id)a5 onPageController:(id)a6
{
  double y;
  double x;
  id v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v11 = a5;
  v12 = a6;
  if (a4 == 17)
  {
    v13 = objc_msgSend(a1, "numberOfPolygonPointsForControlPoint:inAnnotation:onPageController:", v11, v12, x, y);
    v14 = objc_msgSend(a1, "minPolygonPoints");
    v15 = objc_msgSend(a1, "maxPolygonPoints");
    if (v13 >= v15)
      v16 = v15;
    else
      v16 = v13;
    if (v13 >= v14)
      v17 = v16;
    else
      v17 = v14;
    v18 = objc_msgSend(v11, "pointCount");
    if (v18 == objc_msgSend(a1, "minPolygonPoints") && v17 != objc_msgSend(a1, "minPolygonPoints") + 1)
    {
      v20 = objc_msgSend(a1, "minPolygonPoints");
    }
    else
    {
      v19 = objc_msgSend(v11, "pointCount");
      if (v19 != objc_msgSend(a1, "maxPolygonPoints") || v17 == objc_msgSend(a1, "maxPolygonPoints") - 1)
        goto LABEL_15;
      v20 = objc_msgSend(a1, "maxPolygonPoints");
    }
    v17 = v20;
LABEL_15:
    objc_msgSend(a1, "_pointForPointsControlOfPolygonWithNumberOfPoints:inAnnotation:onPageController:", v17, v11, v12);
    x = v21;
    y = v22;
  }

  v23 = x;
  v24 = y;
  result.y = v24;
  result.x = v23;
  return result;
}

+ (double)pointsControlPointDistanceFactor
{
  return 0.707106781;
}

+ (unint64_t)numberOfPolygonPointsForControlPoint:(CGPoint)a3 inAnnotation:(id)a4 onPageController:(id)a5
{
  id v7;
  id v8;
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
  double v25;
  __int128 v26;
  float64x2_t v27;
  long double v28;
  double v29;
  float64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  double x;
  __int128 v43;
  double y;
  double v45;
  double v46;

  y = a3.y;
  x = a3.x;
  v7 = a5;
  v8 = a4;
  objc_msgSend(v8, "rectangle");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  LODWORD(a4) = objc_msgSend(v8, "verticallyFlipped");

  +[AKGeometryHelper convertModelToScreenOrientationForRect:withPageController:](AKGeometryHelper, "convertModelToScreenOrientationForRect:withPageController:", v7, v10, v12, v14, v16);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  +[AKGeometryHelper convertModelToScreenOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertModelToScreenOrientationForPoint:relativeToRect:withPageController:", v7, x, y, v10, v12, v14, v16);
  v43 = v26;
  v45 = v25;

  +[AKGeometryHelper ellipseToCenteredCircleTransform:](AKGeometryHelper, "ellipseToCenteredCircleTransform:", v18, v20, v22, v24);
  v27 = vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, *(double *)&v43), (float64x2_t)0, v45));
  v28 = v27.f64[1];
  if ((_DWORD)a4)
  {
    v46 = v27.f64[0];
    +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:", v18, v20, v22, v24);
    +[AKGeometryHelper flipPointVertically:inRect:](AKGeometryHelper, "flipPointVertically:inRect:", v46, (double)v28, -v29, -v29, v29 + v29, v29 + v29);
    v27.f64[0] = v30;
    v28 = v31;
  }
  v32 = atan2(v28, v27.f64[0]) * 180.0 / 3.14159265;
  if (v32 <= 90.0)
    v33 = v32 + -90.0;
  else
    v33 = v32 + -90.0 + -360.0;
  v34 = fabs(v33);
  if (v34 >= 359.0)
    v35 = 0.0;
  else
    v35 = v34;
  objc_msgSend(a1, "_degreesBetweenPointsForPointsControl", v43);
  v37 = vcvtad_u64_f64(v35 / v36) + 3;
  v38 = objc_msgSend(a1, "minPolygonPoints");
  v39 = objc_msgSend(a1, "maxPolygonPoints");
  if (v37 >= v39)
    v40 = v39;
  else
    v40 = v37;
  if (v37 >= v38)
    return v40;
  else
    return v38;
}

+ (double)_degreesBetweenPointsForPointsControl
{
  return 360.0 / (double)(unint64_t)(objc_msgSend(a1, "maxPolygonPoints") - 2);
}

+ (double)_degreesForPointsControlGivenPolygonWithNumberOfPoints:(unint64_t)a3
{
  double v4;

  objc_msgSend(a1, "_degreesBetweenPointsForPointsControl");
  return 90.0 - ((double)a3 + -3.0) * v4;
}

+ (CGPoint)_pointForPointsControlOfPolygonWithNumberOfPoints:(unint64_t)a3 inAnnotation:(id)a4 onPageController:(id)a5
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  __double2 v32;
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
  CGPoint result;

  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "rectangle");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  LODWORD(a4) = objc_msgSend(v9, "verticallyFlipped");

  +[AKGeometryHelper convertModelToScreenOrientationForRect:withPageController:](AKGeometryHelper, "convertModelToScreenOrientationForRect:withPageController:", v8, v11, v13, v15, v17);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(a1, "pointsControlPointDistanceFactor");
  v27 = v26;
  +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:", v19, v21, v23, v25);
  v29 = v27 * v28;
  objc_msgSend(a1, "_degreesForPointsControlGivenPolygonWithNumberOfPoints:", a3);
  v32 = __sincos_stret(v30 * 3.14159265 / 180.0);
  v33 = v29 * v32.__sinval;
  if ((_DWORD)a4)
  {
    +[AKGeometryHelper flipPointVertically:inRect:](AKGeometryHelper, "flipPointVertically:inRect:", v29 * v32.__cosval, v33, -v29, -v29, v29 + v29, v29 + v29);
    v42 = v34;
  }
  else
  {
    v42 = v29 * v32.__cosval;
  }
  +[AKGeometryHelper centeredCircleToEllipseTransform:](AKGeometryHelper, "centeredCircleToEllipseTransform:", v19, v21, v23, v25, *(_QWORD *)&v33, v31);
  +[AKGeometryHelper convertScreenToModelOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertScreenToModelOrientationForPoint:relativeToRect:withPageController:", v8, vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, v41), (float64x2_t)0, v42)), v19, v21, v23, v25);
  v36 = v35;
  v38 = v37;

  v39 = v36;
  v40 = v38;
  result.y = v40;
  result.x = v39;
  return result;
}

@end
