@implementation AKFourPointRectangularPointOfInterestHelper

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double x;
  double y;
  double width;
  double height;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double MinX;
  double MaxX;
  double MinY;
  double MaxY;
  id v44;
  id v45;
  float64x2_t v46;
  double v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v9 = a6;
  v10 = (void *)MEMORY[0x24BDBCEB8];
  v11 = a5;
  objc_msgSend(v10, "arrayWithCapacity:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rectangle");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v47 = 0.0;
  v22 = +[AKGeometryHelper annotationHasRotation:outAngle:](AKGeometryHelper, "annotationHasRotation:outAngle:", v11, &v47);
  +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", v15, v17, v19, v21, v47, 0, 0, 0, 0, 0, 0);
  +[AKAnnotationRenderer draggingBoundsInsetsForAnnotation:](AKAnnotationRenderer, "draggingBoundsInsetsForAnnotation:", v11);
  v24 = v23;
  v26 = v25;

  v48.origin.x = v15;
  v48.origin.y = v17;
  v48.size.width = v19;
  v48.size.height = v21;
  v49 = CGRectInset(v48, v24, v26);
  x = v49.origin.x;
  y = v49.origin.y;
  width = v49.size.width;
  height = v49.size.height;
  if ((v22 & 1) == 0)
  {
    objc_msgSend(v9, "geometryHelper");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "screenPixelAlignedRectForRect:", x, y, width, height);
    x = v32;
    y = v33;
    width = v34;
    height = v35;

  }
  +[AKGeometryHelper convertModelToScreenOrientationForRect:withPageController:](AKGeometryHelper, "convertModelToScreenOrientationForRect:withPageController:", v9, x, y, width, height);
  v36 = v50.origin.x;
  v37 = v50.origin.y;
  v38 = v50.size.width;
  v39 = v50.size.height;
  MinX = CGRectGetMinX(v50);
  v51.origin.x = v36;
  v51.origin.y = v37;
  v51.size.width = v38;
  v51.size.height = v39;
  MaxX = CGRectGetMaxX(v51);
  v52.origin.x = v36;
  v52.origin.y = v37;
  v52.size.width = v38;
  v52.size.height = v39;
  MinY = CGRectGetMinY(v52);
  v53.origin.x = v36;
  v53.origin.y = v37;
  v53.size.width = v38;
  v53.size.height = v39;
  MaxY = CGRectGetMaxY(v53);
  sub_2290722E8(v9, v22, &v46, v12, v13, MaxX, MinY, v36, v37, v38, v39);
  sub_2290722E8(v9, v22, &v46, v12, v13, MinX, MinY, v36, v37, v38, v39);
  sub_2290722E8(v9, v22, &v46, v12, v13, MaxX, MaxY, v36, v37, v38, v39);
  sub_2290722E8(v9, v22, &v46, v12, v13, MinX, MaxY, v36, v37, v38, v39);
  v44 = objc_retainAutorelease(v12);
  *a3 = v44;
  v45 = objc_retainAutorelease(v13);
  *a4 = v45;

}

+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5
{
  if (a3 > 3)
    return 0;
  else
    return qword_229092FA0[a3];
}

@end
