@implementation AKAnnotationEventHandler

+ (id)newAnnotationEventHandlerForCurrentPlatformForAnnotation:(id)a3 withPageController:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_handlerClassForPlatformForAnnotation:", v7)), "_initWithAnnotation:andPageController:", v7, v6);

  return v8;
}

- (id)_initWithAnnotation:(id)a3 andPageController:(id)a4
{
  id v6;
  id v7;
  AKAnnotationEventHandler *v8;
  AKAnnotationEventHandler *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AKAnnotationEventHandler;
  v8 = -[AKAnnotationEventHandler init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AKAnnotationEventHandler setPageController:](v8, "setPageController:", v7);
    -[AKAnnotationEventHandler setAnnotation:](v9, "setAnnotation:", v6);
  }

  return v9;
}

- (BOOL)canLockAspectRatio
{
  return 1;
}

- (BOOL)alwaysLockAspectRatio
{
  return 0;
}

- (BOOL)lockAspectRatioByDefault
{
  return 0;
}

- (CGSize)naturalSizeForAnnotation
{
  double v2;
  double v3;
  CGSize result;

  v2 = 1.0;
  v3 = 1.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)naturalAspectRatioForAnnotation
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;

  -[AKAnnotationEventHandler naturalSizeForAnnotation](self, "naturalSizeForAnnotation");
  v4 = v3;
  v6 = v5;
  -[AKAnnotationEventHandler annotation](self, "annotation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "originalExifOrientation");
  if (v8 <= 4)
    v9 = v6;
  else
    v9 = v4;
  if (v8 <= 4)
    v10 = v4;
  else
    v10 = v6;
  v11 = v10 / v9;

  return v11;
}

- (BOOL)handleDownEvent:(id)a3 orRecognizer:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[AKAnnotationEventHandler pageController](self, "pageController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "showSelectionMenu:", v5);

  return 1;
}

+ (BOOL)allowsDragging
{
  return 1;
}

+ (BOOL)allowsDraggingOfAnnotation:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a1, "_handlerClassForPlatformForAnnotation:", a3);
  return MEMORY[0x24BEDD108](v3, sel_allowsDragging);
}

+ (CGRect)annotationRectangleForDraggingBounds:(CGRect)a3 forAnnotation:(id)a4 onPageController:(id)a5 withOriginalCenter:(CGPoint)a6
{
  double y;
  double x;
  CGFloat height;
  CGFloat width;
  CGFloat v11;
  CGFloat v12;
  id v13;
  id v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect result;

  y = a6.y;
  x = a6.x;
  height = a3.size.height;
  width = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  v13 = a4;
  v14 = a5;
  +[AKAnnotationRenderer draggingBoundsInsetsForAnnotation:](AKAnnotationRenderer, "draggingBoundsInsetsForAnnotation:", v13);
  v16 = -v15;
  v18 = -v17;
  v29.origin.x = v12;
  v29.origin.y = v11;
  v29.size.width = width;
  v29.size.height = height;
  v30 = CGRectInset(v29, v16, v18);
  v19 = v30.origin.x;
  v20 = v30.origin.y;
  v21 = v30.size.width;
  v22 = v30.size.height;
  v28 = v30;
  if (objc_msgSend(v13, "conformsToAKTextAnnotationProtocol"))
  {
    LOBYTE(v27) = 0;
    +[AKTextAnnotationRenderHelper getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:](AKTextAnnotationRenderHelper, "getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:", &v28, 0, 0, 0, 0, v13, x, y, v19, v20, v21, v22, v14, 0, v27, 0);
  }

  v23 = v28.origin.x;
  v24 = v28.origin.y;
  v25 = v28.size.width;
  v26 = v28.size.height;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (BOOL)enterDraggableAreaEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v18 = 0.0;
  v19 = 0.0;
  v16 = 0.0;
  v17 = 0.0;
  v14 = 0.0;
  v15 = 0.0;
  v6 = a4;
  v7 = a3;
  -[AKAnnotationEventHandler getInitialDraggedPoint:otherPoint:center:forEvent:orRecognizer:](self, "getInitialDraggedPoint:otherPoint:center:forEvent:orRecognizer:", &v18, &v16, &v14, v7, v6);
  -[AKAnnotationEventHandler setInitialDraggedPoint:](self, "setInitialDraggedPoint:", v18, v19);
  -[AKAnnotationEventHandler setInitialOtherPoint:](self, "setInitialOtherPoint:", v16, v17);
  -[AKAnnotationEventHandler setInitialCenter:](self, "setInitialCenter:", v14, v15);
  -[AKAnnotationEventHandler setupDraggingConstraints](self, "setupDraggingConstraints");
  -[AKAnnotationEventHandler windowPointFromEvent:orRecognizer:](self, "windowPointFromEvent:orRecognizer:", v7, v6);
  v9 = v8;
  v11 = v10;

  -[AKAnnotationEventHandler setLastPositionInWindow:](self, "setLastPositionInWindow:", v9, v11);
  -[AKAnnotationEventHandler lastPositionInWindow](self, "lastPositionInWindow");
  -[AKAnnotationEventHandler modelPointFromPointInWindow:](self, "modelPointFromPointInWindow:");
  -[AKAnnotationEventHandler setLastPositionInModel:](self, "setLastPositionInModel:");
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAnnotationEventHandler setTouchModifiersEnabled:](self, "setTouchModifiersEnabled:", objc_msgSend(v12, "BOOLForKey:", CFSTR("AKAnnotationEventTouchModifiersEnabled")));

  return 1;
}

