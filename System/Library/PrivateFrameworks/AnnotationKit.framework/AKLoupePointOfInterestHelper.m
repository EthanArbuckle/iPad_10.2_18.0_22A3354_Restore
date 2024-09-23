@implementation AKLoupePointOfInterestHelper

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
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
  double MidX;
  __double2 v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v9 = (void *)MEMORY[0x24BDBCEB8];
  v10 = a6;
  v11 = a5;
  objc_msgSend(v9, "arrayWithCapacity:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rectangle");
  +[AKGeometryHelper convertModelToScreenOrientationForRect:withPageController:](AKGeometryHelper, "convertModelToScreenOrientationForRect:withPageController:", v10);
  x = v54.origin.x;
  y = v54.origin.y;
  width = v54.size.width;
  height = v54.size.height;
  v18 = CGRectGetWidth(v54);
  v55.origin.x = x;
  v55.origin.y = y;
  v55.size.width = width;
  v55.size.height = height;
  v19 = CGRectGetHeight(v55);
  objc_msgSend(v11, "magnification");
  v21 = v20;

  v22 = (v21 + -1.5) / 3.5;
  v23 = 1.57079633;
  if (v22 <= 1.0)
    v23 = v22 * 1.57079633;
  if (v22 >= 0.0)
    v24 = v23;
  else
    v24 = 0.0;
  v25 = v19 * 0.5;
  v26 = v18 * 0.5;
  v56.origin.x = x;
  v56.origin.y = y;
  v56.size.width = width;
  v56.size.height = height;
  MidX = CGRectGetMidX(v56);
  v28 = __sincos_stret(v24);
  v57.origin.x = x;
  v57.origin.y = y;
  v57.size.width = width;
  v57.size.height = height;
  +[AKGeometryHelper convertScreenToModelOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertScreenToModelOrientationForPoint:relativeToRect:withPageController:", v10, MidX + v28.__sinval * v26, CGRectGetMidY(v57) + v28.__cosval * v25, x, y, width, height);
  v30 = v29;
  v32 = v31;
  objc_msgSend(v10, "geometryHelper");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "screenPixelAlignedPointForPoint:", v30, v32);
  v35 = v34;
  v37 = v36;

  objc_msgSend(MEMORY[0x24BDD1968], "akValueWithPoint:", v35, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v38);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v39);

  v58.origin.x = x;
  v58.origin.y = y;
  v58.size.width = width;
  v58.size.height = height;
  v40 = CGRectGetMidX(v58) + v26 * 0.707106781;
  v59.origin.x = x;
  v59.origin.y = y;
  v59.size.width = width;
  v59.size.height = height;
  +[AKGeometryHelper convertScreenToModelOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertScreenToModelOrientationForPoint:relativeToRect:withPageController:", v10, v40, CGRectGetMidY(v59) + v25 * -0.707106781, x, y, width, height);
  v42 = v41;
  v44 = v43;
  objc_msgSend(v10, "geometryHelper");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v45, "screenPixelAlignedPointForPoint:", v42, v44);
  v47 = v46;
  v49 = v48;

  objc_msgSend(MEMORY[0x24BDD1968], "akValueWithPoint:", v47, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v50);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v51);

  v53 = objc_retainAutorelease(v12);
  *a3 = v53;
  v52 = objc_retainAutorelease(v13);
  *a4 = v52;

}

+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5
{
  unint64_t v5;

  v5 = 18;
  if (a3 != 1)
    v5 = 0;
  if (a3)
    return v5;
  else
    return 19;
}

@end
