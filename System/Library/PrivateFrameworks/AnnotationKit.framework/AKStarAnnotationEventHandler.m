@implementation AKStarAnnotationEventHandler

- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  unint64_t v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat MidX;
  objc_super v20;
  CGPoint v21;
  CGPoint v22;
  CGPoint v23;
  CGRect v24;
  CGRect v25;

  v12 = a6;
  v13 = a7;
  v22 = (CGPoint)*MEMORY[0x24BDBEFB0];
  v23 = v22;
  v21 = v22;
  -[AKAnnotationEventHandler pageController](self, "pageController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAnnotationEventHandler annotation](self, "annotation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea");
  if (v16 - 1 < 8 || v16 == 17)
  {
    v20.receiver = self;
    v20.super_class = (Class)AKStarAnnotationEventHandler;
    -[AKPolygonAnnotationEventHandler getInitialDraggedPoint:otherPoint:center:forEvent:orRecognizer:](&v20, sel_getInitialDraggedPoint_otherPoint_center_forEvent_orRecognizer_, &v23, &v22, &v21, v12, v13);
  }
  else if (v16 == 16)
  {
    +[AKAnnotationPointOfInterestHelper pointForDraggableArea:onAnnotation:pageControllerForPixelAlignment:](AKAnnotationPointOfInterestHelper, "pointForDraggableArea:onAnnotation:pageControllerForPixelAlignment:", -[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea"), v15, v14);
    v23.x = v17;
    v23.y = v18;
    objc_msgSend(v15, "rectangle");
    MidX = CGRectGetMidX(v24);
    objc_msgSend(v15, "rectangle");
    v21.x = MidX;
    v21.y = CGRectGetMidY(v25);
    v22 = v21;
  }
  *a3 = v23;
  *a4 = v22;
  *a5 = v21;

}

- (BOOL)lockAspectRatioByDefault
{
  return 1;
}

- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4
{
  void *v6;
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
  float64x2_t v17;
  double x;
  double y;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  x = a3.x;
  y = a3.y;
  -[AKAnnotationEventHandler annotation](self, "annotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAnnotationEventHandler pageController](self, "pageController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  objc_msgSend(v6, "rectangle");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v6, "rotationAngle");
  +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", v9, v11, v13, v15, -v16);
  v17 = vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, y), (float64x2_t)0, x));
  if (-[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") == 16)
  {
    +[AKAnnotationPointOfInterestHelper validatePoint:ofDraggableArea:forAnnotation:onPageController:](AKAnnotationPointOfInterestHelper, "validatePoint:ofDraggableArea:forAnnotation:onPageController:", -[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea"), v6, v7, *(_OWORD *)&v17);
    +[AKStarAnnotationRenderer innerRadiusFactorForPoint:inAnnotation:onPageController:](AKStarAnnotationRenderer, "innerRadiusFactorForPoint:inAnnotation:onPageController:", v6, v7);
    objc_msgSend(v6, "setInnerRadiusFactor:");
  }
  else if (-[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") == 17)
  {
    +[AKAnnotationPointOfInterestHelper validatePoint:ofDraggableArea:forAnnotation:onPageController:](AKAnnotationPointOfInterestHelper, "validatePoint:ofDraggableArea:forAnnotation:onPageController:", -[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea"), v6, v7, *(_OWORD *)&v17);
    objc_msgSend(v6, "setPointCount:", +[AKPolygonPointOfInterestHelper numberOfPolygonPointsForControlPoint:inAnnotation:onPageController:](AKStarShapePointOfInterestHelper, "numberOfPolygonPointsForControlPoint:inAnnotation:onPageController:", v6, v7));
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)AKStarAnnotationEventHandler;
    -[AKPolygonAnnotationEventHandler updateModelWithCurrentPoint:options:](&v20, sel_updateModelWithCurrentPoint_options_, a4, x, y);
  }

}

@end