- (BOOL)continueDraggableAreaEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (unint64_t)(objc_msgSend(v7, "state") - 6) < 0xFFFFFFFFFFFFFFFDLL;
      v9 = objc_msgSend(v7, "modifierFlags");
      v10 = (v9 >> 16) & 2 | (v9 >> 19) & 1;
      if (!v10)
      {
        if (-[AKAnnotationEventHandler touchModifiersEnabled](self, "touchModifiersEnabled")
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v11 = objc_msgSend(v7, "additionalNumberOfTouches");
          v10 = ((v11 & 0xFFFFFFFFFFFFFFFELL) == 2) | (2 * ((v11 & 0xFFFFFFFFFFFFFFFDLL) == 1));
        }
        else
        {
          v10 = 0;
        }
      }
      -[AKAnnotationEventHandler windowPointFromEvent:orRecognizer:](self, "windowPointFromEvent:orRecognizer:", v6, v7);
      v13 = v12;
      v15 = v14;
      -[AKAnnotationEventHandler setLastPositionInWindow:](self, "setLastPositionInWindow:");
      -[AKAnnotationEventHandler modelPointFromPointInWindow:](self, "modelPointFromPointInWindow:", v13, v15);
      v17 = v16;
      v19 = v18;
      -[AKAnnotationEventHandler updateModelWithCurrentPoint:options:](self, "updateModelWithCurrentPoint:options:", v10);
      -[AKAnnotationEventHandler setLastPositionInModel:](self, "setLastPositionInModel:", v17, v19);
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%s must be overriden by a subclass"), a5, a6, a7, "-[AKAnnotationEventHandler getInitialDraggedPoint:otherPoint:center:forEvent:orRecognizer:]");
}

- (void)setupDraggingConstraints
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%s must be overriden by a subclass"), "-[AKAnnotationEventHandler setupDraggingConstraints]");
}

- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%s must be overriden by a subclass"), a3.x, a3.y, "-[AKAnnotationEventHandler updateModelWithCurrentPoint:options:]");
}

- (CGPoint)windowPointFromEvent:(id)a3 orRecognizer:(id)a4
{
  id v5;
  id v6;
  void *v7;
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
  CGPoint result;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v5, "allTouches");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "anyObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "locationInView:", 0);
      v11 = v10;
      v13 = v12;

    }
    else
    {
      v11 = *MEMORY[0x24BDBEFB0];
      v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    }

  }
  else if (v6)
  {
    objc_msgSend(v6, "akLocationInWindow");
    v11 = v14;
    v13 = v15;
  }
  else
  {
    v11 = *MEMORY[0x24BDBEFB0];
    v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    AKLog(CFSTR("%s: Expected event or recognizer."));
  }

  v16 = v11;
  v17 = v13;
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGPoint)modelPointFromPointInWindow:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[AKAnnotationEventHandler pageController](self, "pageController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "overlayView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:fromView:", 0, x, y);
  objc_msgSend(v5, "convertPointFromOverlayToModel:");
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

+ (Class)_handlerClassForPlatformForAnnotation:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_3:
    v4 = (void *)objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (AKPageController)pageController
{
  return (AKPageController *)objc_loadWeakRetained((id *)&self->_pageController);
}

- (void)setPageController:(id)a3
{
  objc_storeWeak((id *)&self->_pageController, a3);
}

- (AKAnnotation)annotation
{
  return (AKAnnotation *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAnnotation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)initiallyDraggedArea
{
  return self->_initiallyDraggedArea;
}

- (void)setInitiallyDraggedArea:(unint64_t)a3
{
  self->_initiallyDraggedArea = a3;
}

- (BOOL)touchModifiersEnabled
{
  return self->_touchModifiersEnabled;
}

- (void)setTouchModifiersEnabled:(BOOL)a3
{
  self->_touchModifiersEnabled = a3;
}

- (CGPoint)initialDraggedPoint
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_initialDraggedPoint, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setInitialDraggedPoint:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_initialDraggedPoint, &v3, 16, 1, 0);
}

- (CGPoint)initialOtherPoint
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_initialOtherPoint, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setInitialOtherPoint:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_initialOtherPoint, &v3, 16, 1, 0);
}

- (CGPoint)initialCenter
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_initialCenter, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setInitialCenter:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_initialCenter, &v3, 16, 1, 0);
}

- (BOOL)draggingHorizontalOnly
{
  return self->_draggingHorizontalOnly;
}

- (void)setDraggingHorizontalOnly:(BOOL)a3
{
  self->_draggingHorizontalOnly = a3;
}

- (BOOL)draggingVerticalOnly
{
  return self->_draggingVerticalOnly;
}

- (void)setDraggingVerticalOnly:(BOOL)a3
{
  self->_draggingVerticalOnly = a3;
}

- (CGPoint)lastPositionInModel
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_lastPositionInModel, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setLastPositionInModel:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_lastPositionInModel, &v3, 16, 1, 0);
}

- (CGPoint)lastPositionInWindow
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_lastPositionInWindow, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setLastPositionInWindow:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_lastPositionInWindow, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_destroyWeak((id *)&self->_pageController);
}

@end
