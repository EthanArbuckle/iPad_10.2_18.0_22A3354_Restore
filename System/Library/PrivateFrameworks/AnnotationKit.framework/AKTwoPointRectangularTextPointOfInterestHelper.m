@implementation AKTwoPointRectangularTextPointOfInterestHelper

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  double x;
  double y;
  double width;
  double height;
  double MidX;
  double MidY;
  uint64_t v18;
  int64_t v19;
  int v20;
  float64x2_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
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
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  double MinX;
  double MaxX;
  double MinY;
  id v58;
  id v59;
  double v60;
  double v61;
  float64x2_t v63[3];
  double v64[2];
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  v8 = a5;
  v9 = a6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rectangle");
  x = v65.origin.x;
  y = v65.origin.y;
  width = v65.size.width;
  height = v65.size.height;
  MidX = CGRectGetMidX(v65);
  v66.origin.x = x;
  v66.origin.y = y;
  v66.size.width = width;
  v66.size.height = height;
  MidY = CGRectGetMidY(v66);
  v18 = objc_msgSend(v8, "originalExifOrientation");
  v19 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", v18);
  v64[0] = 0.0;
  v20 = +[AKGeometryHelper annotationHasRotation:outAngle:](AKGeometryHelper, "annotationHasRotation:outAngle:", v8, v64);
  v21 = *(float64x2_t *)(MEMORY[0x24BDBD8B8] + 16);
  v63[0] = *(float64x2_t *)MEMORY[0x24BDBD8B8];
  v63[1] = v21;
  v63[2] = *(float64x2_t *)(MEMORY[0x24BDBD8B8] + 32);
  if (v20)
    +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", x, y, width, height, v64[0]);
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v19, x, y, width, height, MidX, MidY);
  v22 = CGRectGetMidY(v67);
  if ((v20 & 1) != 0)
  {
    v61 = v22;
  }
  else
  {
    +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v19, 0.0, v22, MidX, MidY);
    v24 = v23;
    v26 = v25;
    objc_msgSend(v9, "geometryHelper");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "screenPixelAlignedPointForPoint:", v24, v26);
    v29 = v28;
    v31 = v30;

    +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v18, v29, v31, MidX, MidY);
    v61 = v32;
    objc_msgSend(v8, "strokeWidth");
    +[AKGeometryHelper renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:](AKGeometryHelper, "renderingStrokeAlignedRectForRect:withStrokeWidth:alignToScreenUsingPageController:orAlignToContext:usingAnnotation:", v9, 0, 0, x, y, width, height, v33);
    x = v34;
    y = v35;
    width = v36;
    height = v37;
  }
  +[AKAnnotationRenderer draggingBoundsInsetsForAnnotation:](AKAnnotationRenderer, "draggingBoundsInsetsForAnnotation:", v8);
  v39 = v38;
  v41 = v40;
  v68.origin.x = x;
  v68.origin.y = y;
  v68.size.width = width;
  v68.size.height = height;
  v69 = CGRectInset(v68, v39, v41);
  v42 = v69.origin.x;
  v43 = v69.origin.y;
  v44 = v69.size.width;
  v45 = v69.size.height;
  if ((v20 & 1) == 0)
  {
    objc_msgSend(v9, "geometryHelper");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "screenPixelAlignedRectForRect:", v42, v43, v44, v45);
    v42 = v47;
    v43 = v48;
    v44 = v49;
    v45 = v50;

  }
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v19, v42, v43, v44, v45, MidX, MidY);
  v51 = v70.origin.x;
  v52 = v70.origin.y;
  v53 = v70.size.width;
  v54 = v70.size.height;
  MinX = CGRectGetMinX(v70);
  v71.origin.x = v51;
  v71.origin.y = v52;
  v71.size.width = v53;
  v71.size.height = v54;
  MaxX = CGRectGetMaxX(v71);
  if (objc_msgSend(v8, "conformsToAKTextAnnotationProtocol")
    && objc_msgSend(v8, "textIsClipped"))
  {
    v72.origin.x = v51;
    v72.origin.y = v52;
    v72.size.width = v53;
    v72.size.height = v54;
    v60 = CGRectGetMidX(v72);
    v73.origin.x = v51;
    v73.origin.y = v52;
    v73.size.width = v53;
    v73.size.height = v54;
    MinY = CGRectGetMinY(v73);
    sub_228FEAD30(2, v18, v9, v20, v63, v10, v11, v60, MinY, MidX, MidY);
  }
  sub_228FEAD30(0, v18, v9, v20, v63, v10, v11, MaxX, v61, MidX, MidY);
  sub_228FEAD30(0, v18, v9, v20, v63, v10, v11, MinX, v61, MidX, MidY);
  v58 = objc_retainAutorelease(v10);
  *a3 = v58;
  v59 = objc_retainAutorelease(v11);
  *a4 = v59;

}

+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  if (a3)
    v6 = 8 * (a3 == 1);
  else
    v6 = 4;
  v7 = a5;
  v8 = objc_msgSend(a4, "originalExifOrientation");
  v9 = objc_msgSend(v7, "currentModelToScreenExifOrientation");

  return +[AKGeometryHelper draggableArea:convertedForExif:](AKGeometryHelper, "draggableArea:convertedForExif:", +[AKGeometryHelper draggableArea:convertedForExif:](AKGeometryHelper, "draggableArea:convertedForExif:", v6, v8), v9);
}

@end
