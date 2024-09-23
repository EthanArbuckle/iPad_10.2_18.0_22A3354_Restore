@implementation AKSpeechBubblePointOfInterestHelper

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  double *v15;
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
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  double v35;
  double v36;
  id v37;
  id v38;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  objc_super v45;
  id v46;
  id v47[2];

  v46 = 0;
  v47[0] = 0;
  v45.receiver = a1;
  v45.super_class = (Class)&OBJC_METACLASS___AKSpeechBubblePointOfInterestHelper;
  v7 = a6;
  v8 = a5;
  objc_msgSendSuper2(&v45, sel__concretePointsOfInterest_withVisualStyle_ofAnnotation_pageControllerForPixelAlignment_, v47, &v46, v8, v7);
  v38 = v47[0];
  v37 = v46;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v38, "count") + 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v37, "count") + 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v44 = 0;
  v41 = 0;
  v42 = 0;
  +[AKSpeechBubbleAnnotationRenderer basePointsOfPointyBit:withUpdatedProperties:firstPoint:secondPoint:](AKSpeechBubbleAnnotationRenderer, "basePointsOfPointyBit:withUpdatedProperties:firstPoint:secondPoint:", v8, 0, &v43, &v41);
  v11 = +[AKGeometryHelper exifOrientationHasFlip:](AKGeometryHelper, "exifOrientationHasFlip:", objc_msgSend(v7, "currentModelToScreenExifOrientation"));
  if (v11)
    v13 = &v42;
  else
    v13 = &v44;
  v14 = *v13;
  if (v11)
    v15 = (double *)&v41;
  else
    v15 = (double *)&v43;
  v36 = *v15;
  objc_msgSend(v8, "rectangle", v14, v12);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  objc_msgSend(v8, "rotationAngle");
  v25 = v24;

  +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", v17, v19, v21, v23, v25);
  objc_msgSend(v7, "geometryHelper");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "screenPixelAlignedPointForPoint:", vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, v35), (float64x2_t)0, v36)));
  v28 = v27;
  v30 = v29;

  objc_msgSend(MEMORY[0x24BDD1968], "akValueWithPoint:", v28, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v31);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v32);

  objc_msgSend(v9, "addObjectsFromArray:", v38);
  objc_msgSend(v10, "addObjectsFromArray:", v37);
  v33 = objc_retainAutorelease(v9);
  *a3 = v33;
  v34 = objc_retainAutorelease(v10);
  *a4 = v34;

}

+ (unint64_t)_concreteDraggableAreaForPointOfInterestWithIndex:(unint64_t)a3 ofAnnotation:(id)a4 onPageController:(id)a5
{
  objc_super v6;

  if (!a3)
    return 15;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKSpeechBubblePointOfInterestHelper;
  return (unint64_t)objc_msgSendSuper2(&v6, sel__concreteDraggableAreaForPointOfInterestWithIndex_ofAnnotation_onPageController_, a3 - 1, a4, a5);
}

+ (double)minOutset
{
  return 30.0;
}

+ (double)maxOutset
{
  return 1.79769313e308;
}

