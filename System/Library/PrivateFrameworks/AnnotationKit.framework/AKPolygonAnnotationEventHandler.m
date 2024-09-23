@implementation AKPolygonAnnotationEventHandler

- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  unint64_t v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  objc_super v24;
  CGPoint v25;
  CGPoint v26;
  CGPoint v27;
  CGRect v28;
  CGRect v29;

  v12 = a6;
  v13 = a7;
  v26 = (CGPoint)*MEMORY[0x24BDBEFB0];
  v27 = v26;
  v25 = v26;
  -[AKAnnotationEventHandler pageController](self, "pageController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAnnotationEventHandler annotation](self, "annotation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea");
  if (v16 - 1 >= 8)
  {
    if (v16 == 17)
    {
      +[AKAnnotationPointOfInterestHelper pointForDraggableArea:onAnnotation:pageControllerForPixelAlignment:](AKAnnotationPointOfInterestHelper, "pointForDraggableArea:onAnnotation:pageControllerForPixelAlignment:", -[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea"), v15, v14);
      v27.x = v17;
      v27.y = v18;
      objc_msgSend(v15, "rectangle");
      x = v28.origin.x;
      y = v28.origin.y;
      width = v28.size.width;
      height = v28.size.height;
      MidX = CGRectGetMidX(v28);
      v29.origin.x = x;
      v29.origin.y = y;
      v29.size.width = width;
      v29.size.height = height;
      v25.x = MidX;
      v25.y = CGRectGetMidY(v29);
      v26 = (CGPoint)__PAIR128__(*(unint64_t *)&v25.y, *(unint64_t *)&MidX);
    }
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)AKPolygonAnnotationEventHandler;
    -[AKRectangularAnnotationEventHandler getInitialDraggedPoint:otherPoint:center:forEvent:orRecognizer:](&v24, sel_getInitialDraggedPoint_otherPoint_center_forEvent_orRecognizer_, &v27, &v26, &v25, v12, v13);
  }
  *a3 = v27;
  *a4 = v26;
  *a5 = v25;

}

- (BOOL)lockAspectRatioByDefault
{
  return 1;
}

- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4
{
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
  objc_super v19[4];

  y = a3.y;
  x = a3.x;
  -[AKAnnotationEventHandler annotation](self, "annotation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAnnotationEventHandler pageController](self, "pageController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v19[1], 0, 48);
  objc_msgSend(v8, "rectangle");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v8, "rotationAngle");
  +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", v11, v13, v15, v17, -v18);
  if (-[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") == 17)
  {
    +[AKAnnotationPointOfInterestHelper validatePoint:ofDraggableArea:forAnnotation:onPageController:](AKAnnotationPointOfInterestHelper, "validatePoint:ofDraggableArea:forAnnotation:onPageController:", -[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea"), v8, v9, y * 0.0 + 0.0 * x + 0.0, y * 0.0 + 0.0 * x + 0.0);
    objc_msgSend(v8, "setPointCount:", +[AKPolygonPointOfInterestHelper numberOfPolygonPointsForControlPoint:inAnnotation:onPageController:](AKPolygonPointOfInterestHelper, "numberOfPolygonPointsForControlPoint:inAnnotation:onPageController:", v8, v9));
  }
  else
  {
    v19[0].receiver = self;
    v19[0].super_class = (Class)AKPolygonAnnotationEventHandler;
    -[objc_super updateModelWithCurrentPoint:options:](v19, sel_updateModelWithCurrentPoint_options_, a4, x, y);
  }

}

@end
