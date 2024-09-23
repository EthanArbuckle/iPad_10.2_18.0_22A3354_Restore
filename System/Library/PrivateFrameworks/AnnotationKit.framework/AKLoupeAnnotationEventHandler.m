@implementation AKLoupeAnnotationEventHandler

- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7
{
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  double x;
  double y;
  double width;
  double height;
  CGFloat MidX;
  CGFloat MidY;
  double v21;
  double v22;
  double v23;
  double v24;
  double MaxX;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  id v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  -[AKAnnotationEventHandler pageController](self, "pageController", a3, a4, a5, a6, a7);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  -[AKAnnotationEventHandler annotation](self, "annotation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") & 0xFFFFFFFFFFFFFFFELL) == 0x12)
  {
    +[AKAnnotationPointOfInterestHelper pointForDraggableArea:onAnnotation:pageControllerForPixelAlignment:](AKAnnotationPointOfInterestHelper, "pointForDraggableArea:onAnnotation:pageControllerForPixelAlignment:", -[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea"), v11, v30);
    v13 = v12;
    v29 = v14;
    objc_msgSend(v11, "rectangle");
    x = v31.origin.x;
    y = v31.origin.y;
    width = v31.size.width;
    height = v31.size.height;
    MidX = CGRectGetMidX(v31);
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    MidY = CGRectGetMidY(v32);
    +[AKGeometryHelper convertModelToScreenOrientationForRect:withPageController:](AKGeometryHelper, "convertModelToScreenOrientationForRect:withPageController:", v30, x, y, width, height);
    v21 = v33.origin.x;
    v22 = v33.origin.y;
    v23 = v33.size.width;
    v24 = v33.size.height;
    MaxX = CGRectGetMaxX(v33);
    v34.origin.x = v21;
    v34.origin.y = v22;
    v34.size.width = v23;
    v34.size.height = v24;
    +[AKGeometryHelper convertScreenToModelOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertScreenToModelOrientationForPoint:relativeToRect:withPageController:", v30, MaxX, CGRectGetMinY(v34), v21, v22, v23, v24);
    v28 = v29;
  }
  else
  {
    MidX = *MEMORY[0x24BDBEFB0];
    MidY = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v27 = MidY;
    v26 = *MEMORY[0x24BDBEFB0];
    v28 = MidY;
    v13 = *MEMORY[0x24BDBEFB0];
  }
  a3->x = v13;
  a3->y = v28;
  a4->x = v26;
  a4->y = v27;
  a5->x = MidX;
  a5->y = MidY;

}

- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4
{
  double y;
  double x;
  void *v7;
  double v8;
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
  BOOL v26;
  double v27;
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
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v47;
  id v48;
  CGRect v49;
  CGRect v50;

  y = a3.y;
  x = a3.x;
  -[AKAnnotationEventHandler pageController](self, "pageController", a4);
  v48 = (id)objc_claimAutoreleasedReturnValue();
  -[AKAnnotationEventHandler annotation](self, "annotation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAnnotationEventHandler initialCenter](self, "initialCenter");
  v9 = v8;
  v11 = v10;
  -[AKAnnotationEventHandler initialOtherPoint](self, "initialOtherPoint");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "originalModelBaseScaleFactor");
  v17 = v16;
  if (-[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") == 18)
  {
    +[AKGeometryHelper projectPoint:ontoRayWithFirstPoint:andSecondPoint:](AKGeometryHelper, "projectPoint:ontoRayWithFirstPoint:andSecondPoint:", x, y, v9, v11, v13, v15);
    v19 = v18 - v9;
    v21 = v20 - v11;
    +[AKGeometryHelper lengthOfVector:](AKGeometryHelper, "lengthOfVector:", v18 - v9, v20 - v11);
    v23 = v22;
    +[AKGeometryHelper convertModelToScreenOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertModelToScreenOrientationForPoint:relativeToRect:withPageController:", v48, v19, v21, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v26 = v25 > 0.0 || v24 < 0.0;
    if (v26)
      v27 = v17 * 25.0;
    else
      v27 = v23;
    v28 = v17 * 300.0;
    if (v27 <= v17 * 300.0)
      v28 = v27;
    if (v27 < v17 * 25.0)
      v28 = v17 * 25.0;
    +[AKLoupeAnnotationImageUpdaterHelper magnifiedRectForUnmagnifiedRect:ofLoupeAnnotation:onPageController:](AKLoupeAnnotationImageUpdaterHelper, "magnifiedRectForUnmagnifiedRect:ofLoupeAnnotation:onPageController:", v7, v48, v9 - v28, v11 - v28, v28 + v28, v28 + v28);
    +[AKLoupeAnnotationImageUpdaterHelper unmagnifiedRectForMagnifiedRect:ofLoupeAnnotation:](AKLoupeAnnotationImageUpdaterHelper, "unmagnifiedRectForMagnifiedRect:ofLoupeAnnotation:", v7);
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:"))
    {
      objc_msgSend(v7, "rectangle");
      v50.origin.x = v30;
      v50.origin.y = v32;
      v50.size.width = v34;
      v50.size.height = v36;
      if (!CGRectEqualToRect(v49, v50))
        objc_msgSend(v7, "setRectangle:", v30, v32, v34, v36);
    }
  }
  else if (-[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") == 19)
  {
    +[AKGeometryHelper normalizeVector:](AKGeometryHelper, "normalizeVector:", x - v9, y - v11);
    +[AKGeometryHelper convertModelToScreenOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertModelToScreenOrientationForPoint:relativeToRect:withPageController:", v48);
    +[AKGeometryHelper angleOfVector:](AKGeometryHelper, "angleOfVector:", v38, v37);
    v40 = v39 / 1.57079633;
    v41 = 1.0;
    if (v40 <= 1.0)
      v41 = v40;
    v26 = v40 < 0.0;
    v42 = 0.0;
    if (!v26)
      v42 = v41;
    v43 = v42 * 3.5 + 1.5;
    objc_msgSend(v7, "magnification");
    if (v44 <= 4.125)
    {
      objc_msgSend(v7, "magnification");
      if (v45 < 2.375 && v43 > 3.25)
        v43 = 1.5;
    }
    else if (v43 < 3.25)
    {
      v43 = 5.0;
    }
    objc_msgSend(v7, "magnification");
    if (v47 != v43)
      objc_msgSend(v7, "setMagnification:", v43);
  }

}

@end
