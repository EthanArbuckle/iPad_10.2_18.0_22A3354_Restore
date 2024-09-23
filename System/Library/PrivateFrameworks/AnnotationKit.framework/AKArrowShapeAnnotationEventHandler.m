@implementation AKArrowShapeAnnotationEventHandler

- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  objc_super v22;

  v12 = a7;
  v13 = a6;
  -[AKAnnotationEventHandler annotation](self, "annotation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)AKArrowShapeAnnotationEventHandler;
  -[AKArrowAnnotationEventHandler getInitialDraggedPoint:otherPoint:center:forEvent:orRecognizer:](&v22, sel_getInitialDraggedPoint_otherPoint_center_forEvent_orRecognizer_, a3, a4, a5, v13, v12);

  if (-[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") == 12
    || -[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") == 13)
  {
    -[AKAnnotationEventHandler pageController](self, "pageController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[AKAnnotationPointOfInterestHelper pointForDraggableArea:onAnnotation:pageControllerForPixelAlignment:](AKAnnotationPointOfInterestHelper, "pointForDraggableArea:onAnnotation:pageControllerForPixelAlignment:", -[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea"), v14, v15);
    v17 = v16;
    v19 = v18;
    objc_msgSend(v14, "endPoint");
    a3->x = v17;
    a3->y = v19;
    a4->x = v20;
    a4->y = v21;

  }
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  long double v24;
  double v25;
  double v26;
  long double v27;
  double v28;
  id v29;
  int v30;
  uint64_t v31;
  unsigned __int8 v32;
  objc_super v33;

  y = a3.y;
  x = a3.x;
  -[AKAnnotationEventHandler annotation](self, "annotation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAnnotationEventHandler pageController](self, "pageController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAnnotationPointOfInterestHelper validatePoint:ofDraggableArea:forAnnotation:onPageController:](AKAnnotationPointOfInterestHelper, "validatePoint:ofDraggableArea:forAnnotation:onPageController:", -[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea"), v8, v9, x, y);
  v11 = v10;
  v13 = v12;
  v33.receiver = self;
  v33.super_class = (Class)AKArrowShapeAnnotationEventHandler;
  -[AKArrowAnnotationEventHandler updateModelWithCurrentPoint:options:](&v33, sel_updateModelWithCurrentPoint_options_, a4);
  if (-[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") == 12
    || -[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") == 13)
  {
    objc_msgSend(v8, "startPoint");
    v15 = v14;
    v17 = v16;
    objc_msgSend(v8, "endPoint");
    +[AKGeometryHelper projectPoint:ontoRayWithFirstPoint:andSecondPoint:](AKGeometryHelper, "projectPoint:ontoRayWithFirstPoint:andSecondPoint:", v11, v13, v15, v17, v18, v19);
    v21 = v20;
    v23 = v22;
    v24 = hypot(v11 - v20, v13 - v22);
    v25 = v24 + v24;
    objc_msgSend(v8, "endPoint");
    v27 = v26 - v21;
    objc_msgSend(v8, "endPoint");
    objc_msgSend(v8, "setArrowHeadLength:", (double)hypot(v27, v28 - v23));
    if (-[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") == 12)
      objc_msgSend(v8, "setArrowLineWidth:", v25);
    else
      objc_msgSend(v8, "setArrowHeadWidth:", v25);
  }
  if (objc_msgSend(v8, "conformsToAKTextAnnotationProtocol"))
  {
    v29 = v8;
    v32 = 0;
    LOBYTE(v31) = 0;
    +[AKTextAnnotationRenderHelper getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:](AKTextAnnotationRenderHelper, "getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:", 0, 0, 0, 0, &v32, v29, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24), v9, 0, v31, 0);
    v30 = objc_msgSend(v29, "textIsClipped");
    if (v32 != v30)
      objc_msgSend(v29, "setTextIsClipped:", v32 != 0);

  }
}

@end
