@implementation AKEightPointRectangularPointOfInterestHelper

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  double x;
  double y;
  double width;
  double height;
  double v17;
  double v18;
  double v19;
  double v20;
  int v21;
  float64x2_t v22;
  double MidX;
  double MidY;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double MinX;
  double MaxX;
  double MinY;
  double MaxY;
  id v63;
  id v64;
  double v65;
  double v66;
  double v67;
  double v68;
  float64x2_t v69[3];
  double v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v9 = a5;
  v10 = a6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rectangle");
  x = v71.origin.x;
  y = v71.origin.y;
  width = v71.size.width;
  height = v71.size.height;
  if (CGRectIsInfinite(v71))
  {
    objc_msgSend(v10, "maxPageRect");
    x = v17;
    y = v18;
    width = v19;
    height = v20;
  }
  v70 = 0.0;
  v21 = +[AKGeometryHelper annotationHasRotation:outAngle:](AKGeometryHelper, "annotationHasRotation:outAngle:", v9, &v70);
  v22 = *(float64x2_t *)(MEMORY[0x24BDBD8B8] + 16);
  v69[0] = *(float64x2_t *)MEMORY[0x24BDBD8B8];
  v69[1] = v22;
  v69[2] = *(float64x2_t *)(MEMORY[0x24BDBD8B8] + 32);
  if ((v21 & 1) != 0)
    +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", x, y, width, height, v70);
  v72.origin.x = x;
  v72.origin.y = y;
  v72.size.width = width;
  v72.size.height = height;
  MidX = CGRectGetMidX(v72);
  v73.origin.x = x;
  v73.origin.y = y;
  v73.size.width = width;
  v73.size.height = height;
  MidY = CGRectGetMidY(v73);
  v25 = MidY;
  if ((v21 & 1) != 0)
  {
    v67 = MidX;
    +[AKAnnotationRenderer draggingBoundsInsetsForAnnotation:](AKAnnotationRenderer, "draggingBoundsInsetsForAnnotation:", v9, *(_QWORD *)&MidY);
  }
  else
  {
    objc_msgSend(v10, "geometryHelper");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "screenPixelAlignedPointForPoint:", MidX, v25);
    v30 = v29;
    v32 = v31;

    objc_opt_class();
    v67 = v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "strokeWidth");
      +[AKGeometryHelper renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:](AKGeometryHelper, "renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:", v10, 0, 0, x, y, width, height, v33);
      x = v34;
      y = v35;
      width = v36;
      height = v37;
    }
    +[AKAnnotationRenderer draggingBoundsInsetsForAnnotation:](AKAnnotationRenderer, "draggingBoundsInsetsForAnnotation:", v9, v32);
  }
  v38 = v26;
  v39 = v27;
  v74.origin.x = x;
  v74.origin.y = y;
  v74.size.width = width;
  v74.size.height = height;
  v75 = CGRectInset(v74, v38, v39);
  v40 = v75.origin.x;
  v41 = v75.origin.y;
  v42 = v75.size.width;
  v43 = v75.size.height;
  if ((v21 & 1) == 0)
  {
    objc_msgSend(v10, "geometryHelper");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "screenPixelAlignedRectForRect:", v40, v41, v42, v43);
    v40 = v45;
    v41 = v46;
    v42 = v47;
    v43 = v48;

  }
  +[AKGeometryHelper convertModelToScreenOrientationForRect:withPageController:](AKGeometryHelper, "convertModelToScreenOrientationForRect:withPageController:", v10, v40, v41, v42, v43);
  v50 = v49;
  v52 = v51;
  v54 = v53;
  v56 = v55;
  +[AKGeometryHelper convertModelToScreenOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertModelToScreenOrientationForPoint:relativeToRect:withPageController:", v10, v67, v65, v40, v41, v42, v43);
  v66 = v58;
  v68 = v57;
  v76.origin.x = v50;
  v76.origin.y = v52;
  v76.size.width = v54;
  v76.size.height = v56;
  MinX = CGRectGetMinX(v76);
  v77.origin.x = v50;
  v77.origin.y = v52;
  v77.size.width = v54;
  v77.size.height = v56;
  MaxX = CGRectGetMaxX(v77);
  v78.origin.x = v50;
  v78.origin.y = v52;
  v78.size.width = v54;
  v78.size.height = v56;
  MinY = CGRectGetMinY(v78);
  v79.origin.x = v50;
  v79.origin.y = v52;
  v79.size.width = v54;
  v79.size.height = v56;
  MaxY = CGRectGetMaxY(v79);
  if (objc_msgSend(v9, "conformsToAKTextAnnotationProtocol")
    && objc_msgSend(v9, "textIsClipped"))
  {
    sub_228FF8750(2, v10, v21, v69, v11, v12, v68, MinY, v50, v52, v54, v56);
  }
  sub_228FF8750(0, v10, v21, v69, v11, v12, MaxX, MinY, v50, v52, v54, v56);
  sub_228FF8750(0, v10, v21, v69, v11, v12, MaxX, MaxY, v50, v52, v54, v56);
  sub_228FF8750(0, v10, v21, v69, v11, v12, MinX, MinY, v50, v52, v54, v56);
  sub_228FF8750(0, v10, v21, v69, v11, v12, MinX, MaxY, v50, v52, v54, v56);
  sub_228FF8750(0, v10, v21, v69, v11, v12, MinX, v66, v50, v52, v54, v56);
  sub_228FF8750(0, v10, v21, v69, v11, v12, v68, MinY, v50, v52, v54, v56);
  sub_228FF8750(0, v10, v21, v69, v11, v12, v68, MaxY, v50, v52, v54, v56);
  sub_228FF8750(0, v10, v21, v69, v11, v12, MaxX, v66, v50, v52, v54, v56);
  v63 = objc_retainAutorelease(v11);
  *a3 = v63;
  v64 = objc_retainAutorelease(v12);
  *a4 = v64;

}

+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5
{
  id v6;
  int v7;
  unint64_t v8;

  v6 = a4;
  if (!objc_msgSend(v6, "conformsToAKTextAnnotationProtocol"))
  {
    v8 = a3;
LABEL_10:
    if (v8 > 7)
      a3 = 0;
    else
      a3 = qword_2290928E8[v8];
    goto LABEL_13;
  }
  v7 = objc_msgSend(v6, "textIsClipped");
  v8 = a3 - 1;
  if (!a3)
    v8 = 0;
  if (!v7)
    v8 = a3;
  if (a3 || (v7 & 1) == 0)
    goto LABEL_10;
LABEL_13:

  return a3;
}

@end
