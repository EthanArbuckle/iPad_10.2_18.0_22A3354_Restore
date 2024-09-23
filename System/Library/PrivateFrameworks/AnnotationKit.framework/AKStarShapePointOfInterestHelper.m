@implementation AKStarShapePointOfInterestHelper

+ (unint64_t)maxPolygonPoints
{
  return 20;
}

+ (unint64_t)minPolygonPoints
{
  return 3;
}

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  id v7;
  id v8;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  uint64_t v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  float64x2_t v46;
  objc_super v49;
  id v50;
  id v51[2];
  CGRect v52;
  CGRect v53;

  v50 = 0;
  v51[0] = 0;
  v49.receiver = a1;
  v49.super_class = (Class)&OBJC_METACLASS___AKStarShapePointOfInterestHelper;
  v7 = a6;
  v8 = a5;
  objc_msgSendSuper2(&v49, sel__concretePointsOfInterest_withVisualStyle_ofAnnotation_pageControllerForPixelAlignment_, v51, &v50, v8, v7);
  v9 = v51[0];
  v10 = v50;
  objc_msgSend(v8, "rectangle");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v8, "rotationAngle");
  +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", v12, v14, v16, v18, v19);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count") + 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v10, "count") + 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKStarAnnotationRenderer innerStarPoints:](AKStarAnnotationRenderer, "innerStarPoints:", v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndex:", objc_msgSend(v8, "pointCount") - 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "akPointValue");
  v25 = v24;
  v27 = v26;

  objc_msgSend(v8, "rectangle");
  x = v52.origin.x;
  y = v52.origin.y;
  width = v52.size.width;
  height = v52.size.height;
  MidX = CGRectGetMidX(v52);
  v53.origin.x = x;
  v53.origin.y = y;
  v53.size.width = width;
  v53.size.height = height;
  MidY = CGRectGetMidY(v53);
  v34 = objc_msgSend(v8, "originalExifOrientation");

  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", v34), v25, v27, MidX, MidY);
  v46 = vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, v35), (float64x2_t)0, v36));
  objc_msgSend(v7, "geometryHelper");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "screenPixelAlignedPointForPoint:", *(_OWORD *)&v46);
  v39 = v38;
  v41 = v40;

  objc_msgSend(MEMORY[0x24BDD1968], "akValueWithPoint:", v39, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v42);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v43);

  objc_msgSend(v20, "addObjectsFromArray:", v9);
  objc_msgSend(v21, "addObjectsFromArray:", v10);
  v44 = objc_retainAutorelease(v20);
  *a3 = v44;
  v45 = objc_retainAutorelease(v21);
  *a4 = v45;

}

+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5
{
  objc_super v6;

  if (!a3)
    return 16;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKStarShapePointOfInterestHelper;
  return (unint64_t)objc_msgSendSuper2(&v6, sel__concreteDraggableAreaForPointOfInterestWithIndex_ofAnnotation_onPageController_, a3 - 1, a4, a5);
}

@end
