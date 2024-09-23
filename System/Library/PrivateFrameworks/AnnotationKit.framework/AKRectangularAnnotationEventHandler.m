@implementation AKRectangularAnnotationEventHandler

- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7
{
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat height;
  double v25;
  double v26;
  double v27;
  double v28;
  double MinX;
  double v30;
  double v31;
  double MaxX;
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
  double v43;
  double v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat MidX;
  CGFloat MidY;
  id v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v59;
  id v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  -[AKAnnotationEventHandler annotation](self, "annotation", a3, a4, a5, a6, a7);
  v60 = (id)objc_claimAutoreleasedReturnValue();
  -[AKAnnotationEventHandler pageController](self, "pageController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "rectangle");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  +[AKAnnotationRenderer draggingBoundsInsetsForAnnotation:](AKAnnotationRenderer, "draggingBoundsInsetsForAnnotation:", v60);
  v21 = v20;
  v23 = v22;
  v61.origin.x = v13;
  v61.origin.y = v15;
  v61.size.width = v17;
  v61.size.height = v19;
  v62 = CGRectInset(v61, v21, v23);
  height = v62.size.height;
  y = v62.origin.y;
  x = v62.origin.x;
  width = v62.size.width;
  +[AKGeometryHelper convertModelToScreenOrientationForRect:withPageController:](AKGeometryHelper, "convertModelToScreenOrientationForRect:withPageController:", v11);
  v25 = v63.origin.x;
  v26 = v63.origin.y;
  v27 = v63.size.width;
  v28 = v63.size.height;
  MinX = CGRectGetMinX(v63);
  v64.origin.x = v25;
  v64.origin.y = v26;
  v64.size.width = v27;
  v64.size.height = v28;
  +[AKGeometryHelper convertScreenToModelOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertScreenToModelOrientationForPoint:relativeToRect:withPageController:", v11, MinX, CGRectGetMinY(v64), v25, v26, v27, v28);
  v53 = v31;
  v54 = v30;
  v65.origin.x = v25;
  v65.origin.y = v26;
  v65.size.width = v27;
  v65.size.height = v28;
  MaxX = CGRectGetMaxX(v65);
  v66.origin.x = v25;
  v66.origin.y = v26;
  v66.size.width = v27;
  v66.size.height = v28;
  +[AKGeometryHelper convertScreenToModelOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertScreenToModelOrientationForPoint:relativeToRect:withPageController:", v11, MaxX, CGRectGetMinY(v66), v25, v26, v27, v28);
  v59 = v33;
  v55 = v34;
  v67.origin.x = v25;
  v67.origin.y = v26;
  v67.size.width = v27;
  v67.size.height = v28;
  v35 = CGRectGetMinX(v67);
  v68.origin.x = v25;
  v68.origin.y = v26;
  v68.size.width = v27;
  v68.size.height = v28;
  +[AKGeometryHelper convertScreenToModelOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertScreenToModelOrientationForPoint:relativeToRect:withPageController:", v11, v35, CGRectGetMaxY(v68), v25, v26, v27, v28);
  v37 = v36;
  v39 = v38;
  v69.origin.x = v25;
  v69.origin.y = v26;
  v69.size.width = v27;
  v69.size.height = v28;
  v40 = CGRectGetMaxX(v69);
  v70.origin.x = v25;
  v70.origin.y = v26;
  v70.size.width = v27;
  v70.size.height = v28;
  +[AKGeometryHelper convertScreenToModelOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertScreenToModelOrientationForPoint:relativeToRect:withPageController:", v11, v40, CGRectGetMaxY(v70), v25, v26, v27, v28);
  v42 = v41;
  v44 = v43;
  switch(-[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea"))
  {
    case 1uLL:
    case 8uLL:
      v45 = v44;
      v46 = v42;
      v47 = v53;
      v59 = v54;
      break;
    case 2uLL:
    case 3uLL:
    case 4uLL:
      v45 = v39;
      v46 = v37;
      v47 = v55;
      break;
    case 5uLL:
    case 6uLL:
      v45 = v53;
      v46 = v54;
      v47 = v44;
      v59 = v42;
      break;
    case 7uLL:
      v45 = v55;
      v46 = v59;
      v47 = v39;
      v59 = v37;
      break;
    default:
      v46 = *MEMORY[0x24BDBEFB0];
      v45 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      v47 = v45;
      v59 = *MEMORY[0x24BDBEFB0];
      break;
  }
  v71.origin.x = x;
  v71.origin.y = y;
  v71.size.width = width;
  v71.size.height = height;
  MidX = CGRectGetMidX(v71);
  v72.origin.x = x;
  v72.origin.y = y;
  v72.size.width = width;
  v72.size.height = height;
  MidY = CGRectGetMidY(v72);
  if (objc_msgSend(v60, "conformsToAKFlippableAnnotationProtocol"))
  {
    v50 = v60;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v51 = objc_msgSend(v50, "horizontallyFlipped");
    else
      v51 = 0;
    -[AKRectangularAnnotationEventHandler setInitialHorizontalFlip:](self, "setInitialHorizontalFlip:", v51, *(_QWORD *)&v53, *(_QWORD *)&v54);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v52 = objc_msgSend(v50, "verticallyFlipped");
    else
      v52 = 0;
    -[AKRectangularAnnotationEventHandler setInitialVerticalFlip:](self, "setInitialVerticalFlip:", v52);

  }
  a3->x = v59;
  a3->y = v47;
  a4->x = v46;
  a4->y = v45;
  a5->x = MidX;
  a5->y = MidY;

}

- (void)setupDraggingConstraints
{
  _BOOL4 v3;
  id v4;

  -[AKAnnotationEventHandler pageController](self, "pageController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = +[AKGeometryHelper exifOrientationHasReversedAxes:](AKGeometryHelper, "exifOrientationHasReversedAxes:", objc_msgSend(v4, "currentModelToScreenExifOrientation"));
  switch(-[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea"))
  {
    case 2uLL:
    case 6uLL:
      if (!v3)
        goto LABEL_5;
      goto LABEL_3;
    case 4uLL:
    case 8uLL:
      if (v3)
LABEL_5:
        -[AKAnnotationEventHandler setDraggingVerticalOnly:](self, "setDraggingVerticalOnly:", 1);
      else
LABEL_3:
        -[AKAnnotationEventHandler setDraggingHorizontalOnly:](self, "setDraggingHorizontalOnly:", 1);
      break;
    default:
      break;
  }

}

- (CGRect)_rectForModifiedRotatedRect:(CGRect)a3 withOriginal:(CGRect)a4 andRotation:(double)a5
{
  double x;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double MidX;
  double MidY;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double y;
  double width;
  double height;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect result;

  width = a4.size.width;
  height = a4.size.height;
  y = a4.origin.y;
  x = a4.origin.x;
  v6 = a3.size.height;
  v7 = a3.size.width;
  v8 = a3.origin.y;
  v9 = a3.origin.x;
  MidX = CGRectGetMidX(a3);
  v23.origin.x = v9;
  v23.origin.y = v8;
  v23.size.width = v7;
  v23.size.height = v6;
  MidY = CGRectGetMidY(v23);
  +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", x, y, width, height, a5);
  v12 = MidY * 0.0 + 0.0 * MidX + 0.0;
  v24.origin.x = v9;
  v24.origin.y = v8;
  v24.size.width = v7;
  v24.size.height = v6;
  v13 = v12 + CGRectGetWidth(v24) * -0.5;
  v25.origin.x = v9;
  v25.origin.y = v8;
  v25.size.width = v7;
  v25.size.height = v6;
  v14 = v12 + CGRectGetHeight(v25) * -0.5;
  v26.origin.x = v9;
  v26.origin.y = v8;
  v26.size.width = v7;
  v26.size.height = v6;
  v15 = CGRectGetWidth(v26);
  v27.origin.x = v9;
  v27.origin.y = v8;
  v27.size.width = v7;
  v27.size.height = v6;
  v16 = CGRectGetHeight(v27);
  v17 = v13;
  v18 = v14;
  v19 = v15;
  result.size.height = v16;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4
{
  char v4;
  double y;
  double x;
  void *v8;
  void *v9;
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
  int64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  unint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v51;
  double v52;
  double width;
  double height;
  double MidX;
  double MidY;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  id v81;
  int v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  uint64_t v97;
  double v98;
  double v99;
  double v100;
  double v101;
  unsigned __int8 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[AKAnnotationEventHandler pageController](self, "pageController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAnnotationEventHandler annotation](self, "annotation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rectangle");
  v11 = v10;
  v99 = v13;
  v100 = v12;
  v98 = v14;
  v15 = 0.0;
  if (objc_msgSend(v9, "conformsToAKRotatableAnnotationProtocol"))
  {
    objc_msgSend(v9, "rotationAngle");
    v15 = v16;
  }
  v104 = 0u;
  v105 = 0u;
  v103 = 0u;
  objc_msgSend(v9, "rectangle");
  +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:");
  v17 = y * 0.0 + 0.0 * x + 0.0;
  if (-[AKAnnotationEventHandler draggingHorizontalOnly](self, "draggingHorizontalOnly"))
  {
    -[AKAnnotationEventHandler initialDraggedPoint](self, "initialDraggedPoint");
    v19 = v18;
  }
  else
  {
    v19 = y * 0.0 + 0.0 * x + 0.0;
    if (-[AKAnnotationEventHandler draggingVerticalOnly](self, "draggingVerticalOnly"))
    {
      -[AKAnnotationEventHandler initialDraggedPoint](self, "initialDraggedPoint");
      v17 = v20;
    }
  }
  v101 = v11;
  if ((v4 & 1) != 0)
  {
    -[AKAnnotationEventHandler initialCenter](self, "initialCenter");
    v42 = v41;
    v44 = v43;
    v45 = v17 - v41;
    v46 = v19 - v43;
    if (-[AKAnnotationEventHandler canLockAspectRatio](self, "canLockAspectRatio")
      && (-[AKAnnotationEventHandler alwaysLockAspectRatio](self, "alwaysLockAspectRatio")
       || ((((v4 & 2) == 0) ^ -[AKAnnotationEventHandler lockAspectRatioByDefault](self, "lockAspectRatioByDefault")) & 1) == 0))
    {
      -[AKAnnotationEventHandler naturalAspectRatioForAnnotation](self, "naturalAspectRatioForAnnotation");
      +[AKGeometryHelper snapVector:toDiagonalForAspectRatio:ignoreWidth:ignoreHeight:](AKGeometryHelper, "snapVector:toDiagonalForAspectRatio:ignoreWidth:ignoreHeight:", -[AKAnnotationEventHandler draggingVerticalOnly](self, "draggingVerticalOnly"), -[AKAnnotationEventHandler draggingHorizontalOnly](self, "draggingHorizontalOnly"), v45, v46, v47);
      v45 = v48;
      v46 = v49;
      v17 = v42 + v48;
      v19 = v44 + v49;
    }
    v22 = v42 - v45;
    v24 = v44 - v46;
  }
  else
  {
    -[AKAnnotationEventHandler initialOtherPoint](self, "initialOtherPoint");
    v22 = v21;
    v24 = v23;
    if (-[AKAnnotationEventHandler canLockAspectRatio](self, "canLockAspectRatio"))
    {
      if (-[AKAnnotationEventHandler alwaysLockAspectRatio](self, "alwaysLockAspectRatio"))
      {
        -[AKAnnotationEventHandler naturalSizeForAnnotation](self, "naturalSizeForAnnotation");
        v26 = v25;
        v28 = v27;
        v29 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", objc_msgSend(v9, "originalExifOrientation"));
        +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v29, v26, v28, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
        v31 = v30;
        v33 = v32;
        v34 = -[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea");
        if (v34 == 3)
          v35 = -v33;
        else
          v35 = v33;
        if (v34 == 7)
        {
          v35 = v33;
          v36 = -v31;
        }
        else
        {
          v36 = v31;
        }
        if (v34 == 1)
          v37 = -v33;
        else
          v37 = v35;
        if (v34 == 1)
          v38 = -v31;
        else
          v38 = v36;
        +[AKGeometryHelper projectVector:ontoAspectVector:](AKGeometryHelper, "projectVector:ontoAspectVector:", v17 - v22, v19 - v24, v38, v37, v36);
        v17 = v22 + v39;
        v19 = v24 + v40;
      }
      else if (((((v4 & 2) == 0) ^ -[AKAnnotationEventHandler lockAspectRatioByDefault](self, "lockAspectRatioByDefault")) & 1) == 0)
      {
        -[AKAnnotationEventHandler naturalAspectRatioForAnnotation](self, "naturalAspectRatioForAnnotation");
        +[AKGeometryHelper snapVector:toDiagonalForAspectRatio:ignoreWidth:ignoreHeight:](AKGeometryHelper, "snapVector:toDiagonalForAspectRatio:ignoreWidth:ignoreHeight:", -[AKAnnotationEventHandler draggingVerticalOnly](self, "draggingVerticalOnly"), -[AKAnnotationEventHandler draggingHorizontalOnly](self, "draggingHorizontalOnly"), v17 - v22, v19 - v24, v83);
        v85 = v84;
        v17 = v22 + v86;
        if (-[AKAnnotationEventHandler draggingHorizontalOnly](self, "draggingHorizontalOnly"))
        {
          -[AKAnnotationEventHandler naturalAspectRatioForAnnotation](self, "naturalAspectRatioForAnnotation");
          v88 = (v17 - v22) / v87;
          -[AKAnnotationEventHandler initialCenter](self, "initialCenter");
          v89 = v88 * 0.5;
          v24 = v90 - v88 * 0.5;
          -[AKAnnotationEventHandler initialCenter](self, "initialCenter");
          v19 = v89 + v91;
        }
        else
        {
          v19 = v24 + v85;
          if (-[AKAnnotationEventHandler draggingVerticalOnly](self, "draggingVerticalOnly"))
          {
            -[AKAnnotationEventHandler naturalAspectRatioForAnnotation](self, "naturalAspectRatioForAnnotation");
            v93 = (v19 - v24) * v92;
            -[AKAnnotationEventHandler initialCenter](self, "initialCenter");
            v94 = v93 * 0.5;
            v22 = v95 - v94;
            -[AKAnnotationEventHandler initialCenter](self, "initialCenter");
            v17 = v94 + v96;
          }
        }
      }
    }
  }
  if (v17 != v22 || v19 != v24)
  {
    -[AKRectangularAnnotationEventHandler _updateModelFlippednessWithCurrentPoint:](self, "_updateModelFlippednessWithCurrentPoint:", v17, v19);
    v106.size.width = v17 - v22;
    v106.size.height = v19 - v24;
    v106.origin.x = v22;
    v106.origin.y = v24;
    v107 = CGRectStandardize(v106);
    v51 = v107.origin.x;
    v52 = v107.origin.y;
    width = v107.size.width;
    height = v107.size.height;
    MidX = CGRectGetMidX(v107);
    v108.origin.x = v51;
    v108.origin.y = v52;
    v108.size.width = width;
    v108.size.height = height;
    MidY = CGRectGetMidY(v108);
    v57 = (void *)objc_opt_class();
    -[AKAnnotationEventHandler initialCenter](self, "initialCenter");
    objc_msgSend(v57, "annotationRectangleForDraggingBounds:forAnnotation:onPageController:withOriginalCenter:", v9, v8, v51, v52, width, height, v58, v59);
    v61 = v60;
    v63 = v62;
    v65 = v64;
    v67 = v66;
    if (vabdd_f64(round(v15 / 1.57079633), v15 / 1.57079633) < 0.0005)
    {
      objc_msgSend(v8, "geometryHelper");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "contentAlignedRectForRect:", v61, v63, v65, v67);
      v61 = v69;
      v63 = v70;
      v65 = v71;
      v67 = v72;

    }
    if (fabs(v15) >= 0.0005)
    {
      -[AKRectangularAnnotationEventHandler _rectForModifiedRotatedRect:withOriginal:andRotation:](self, "_rectForModifiedRotatedRect:withOriginal:andRotation:", v61, v63, v65, v67, v101, v100, v99, v98, *(_QWORD *)&v15);
      v61 = v109.origin.x;
      v63 = v109.origin.y;
      v65 = v109.size.width;
      v67 = v109.size.height;
      v73 = CGRectGetMidX(v109) - MidX;
      v110.origin.x = v61;
      v110.origin.y = v63;
      v110.size.width = v65;
      v110.size.height = v67;
      v74 = CGRectGetMidY(v110) - MidY;
      -[AKAnnotationEventHandler initialDraggedPoint](self, "initialDraggedPoint");
      -[AKAnnotationEventHandler setInitialDraggedPoint:](self, "setInitialDraggedPoint:", v73 + v75, v74 + v76);
      -[AKAnnotationEventHandler initialOtherPoint](self, "initialOtherPoint");
      -[AKAnnotationEventHandler setInitialOtherPoint:](self, "setInitialOtherPoint:", v73 + v77, v74 + v78);
      -[AKAnnotationEventHandler initialCenter](self, "initialCenter");
      -[AKAnnotationEventHandler setInitialCenter:](self, "setInitialCenter:", v73 + v79, v74 + v80);
    }
    if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:", v61, v63, v65, v67))
    {
      objc_msgSend(v9, "rectangle");
      v112.origin.x = v61;
      v112.origin.y = v63;
      v112.size.width = v65;
      v112.size.height = v67;
      if (!CGRectEqualToRect(v111, v112))
      {
        objc_msgSend(v9, "setRectangle:", v61, v63, v65, v67);
        if (objc_msgSend(v9, "conformsToAKTextAnnotationProtocol"))
        {
          v81 = v9;
          v102 = 0;
          LOBYTE(v97) = 0;
          +[AKTextAnnotationRenderHelper getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:](AKTextAnnotationRenderHelper, "getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:", 0, 0, 0, 0, &v102, v81, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24), v8, 0, v97, 0);
          v82 = objc_msgSend(v81, "textIsClipped");
          if (v102 != v82)
            objc_msgSend(v81, "setTextIsClipped:", v102 != 0);

        }
      }
    }
  }

}

- (void)_updateModelFlippednessWithCurrentPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  y = a3.y;
  x = a3.x;
  -[AKAnnotationEventHandler annotation](self, "annotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "conformsToAKFlippableAnnotationProtocol");

  if (v7)
  {
    -[AKAnnotationEventHandler annotation](self, "annotation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "conformsToAKRotatableAnnotationProtocol"))
      objc_msgSend(v8, "rotationAngle");
    objc_msgSend(v8, "rectangle");
    +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:");
    -[AKAnnotationEventHandler initialOtherPoint](self, "initialOtherPoint");
    v15 = v10;
    v16 = v9;
    -[AKAnnotationEventHandler initialDraggedPoint](self, "initialDraggedPoint");
    v14 = v11;
    v13 = v12;
    if (!-[AKAnnotationEventHandler draggingVerticalOnly](self, "draggingVerticalOnly")
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "setHorizontallyFlipped:", -[AKRectangularAnnotationEventHandler initialHorizontalFlip](self, "initialHorizontalFlip") ^ (COERCE_UNSIGNED_INT64(y * 0.0 + 0.0 * x + 0.0 - (v15 * 0.0 + 0.0 * v16 + 0.0)) >> 63 != COERCE_UNSIGNED_INT64(v13 * 0.0 + 0.0 * v14 + 0.0 - (v15 * 0.0 + 0.0 * v16 + 0.0)) >> 63));
    }
    if (!-[AKAnnotationEventHandler draggingHorizontalOnly](self, "draggingHorizontalOnly")
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "setVerticallyFlipped:", -[AKRectangularAnnotationEventHandler initialVerticalFlip](self, "initialVerticalFlip") ^ (COERCE_UNSIGNED_INT64(y * 0.0 + 0.0 * x + 0.0 - (v15 * 0.0 + 0.0 * v16 + 0.0)) >> 63 != COERCE_UNSIGNED_INT64(v13 * 0.0 + 0.0 * v14 + 0.0 - (v15 * 0.0 + 0.0 * v16 + 0.0)) >> 63));
    }

  }
}

- (BOOL)initialHorizontalFlip
{
  return self->_initialHorizontalFlip;
}

- (void)setInitialHorizontalFlip:(BOOL)a3
{
  self->_initialHorizontalFlip = a3;
}

- (BOOL)initialVerticalFlip
{
  return self->_initialVerticalFlip;
}

- (void)setInitialVerticalFlip:(BOOL)a3
{
  self->_initialVerticalFlip = a3;
}

@end