+ (CGPoint)_concreteValidatePoint:(CGPoint)a3 ofDraggableArea:(unint64_t)a4 forAnnotation:(id)a5 onPageController:(id)a6
{
  double y;
  double x;
  id v11;
  id v12;
  double v13;
  double v14;
  double width;
  double height;
  double MidX;
  double MidY;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _BOOL4 v26;
  uint64_t v27;
  _BOOL4 v28;
  double v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  objc_super v48;
  double v49;
  double v50;
  const __CFString *v51;
  _QWORD v52[2];
  CGPoint result;
  CGRect v54;
  CGRect v55;

  y = a3.y;
  x = a3.x;
  v52[1] = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  if (a4 == 15)
  {
    v49 = 0.0;
    v50 = 0.0;
    v12 = a6;
    objc_msgSend(v11, "rectangle");
    v13 = v54.origin.x;
    v14 = v54.origin.y;
    width = v54.size.width;
    height = v54.size.height;
    MidX = CGRectGetMidX(v54);
    v55.origin.x = v13;
    v55.origin.y = v14;
    v55.size.width = width;
    v55.size.height = height;
    MidY = CGRectGetMidY(v55);
    v45 = x;
    v46 = y;
    +[AKGeometryHelper intersectRayStartingAt:ending:withEllipseOfRect:farthestResult:](AKGeometryHelper, "intersectRayStartingAt:ending:withEllipseOfRect:farthestResult:", 0, MidX, MidY, x, y, v13, v14, width, height);
    v20 = v19;
    v22 = v21;
    +[AKSpeechBubbleAnnotationRenderer pointyBitPointWidthAngleGivenControlBasePoint:forAnnotation:](AKSpeechBubbleAnnotationRenderer, "pointyBitPointWidthAngleGivenControlBasePoint:forAnnotation:", v11);
    v47 = v23;
    objc_msgSend(v11, "pointyBitPoint");
    v26 = +[AKGeometryHelper isPointOnLeft:ofRayWithFirstPoint:andSecondPoint:](AKGeometryHelper, "isPointOnLeft:ofRayWithFirstPoint:andSecondPoint:", v20, v22, v24, v25, MidX, MidY);
    v27 = objc_msgSend(v12, "currentModelToScreenExifOrientation");

    v28 = +[AKGeometryHelper exifOrientationHasFlip:](AKGeometryHelper, "exifOrientationHasFlip:", v27);
    v29 = 0.0;
    if (v28)
    {
      if (!v26)
      {
        v47 = 720.0 - v47;
        goto LABEL_7;
      }
    }
    else if (v26)
    {
LABEL_7:
      v35 = v47;
      if (v47 > 90.0)
      {
        objc_msgSend(v11, "pointyBitPoint");
        +[AKGeometryHelper intersectLineSegmentStartingAt:ending:withEllipseOfRect:farthestResult:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withEllipseOfRect:farthestResult:", 1, v45, v46, v36, v37, v13, v14, width, height);
        if (v39 != 9.22337204e18 && v38 != 9.22337204e18)
        {
          +[AKSpeechBubbleAnnotationRenderer pointyBitPointWidthAngleGivenControlBasePoint:forAnnotation:](AKSpeechBubbleAnnotationRenderer, "pointyBitPointWidthAngleGivenControlBasePoint:forAnnotation:", v11);
          v35 = v40;
        }
      }
      if (v35 <= 90.0)
        v29 = v35;
      else
        v29 = 90.0;
    }
    v51 = CFSTR("pointyBitBaseWidthAngle");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v29);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v41;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    +[AKSpeechBubbleAnnotationRenderer basePointsOfPointyBit:withUpdatedProperties:firstPoint:secondPoint:](AKSpeechBubbleAnnotationRenderer, "basePointsOfPointyBit:withUpdatedProperties:firstPoint:secondPoint:", v11, v42, &v49, 0);
    goto LABEL_15;
  }
  v48.receiver = a1;
  v48.super_class = (Class)&OBJC_METACLASS___AKSpeechBubblePointOfInterestHelper;
  v30 = a6;
  objc_msgSendSuper2(&v48, sel__concreteValidatePoint_ofDraggableArea_forAnnotation_onPageController_, a4, v11, v30, x, y);
  v32 = v31;
  v34 = v33;

  v49 = v32;
  v50 = v34;
LABEL_15:

  v43 = v49;
  v44 = v50;
  result.y = v44;
  result.x = v43;
  return result;
}

+ (CGPoint)_endPointOfBoundingLineSegmentFromPointyPointThroughtPoint:(CGPoint)a3 forAnnotation:(id)a4
{
  double y;
  double x;
  id v6;
  double MidX;
  double MidY;
  double Width;
  double Height;
  double v11;
  long double v12;
  double v13;
  long double v14;
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
  CGPoint result;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  y = a3.y;
  x = a3.x;
  v6 = a4;
  objc_msgSend(v6, "rectangle");
  MidX = CGRectGetMidX(v29);
  objc_msgSend(v6, "rectangle");
  MidY = CGRectGetMidY(v30);
  objc_msgSend(v6, "rectangle");
  Width = CGRectGetWidth(v31);
  objc_msgSend(v6, "rectangle");
  Height = CGRectGetHeight(v32);
  if (Width < Height)
    Width = Height;
  objc_msgSend(v6, "pointyBitPoint");
  v12 = v11 - MidX;
  objc_msgSend(v6, "pointyBitPoint");
  v14 = Width + hypot(v12, v13 - MidY);
  objc_msgSend(v6, "pointyBitPoint");
  v16 = x - v15;
  objc_msgSend(v6, "pointyBitPoint");
  +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", v16, y - v17);
  v19 = v18;
  v21 = v20;
  objc_msgSend(v6, "pointyBitPoint");
  v23 = v22 + v14 * v19;
  objc_msgSend(v6, "pointyBitPoint");
  v25 = v24;

  v26 = v25 + v14 * v21;
  v27 = v23;
  result.y = v26;
  result.x = v27;
  return result;
}

@end
