@implementation AKCropToolPointOfInterestHelper

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  void *v6;

  v6 = (void *)MEMORY[0x24BDBD1A8];
  *a3 = (id)MEMORY[0x24BDBD1A8];
  *a4 = v6;
}

+ (unint64_t)_concreteDraggableAreaForPoint:(CGPoint)a3 onAnnotation:(id)a4 withScale:(double)a5 pageControllerForPixelAlignment:(id)a6
{
  double y;
  double x;
  id v9;
  id v10;
  uint64_t v11;
  CGPath *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat width;
  CGFloat height;
  unint64_t v17;
  CGPath *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGPath *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGPath *v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGPath *v33;
  const CGPath *v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGPath *v39;
  const CGPath *v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGPath *v45;
  const CGPath *v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGPath *v51;
  const CGPath *v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGPoint v58;
  CGPoint v59;
  CGPoint v60;
  CGPoint v61;
  CGPoint v62;
  CGPoint v63;
  CGPoint v64;
  CGPoint v65;
  CGRect PathBoundingBox;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = a6;
  v11 = objc_msgSend(v10, "currentModelToScreenExifOrientation");
  v12 = +[AKCropAnnotationRenderer cropHandle:forAnnotation:withPageController:](AKCropAnnotationRenderer, "cropHandle:forAnnotation:withPageController:", 7, v9, v10);
  PathBoundingBox = CGPathGetPathBoundingBox(v12);
  v13 = PathBoundingBox.origin.x;
  v14 = PathBoundingBox.origin.y;
  width = PathBoundingBox.size.width;
  height = PathBoundingBox.size.height;
  CGPathRelease(v12);
  v67.origin.x = v13;
  v67.origin.y = v14;
  v67.size.width = width;
  v67.size.height = height;
  v68 = CGRectInset(v67, -5.0, -5.0);
  v58.x = x;
  v58.y = y;
  if (!CGRectContainsPoint(v68, v58)
    || (v17 = +[AKGeometryHelper draggableArea:convertedForExif:](AKGeometryHelper, "draggableArea:convertedForExif:", 3, v11)) == 0)
  {
    v18 = +[AKCropAnnotationRenderer cropHandle:forAnnotation:withPageController:](AKCropAnnotationRenderer, "cropHandle:forAnnotation:withPageController:", 4, v9, v10);
    v69 = CGPathGetPathBoundingBox(v18);
    v19 = v69.origin.x;
    v20 = v69.origin.y;
    v21 = v69.size.width;
    v22 = v69.size.height;
    CGPathRelease(v18);
    v70.origin.x = v19;
    v70.origin.y = v20;
    v70.size.width = v21;
    v70.size.height = v22;
    v71 = CGRectInset(v70, -5.0, -5.0);
    v59.x = x;
    v59.y = y;
    if (!CGRectContainsPoint(v71, v59)
      || (v17 = +[AKGeometryHelper draggableArea:convertedForExif:](AKGeometryHelper, "draggableArea:convertedForExif:", 7, v11)) == 0)
    {
      v23 = +[AKCropAnnotationRenderer cropHandle:forAnnotation:withPageController:](AKCropAnnotationRenderer, "cropHandle:forAnnotation:withPageController:", 5, v9, v10);
      v72 = CGPathGetPathBoundingBox(v23);
      v24 = v72.origin.x;
      v25 = v72.origin.y;
      v26 = v72.size.width;
      v27 = v72.size.height;
      CGPathRelease(v23);
      v73.origin.x = v24;
      v73.origin.y = v25;
      v73.size.width = v26;
      v73.size.height = v27;
      v74 = CGRectInset(v73, -5.0, -5.0);
      v60.x = x;
      v60.y = y;
      if (!CGRectContainsPoint(v74, v60)
        || (v17 = +[AKGeometryHelper draggableArea:convertedForExif:](AKGeometryHelper, "draggableArea:convertedForExif:", 5, v11)) == 0)
      {
        v28 = +[AKCropAnnotationRenderer cropHandle:forAnnotation:withPageController:](AKCropAnnotationRenderer, "cropHandle:forAnnotation:withPageController:", 6, v9, v10);
        v75 = CGPathGetPathBoundingBox(v28);
        v29 = v75.origin.x;
        v30 = v75.origin.y;
        v31 = v75.size.width;
        v32 = v75.size.height;
        CGPathRelease(v28);
        v76.origin.x = v29;
        v76.origin.y = v30;
        v76.size.width = v31;
        v76.size.height = v32;
        v77 = CGRectInset(v76, -5.0, -5.0);
        v61.x = x;
        v61.y = y;
        if (!CGRectContainsPoint(v77, v61)
          || (v17 = +[AKGeometryHelper draggableArea:convertedForExif:](AKGeometryHelper, "draggableArea:convertedForExif:", 1, v11)) == 0)
        {
          v33 = +[AKCropAnnotationRenderer cropHandle:forAnnotation:withPageController:](AKCropAnnotationRenderer, "cropHandle:forAnnotation:withPageController:", 1, v9, v10);
          if (!v33)
            goto LABEL_27;
          v34 = v33;
          v78 = CGPathGetPathBoundingBox(v33);
          v35 = v78.origin.x;
          v36 = v78.origin.y;
          v37 = v78.size.width;
          v38 = v78.size.height;
          CGPathRelease(v34);
          v79.origin.x = v35;
          v79.origin.y = v36;
          v79.size.width = v37;
          v79.size.height = v38;
          v80 = CGRectInset(v79, -5.0, -5.0);
          v62.x = x;
          v62.y = y;
          if (!CGRectContainsPoint(v80, v62)
            || (v17 = +[AKGeometryHelper draggableArea:convertedForExif:](AKGeometryHelper, "draggableArea:convertedForExif:", 4, v11)) == 0)
          {
LABEL_27:
            v39 = +[AKCropAnnotationRenderer cropHandle:forAnnotation:withPageController:](AKCropAnnotationRenderer, "cropHandle:forAnnotation:withPageController:", 3, v9, v10);
            if (!v39)
              goto LABEL_28;
            v40 = v39;
            v81 = CGPathGetPathBoundingBox(v39);
            v41 = v81.origin.x;
            v42 = v81.origin.y;
            v43 = v81.size.width;
            v44 = v81.size.height;
            CGPathRelease(v40);
            v82.origin.x = v41;
            v82.origin.y = v42;
            v82.size.width = v43;
            v82.size.height = v44;
            v83 = CGRectInset(v82, -5.0, -5.0);
            v63.x = x;
            v63.y = y;
            if (!CGRectContainsPoint(v83, v63)
              || (v17 = +[AKGeometryHelper draggableArea:convertedForExif:](AKGeometryHelper, "draggableArea:convertedForExif:", 2, v11)) == 0)
            {
LABEL_28:
              v45 = +[AKCropAnnotationRenderer cropHandle:forAnnotation:withPageController:](AKCropAnnotationRenderer, "cropHandle:forAnnotation:withPageController:", 0, v9, v10);
              if (!v45)
                goto LABEL_18;
              v46 = v45;
              v84 = CGPathGetPathBoundingBox(v45);
              v47 = v84.origin.x;
              v48 = v84.origin.y;
              v49 = v84.size.width;
              v50 = v84.size.height;
              CGPathRelease(v46);
              v85.origin.x = v47;
              v85.origin.y = v48;
              v85.size.width = v49;
              v85.size.height = v50;
              v86 = CGRectInset(v85, -5.0, -5.0);
              v64.x = x;
              v64.y = y;
              if (!CGRectContainsPoint(v86, v64)
                || (v17 = +[AKGeometryHelper draggableArea:convertedForExif:](AKGeometryHelper, "draggableArea:convertedForExif:", 8, v11)) == 0)
              {
LABEL_18:
                v51 = +[AKCropAnnotationRenderer cropHandle:forAnnotation:withPageController:](AKCropAnnotationRenderer, "cropHandle:forAnnotation:withPageController:", 2, v9, v10);
                if (!v51)
                  goto LABEL_29;
                v52 = v51;
                v87 = CGPathGetPathBoundingBox(v51);
                v53 = v87.origin.x;
                v54 = v87.origin.y;
                v55 = v87.size.width;
                v56 = v87.size.height;
                CGPathRelease(v52);
                v88.origin.x = v53;
                v88.origin.y = v54;
                v88.size.width = v55;
                v88.size.height = v56;
                v89 = CGRectInset(v88, -5.0, -5.0);
                v65.x = x;
                v65.y = y;
                if (!CGRectContainsPoint(v89, v65)
                  || (v17 = +[AKGeometryHelper draggableArea:convertedForExif:](AKGeometryHelper, "draggableArea:convertedForExif:", 6, v11)) == 0)
                {
LABEL_29:
                  if (+[AKAnnotationRenderer pointIsOnInside:ofAnnotation:](AKAnnotationRenderer, "pointIsOnInside:ofAnnotation:", v9, x, y))
                  {
                    v17 = 20;
                  }
                  else
                  {
                    v17 = 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v17;
}

@end
