@implementation AKLegacyDoodleController

- (AKLegacyDoodleController)initWithController:(id)a3
{
  id v4;
  AKLegacyDoodleController *v5;
  AKLegacyDoodleController *v6;
  void *v7;
  void *v8;
  AKShapeDetectionController *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AKLegacyDoodleController;
  v5 = -[AKLegacyDoodleController init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AKLegacyDoodleController setController:](v5, "setController:", v4);
    -[AKLegacyDoodleController setSelectNewlyCreatedAnnotations:](v6, "setSelectNewlyCreatedAnnotations:", 1);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKLegacyDoodleController setRecentDoodlesAnnotations:](v6, "setRecentDoodlesAnnotations:", v7);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKLegacyDoodleController setRecentDoodlePaths:](v6, "setRecentDoodlePaths:", v8);

    -[AKLegacyDoodleController setRecentDrawingBoundsInInputView:](v6, "setRecentDrawingBoundsInInputView:", *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
    -[AKLegacyDoodleController setIsWaitingToCoalesceStrokes:](v6, "setIsWaitingToCoalesceStrokes:", 0);
    v9 = -[AKShapeDetectionController initWithController:]([AKShapeDetectionController alloc], "initWithController:", v4);
    -[AKLegacyDoodleController setShapeDetectionController:](v6, "setShapeDetectionController:", v9);

    -[AKLegacyDoodleController shapeDetectionController](v6, "shapeDetectionController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v6);

    -[AKLegacyDoodleController setShapeDetectionEnabled:](v6, "setShapeDetectionEnabled:", objc_msgSend(v4, "shapeDetectionEnabled"));
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_updateOverlayBoundsAndBackingScale_, 0);
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__coalesceRecentDrawings, 0);
  v4.receiver = self;
  v4.super_class = (Class)AKLegacyDoodleController;
  -[AKLegacyDoodleController dealloc](&v4, sel_dealloc);
}

- (AKSmoothPathView)intelligentSketchOverlayView
{
  AKSmoothPathView *intelligentSketchOverlayView;
  void *v4;
  AKSmoothPathView *v5;
  AKSmoothPathView *v6;

  intelligentSketchOverlayView = self->_intelligentSketchOverlayView;
  if (!intelligentSketchOverlayView)
  {
    -[AKLegacyDoodleController controller](self, "controller");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[AKSmoothPathView newSmoothPathViewForCurrentPlatformWithController:](AKSmoothPathView, "newSmoothPathViewForCurrentPlatformWithController:", v4);
    v6 = self->_intelligentSketchOverlayView;
    self->_intelligentSketchOverlayView = v5;

    -[AKSmoothPathView setDelegate:](self->_intelligentSketchOverlayView, "setDelegate:", self);
    -[AKSmoothPathView setUserInteractionEnabled:](self->_intelligentSketchOverlayView, "setUserInteractionEnabled:", 0);
    intelligentSketchOverlayView = self->_intelligentSketchOverlayView;
  }
  return intelligentSketchOverlayView;
}

- (void)showOverlay
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  if (!-[AKLegacyDoodleController isShowingOverlay](self, "isShowingOverlay"))
  {
    -[AKLegacyDoodleController setIsShowingOverlay:](self, "setIsShowingOverlay:", 1);
    -[AKLegacyDoodleController controller](self, "controller");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "currentPageController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "overlayView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[AKLegacyDoodleController intelligentSketchOverlayView](self, "intelligentSketchOverlayView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "positionSketchOverlay:forAnnotationController:", v7, v21);
    }
    else
    {
      -[AKLegacyDoodleController _frameForOurOverlayInHostingView:](self, "_frameForOurOverlayInHostingView:", v5);
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      -[AKLegacyDoodleController intelligentSketchOverlayView](self, "intelligentSketchOverlayView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

      -[AKLegacyDoodleController intelligentSketchOverlayView](self, "intelligentSketchOverlayView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAutoresizingMask:", 18);

      -[AKLegacyDoodleController intelligentSketchOverlayView](self, "intelligentSketchOverlayView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "insertSubview:aboveSubview:", v18, v4);

      objc_msgSend(v5, "akEnclosingScrollView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        -[AKLegacyDoodleController updateOverlayBoundsAndBackingScale:](self, "updateOverlayBoundsAndBackingScale:", v7);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", self, sel_enclosingScrollViewNotification_, CFSTR("AKOverlayView.AKContentScrollViewVisibleRectChangeNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_toolbarNotification_, CFSTR("AKAttributeToolbarDidShowNotification"), 0);

    -[AKLegacyDoodleController updateStrokeAttributes](self, "updateStrokeAttributes");
  }
}

- (void)removeOverlay
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_updateOverlayBoundsAndBackingScale_, 0);
  if (-[AKLegacyDoodleController isShowingOverlay](self, "isShowingOverlay"))
  {
    -[AKLegacyDoodleController setIsShowingOverlay:](self, "setIsShowingOverlay:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("AKOverlayView.AKContentScrollViewVisibleRectChangeNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("AKAttributeToolbarDidShowNotification"), 0);

    -[AKLegacyDoodleController shapeDetectionController](self, "shapeDetectionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reset");

    -[AKLegacyDoodleController intelligentSketchOverlayView](self, "intelligentSketchOverlayView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[AKLegacyDoodleController intelligentSketchOverlayView](self, "intelligentSketchOverlayView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "teardown");

    MEMORY[0x24BEDD108](self, sel_setIntelligentSketchOverlayView_);
  }
}

- (void)enclosingScrollViewNotification:(id)a3
{
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_updateOverlayBoundsAndBackingScale_, 0);
  -[AKLegacyDoodleController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_updateOverlayBoundsAndBackingScale_, 0, 0.1);
}

- (void)toolbarNotification:(id)a3
{
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_updateOverlayBoundsAndBackingScale_, 0);
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[AKLegacyDoodleController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_updateOverlayBoundsAndBackingScale_, 0, 0.0);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)updateOverlayBoundsAndBackingScale:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  id v33;
  id v34;

  v33 = a3;
  -[AKLegacyDoodleController controller](self, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AKLegacyDoodleController intelligentSketchOverlayView](self, "intelligentSketchOverlayView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "positionSketchOverlay:forAnnotationController:", v6, v4);
LABEL_13:

    goto LABEL_14;
  }
  v7 = v33;
  if (!v33)
  {
    -[AKLegacyDoodleController intelligentSketchOverlayView](self, "intelligentSketchOverlayView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "akEnclosingScrollView");
    v34 = (id)objc_claimAutoreleasedReturnValue();

    v7 = v34;
    if (!v34)
    {
      v33 = 0;
      goto LABEL_14;
    }
  }
  v33 = v7;
  objc_msgSend(v7, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v33, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "screen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    v13 = v12;

    objc_msgSend(v33, "zoomScale");
    v15 = v13 * v14;
    if (v15 >= v13)
      v16 = v13;
    else
      v16 = v15;
    -[AKLegacyDoodleController intelligentSketchOverlayView](self, "intelligentSketchOverlayView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 <= 0.0)
    {
      objc_msgSend(v18, "setContentsScale:", v13);

      -[AKLegacyDoodleController intelligentSketchOverlayView](self, "intelligentSketchOverlayView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setRasterizationScale:", v13);
    }
    else
    {
      objc_msgSend(v18, "setContentsScale:", v16);

      -[AKLegacyDoodleController intelligentSketchOverlayView](self, "intelligentSketchOverlayView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setRasterizationScale:", v16);
    }

    objc_msgSend(v4, "currentPageController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "overlayView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "superview");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKLegacyDoodleController _frameForOurOverlayInHostingView:](self, "_frameForOurOverlayInHostingView:", v22);
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    -[AKLegacyDoodleController intelligentSketchOverlayView](self, "intelligentSketchOverlayView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFrame:", v24, v26, v28, v30);

    -[AKLegacyDoodleController intelligentSketchOverlayView](self, "intelligentSketchOverlayView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAutoresizingMask:", 18);

    goto LABEL_13;
  }
LABEL_14:

}

- (CGRect)_frameForOurOverlayInHostingView:(id)a3
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect result;
  CGRect v36;

  v3 = a3;
  objc_msgSend(v3, "bounds");
  objc_msgSend(v3, "convertRect:toView:", 0);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v33.origin.x = v5;
  v33.origin.y = v7;
  v33.size.width = v9;
  v33.size.height = v11;
  v36.origin.x = v14;
  v36.origin.y = v16;
  v36.size.width = v18;
  v36.size.height = v20;
  v34 = CGRectIntersection(v33, v36);
  objc_msgSend(v3, "convertRect:fromView:", 0, v34.origin.x, v34.origin.y, v34.size.width, v34.size.height);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  v29 = v22;
  v30 = v24;
  v31 = v26;
  v32 = v28;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)handleForwardedEvent:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AKLegacyDoodleController intelligentSketchOverlayView](self, "intelligentSketchOverlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleForwardedEvent:", v5);

}

- (void)handleTapAction:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AKLegacyDoodleController intelligentSketchOverlayView](self, "intelligentSketchOverlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleTapAction:", v5);

}

- (void)handleDragAction:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AKLegacyDoodleController intelligentSketchOverlayView](self, "intelligentSketchOverlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleDragAction:", v5);

}

- (void)updateStrokeAttributes
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AKLegacyDoodleController controller](self, "controller");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKLegacyDoodleController intelligentSketchOverlayView](self, "intelligentSketchOverlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "strokeColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStrokeColor:", v5);

  objc_msgSend(v3, "strokeWidth");
  objc_msgSend(v4, "setStrokeWidth:");
  objc_msgSend(v4, "setPrestrokedOutputMode:", -[AKLegacyDoodleController pressureSensitiveDoodleMode](self, "pressureSensitiveDoodleMode"));
  objc_msgSend(v4, "setHasShadow:", objc_msgSend(v3, "hasShadow"));

}

- (BOOL)isShowingCandidatePicker
{
  void *v2;
  char v3;

  -[AKLegacyDoodleController shapeDetectionController](self, "shapeDetectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isShowingCandidatePicker");

  return v3;
}

- (void)dismissCandidatePicker
{
  id v2;

  -[AKLegacyDoodleController shapeDetectionController](self, "shapeDetectionController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissCandidatePicker");

}

- (void)setShapeDetectionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_shapeDetectionEnabled = a3;
  -[AKLegacyDoodleController shapeDetectionController](self, "shapeDetectionController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShapeDetectionEnabled:", v3);

}

- (void)inputViewWillStartDrawing:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  BOOL v7;

  +[AKLegacyDoodleController cancelPreviousPerformRequestsWithTarget:selector:object:](AKLegacyDoodleController, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__executeDeferredRecognition, 0);
  -[AKLegacyDoodleController performRecognitionBlock](self, "performRecognitionBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKLegacyDoodleController performRecognitionBlock](self, "performRecognitionBlock");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0);

    -[AKLegacyDoodleController setPerformRecognitionBlock:](self, "setPerformRecognitionBlock:", 0);
  }
  if (-[AKLegacyDoodleController coalescesDoodles](self, "coalescesDoodles"))
  {
    -[AKLegacyDoodleController shapeDetectionController](self, "shapeDetectionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isPreviousCandidateAnnotationUndecided"))
    {
      v7 = -[AKLegacyDoodleController isWaitingToCoalesceStrokes](self, "isWaitingToCoalesceStrokes");

      if (v7)
      {
LABEL_8:
        objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__coalesceRecentDrawings, 0);
        goto LABEL_9;
      }
      -[AKLegacyDoodleController shapeDetectionController](self, "shapeDetectionController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clearPreviousCandidateAnnotation");
    }

    goto LABEL_8;
  }
LABEL_9:
  -[AKLegacyDoodleController dismissCandidatePicker](self, "dismissCandidatePicker");
}

- (void)inputView:(id)a3 didCollectPath:(CGPath *)a4
{
  MEMORY[0x24BEDD108](self, sel__inputView_didCollectPath_isPrestroked_);
}

- (void)inputView:(id)a3 didCollectPrestrokedPath:(CGPath *)a4
{
  MEMORY[0x24BEDD108](self, sel__inputView_didCollectPath_isPrestroked_);
}

- (void)_inputView:(id)a3 didCollectPath:(CGPath *)a4 isPrestroked:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  double x;
  double y;
  double width;
  double height;
  uint64_t v14;
  double MidX;
  double MidY;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  void *v22;
  id v23;
  CGRect BoundingBox;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v5 = a5;
  v23 = a3;
  if (-[AKLegacyDoodleController coalescesDoodles](self, "coalescesDoodles"))
    -[AKLegacyDoodleController _beginOrExtendCoalescingTimer](self, "_beginOrExtendCoalescingTimer");
  objc_msgSend(v23, "drawing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
    BoundingBox = CGPathGetBoundingBox(a4);
  else
    objc_msgSend(v8, "bounds");
  x = BoundingBox.origin.x;
  y = BoundingBox.origin.y;
  width = BoundingBox.size.width;
  height = BoundingBox.size.height;
  v14 = objc_msgSend(v9, "strokeCount");
  if (v14)
  {
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    MidX = CGRectGetMidX(v25);
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    MidY = CGRectGetMidY(v26);
  }
  else
  {
    v27 = CGPathGetBoundingBox(a4);
    v17 = v27.origin.x;
    v18 = v27.origin.y;
    v19 = v27.size.width;
    v20 = v27.size.height;
    x = CGRectGetMidX(v27);
    v28.origin.x = v17;
    v28.origin.y = v18;
    v28.size.width = v19;
    v28.size.height = v20;
    MidY = CGRectGetMidY(v28);
    y = MidY;
    width = *(double *)(MEMORY[0x24BDBF090] + 16);
    height = *(double *)(MEMORY[0x24BDBF090] + 24);
    MidX = x;
  }
  v21 = MidY;
  -[AKLegacyDoodleController _addAnnotationImmediatelyFor:withDrawingCenter:drawingBoundsInView:pathIsPrestroked:isSingelDot:fromInputView:](self, "_addAnnotationImmediatelyFor:withDrawingCenter:drawingBoundsInView:pathIsPrestroked:isSingelDot:fromInputView:", a4, v5, v14 == 0, v23, MidX, MidY, x, y, width, height);
  if (v14 && -[AKLegacyDoodleController shapeDetectionEnabled](self, "shapeDetectionEnabled"))
  {
    v22 = (void *)objc_msgSend(v9, "copy");

    if (+[AKShapeDetectionController drawingIsValidForRecognition:withPath:](AKShapeDetectionController, "drawingIsValidForRecognition:withPath:", v22, a4))
    {
      -[AKLegacyDoodleController _scheduleDelayedRecognitionForDrawing:withPath:boundsInView:center:isPrestroked:](self, "_scheduleDelayedRecognitionForDrawing:withPath:boundsInView:center:isPrestroked:", v22, a4, v5, x, y, width, height, MidX, v21);
    }
  }
  else
  {
    v22 = v9;
  }

}

- (void)_scheduleDelayedRecognitionForDrawing:(id)a3 withPath:(CGPath *)a4 boundsInView:(CGRect)a5 center:(CGPoint)a6 isPrestroked:(BOOL)a7
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  CGFloat v12;
  CGFloat v13;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21[8];
  BOOL v22;
  id location;

  y = a6.y;
  x = a6.x;
  height = a5.size.height;
  width = a5.size.width;
  v12 = a5.origin.y;
  v13 = a5.origin.x;
  v16 = a3;
  objc_initWeak(&location, self);
  CGPathRetain(a4);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_22902F360;
  v19[3] = &unk_24F1A7E50;
  objc_copyWeak(v21, &location);
  v17 = v16;
  v20 = v17;
  v21[1] = a4;
  v21[2] = *(id *)&v13;
  v21[3] = *(id *)&v12;
  v21[4] = *(id *)&width;
  v21[5] = *(id *)&height;
  v21[6] = *(id *)&x;
  v21[7] = *(id *)&y;
  v22 = a7;
  v18 = (void *)MEMORY[0x22E2C12D0](v19);
  -[AKLegacyDoodleController setPerformRecognitionBlock:](self, "setPerformRecognitionBlock:", v18);
  -[AKLegacyDoodleController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__executeDeferredRecognition, 0, 0.2);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

}

- (void)_executeDeferredRecognition
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);

  -[AKLegacyDoodleController performRecognitionBlock](self, "performRecognitionBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AKLegacyDoodleController performRecognitionBlock](self, "performRecognitionBlock");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 1);

    -[AKLegacyDoodleController setPerformRecognitionBlock:](self, "setPerformRecognitionBlock:", 0);
  }
}

- (void)_addAnnotationImmediatelyFor:(CGPath *)a3 withDrawingCenter:(CGPoint)a4 drawingBoundsInView:(CGRect)a5 pathIsPrestroked:(BOOL)a6 isSingelDot:(BOOL)a7 fromInputView:(id)a8
{
  _BOOL4 v8;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  if (a3)
  {
    v8 = a7;
    height = a5.size.height;
    width = a5.size.width;
    y = a5.origin.y;
    x = a5.origin.x;
    v23 = 0;
    -[AKLegacyDoodleController createDoodleAnnotationWithPath:drawingBoundsInView:drawingCenter:pathIsPrestroked:shouldGoToPageController:](self, "createDoodleAnnotationWithPath:drawingBoundsInView:drawingCenter:pathIsPrestroked:shouldGoToPageController:", a3, a6, &v23, a8, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a4.x, a4.y);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v23;
    if (v15)
    {
      -[AKLegacyDoodleController setIgnoreAnnotationAndSelectionKVO:](self, "setIgnoreAnnotationAndSelectionKVO:", 1);
      if (v8)
        objc_msgSend(v15, "setPathIsDot:", 1);
      -[AKLegacyDoodleController controller](self, "controller");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "toolController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addNewAnnotation:onPageController:shouldSelect:shouldCascade:", v15, v16, -[AKLegacyDoodleController shapeDetectionController:shouldSelectCandidateAnnotation:](self, "shapeDetectionController:shouldSelectCandidateAnnotation:", 0, v15), 0);

      -[AKLegacyDoodleController setIgnoreAnnotationAndSelectionKVO:](self, "setIgnoreAnnotationAndSelectionKVO:", 0);
    }
    if (-[AKLegacyDoodleController coalescesDoodles](self, "coalescesDoodles"))
    {
      -[AKLegacyDoodleController recentDoodlePaths](self, "recentDoodlePaths");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithCGPath:", a3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v20);

      if (v15)
      {
        -[AKLegacyDoodleController recentDoodlesAnnotations](self, "recentDoodlesAnnotations");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v15);

      }
      -[AKLegacyDoodleController recentDrawingBoundsInInputView](self, "recentDrawingBoundsInInputView");
      v26.origin.x = x;
      v26.origin.y = y;
      v26.size.width = width;
      v26.size.height = height;
      v25 = CGRectUnion(v24, v26);
      -[AKLegacyDoodleController setRecentDrawingBoundsInInputView:](self, "setRecentDrawingBoundsInInputView:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
    }
    -[AKLegacyDoodleController shapeDetectionController](self, "shapeDetectionController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCandidateAnnotation:", v15);

  }
}

- (id)createDoodleAnnotationWithPath:(CGPath *)a3 drawingBoundsInView:(CGRect)a4 drawingCenter:(CGPoint)a5 pathIsPrestroked:(BOOL)a6 shouldGoToPageController:(id *)a7
{
  _BOOL8 v8;
  double height;
  double width;
  double y;
  double x;
  void *v15;
  void *v16;
  void *v17;
  double MidX;
  double MidY;
  double v20;
  __int128 v21;
  void *v22;
  void *v23;
  const CGPath *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CGRect v30;
  CGRect v31;

  v8 = a6;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[AKLegacyDoodleController controller](self, "controller", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.x, a5.y);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "toolController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "createAnnotationOfType:centeredAtPoint:", 764018, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  MidX = CGRectGetMidX(v30);
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  MidY = CGRectGetMidY(v31);
  if (a3)
  {
    v20 = MidY;
    v21 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
    v28 = *MEMORY[0x24BDBF090];
    v29 = v21;
    -[AKLegacyDoodleController shapeDetectionController](self, "shapeDetectionController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &v28, x, y, fmax(width, 1.0), fmax(height, 1.0));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setRectangle:", v28, v29);
    objc_msgSend(v17, "setPathIsPrestroked:", v8);
    +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", 4, MidX, v20, 0, 0, 0, 0, 0, 0);
    v24 = (const CGPath *)MEMORY[0x22E2C0A54](a3, &v27);
    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithCGPath:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    CGPathRelease(v24);
    objc_msgSend(v17, "setPath:", v25);

  }
  else
  {
    v23 = 0;
  }
  objc_msgSend(v17, "setOriginalExifOrientation:", objc_msgSend(v23, "currentModelToScreenExifOrientation"));
  objc_msgSend(v23, "modelBaseScaleFactor");
  objc_msgSend(v17, "setOriginalModelBaseScaleFactor:");
  if (a7)
    *a7 = objc_retainAutorelease(v23);

  return v17;
}

- (id)overlayView:(id)a3
{
  -[AKLegacyDoodleController intelligentSketchOverlayView](self, "intelligentSketchOverlayView", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)beginIgnoringAnnotationSelectionObservation:(id)a3
{
  -[AKLegacyDoodleController setIgnoreAnnotationAndSelectionKVO:](self, "setIgnoreAnnotationAndSelectionKVO:", 1);
}

- (void)endIgnoringAnnotationSelectionObservation:(id)a3
{
  -[AKLegacyDoodleController setIgnoreAnnotationAndSelectionKVO:](self, "setIgnoreAnnotationAndSelectionKVO:", 0);
}

- (BOOL)isIgnoringAnnotationAndSelectionKVO:(id)a3
{
  return MEMORY[0x24BEDD108](self, sel_ignoreAnnotationAndSelectionKVO);
}

- (BOOL)shapeDetectionController:(id)a3 shouldSelectCandidateAnnotation:(id)a4
{
  id v5;

  v5 = a4;
  LOBYTE(self) = -[AKLegacyDoodleController selectNewlyCreatedAnnotations](self, "selectNewlyCreatedAnnotations");
  objc_opt_class();
  LOBYTE(self) = self & (objc_opt_isKindOfClass() ^ 1);

  return (char)self;
}

- (void)shapeDetectionControllerWillPickCandidate:(id)a3 isInk:(BOOL)a4
{
  void *v5;
  void *v6;

  if (-[AKLegacyDoodleController coalescesDoodles](self, "coalescesDoodles", a3, a4))
  {
    -[AKLegacyDoodleController coalescedAnnotation](self, "coalescedAnnotation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[AKLegacyDoodleController setIgnoreAnnotationAndSelectionKVO:](self, "setIgnoreAnnotationAndSelectionKVO:", 1);
      -[AKLegacyDoodleController controller](self, "controller");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "undo:", self);

      -[AKLegacyDoodleController setCoalescedAnnotation:](self, "setCoalescedAnnotation:", 0);
      -[AKLegacyDoodleController setIgnoreAnnotationAndSelectionKVO:](self, "setIgnoreAnnotationAndSelectionKVO:", 0);
    }
    else
    {
      MEMORY[0x24BEDD108](self, sel__coalesceDrawingsCancelled);
    }
  }
}

- (CGRect)shapeDetectionControllerPositioningRectForCandidatePicker:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_coalesceRecentDrawings
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const CGPath *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;
  CGRect v37;
  CGRect v38;

  v36 = *MEMORY[0x24BDAC8D0];
  -[AKLegacyDoodleController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKLegacyDoodleController recentDoodlesAnnotations](self, "recentDoodlesAnnotations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 < 2)
  {
    -[AKLegacyDoodleController _clearCoalescingState](self, "_clearCoalescingState");
  }
  else
  {
    -[AKLegacyDoodleController recentDoodlesAnnotations](self, "recentDoodlesAnnotations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "pathIsPrestroked");

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[AKLegacyDoodleController recentDoodlesAnnotations](self, "recentDoodlesAnnotations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v31;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v9);
        if ((_DWORD)v8 != objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v12), "pathIsPrestroked"))
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
          if (v10)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      objc_msgSend(MEMORY[0x24BDF6870], "bezierPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      -[AKLegacyDoodleController recentDoodlePaths](self, "recentDoodlePaths");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v27;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v27 != v15)
              objc_enumerationMutation(v13);
            objc_msgSend(v9, "akAppendPath:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v16++));
          }
          while (v14 != v16);
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        }
        while (v14);
      }

      -[AKLegacyDoodleController recentDrawingBoundsInInputView](self, "recentDrawingBoundsInInputView");
      CGRectGetMidX(v37);
      -[AKLegacyDoodleController recentDrawingBoundsInInputView](self, "recentDrawingBoundsInInputView");
      CGRectGetMidY(v38);
      v17 = (const CGPath *)objc_msgSend(v9, "newCGPathForPlatformBezierPath");
      -[AKLegacyDoodleController recentDrawingBoundsInInputView](self, "recentDrawingBoundsInInputView");
      v25 = 0;
      -[AKLegacyDoodleController createDoodleAnnotationWithPath:drawingBoundsInView:drawingCenter:pathIsPrestroked:shouldGoToPageController:](self, "createDoodleAnnotationWithPath:drawingBoundsInView:drawingCenter:pathIsPrestroked:shouldGoToPageController:", v17, v8, &v25);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v25;
      if (v18)
      {
        -[AKLegacyDoodleController setIgnoreAnnotationAndSelectionKVO:](self, "setIgnoreAnnotationAndSelectionKVO:", 1);
        objc_msgSend(v3, "toolController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addNewAnnotation:onPageController:shouldSelect:shouldCascade:", v18, v19, 0, 0);

        -[AKLegacyDoodleController setCoalescedAnnotation:](self, "setCoalescedAnnotation:", v18);
        objc_msgSend(v19, "pageModelController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKLegacyDoodleController recentDoodlesAnnotations](self, "recentDoodlesAnnotations");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKLegacyDoodleController _removeAnnotations:mostLikelyFromPageController:](self, "_removeAnnotations:mostLikelyFromPageController:", v22, v21);

        -[AKLegacyDoodleController setIgnoreAnnotationAndSelectionKVO:](self, "setIgnoreAnnotationAndSelectionKVO:", 0);
      }
      CGPathRelease(v17);

    }
    -[AKLegacyDoodleController recentDoodlesAnnotations](self, "recentDoodlesAnnotations");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeAllObjects");

    -[AKLegacyDoodleController recentDoodlePaths](self, "recentDoodlePaths");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeAllObjects");

    -[AKLegacyDoodleController setRecentDrawingBoundsInInputView:](self, "setRecentDrawingBoundsInInputView:", *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
  }
  -[AKLegacyDoodleController setIsWaitingToCoalesceStrokes:](self, "setIsWaitingToCoalesceStrokes:", 0);

}

- (void)_clearCoalescingState
{
  void *v3;
  void *v4;

  -[AKLegacyDoodleController recentDoodlesAnnotations](self, "recentDoodlesAnnotations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[AKLegacyDoodleController recentDoodlePaths](self, "recentDoodlePaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[AKLegacyDoodleController setRecentDrawingBoundsInInputView:](self, "setRecentDrawingBoundsInInputView:", *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
  -[AKLegacyDoodleController setCoalescedAnnotation:](self, "setCoalescedAnnotation:", 0);
}

- (void)_coalesceDrawingsCancelled
{
  -[AKLegacyDoodleController setIsWaitingToCoalesceStrokes:](self, "setIsWaitingToCoalesceStrokes:", 0);
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__coalesceRecentDrawings, 0);
  -[AKLegacyDoodleController _clearCoalescingState](self, "_clearCoalescingState");
}

- (void)_beginOrExtendCoalescingTimer
{
  -[AKLegacyDoodleController setIsWaitingToCoalesceStrokes:](self, "setIsWaitingToCoalesceStrokes:", 1);
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__coalesceRecentDrawings, 0);
  -[AKLegacyDoodleController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__coalesceRecentDrawings, 0, 0.25);
}

- (void)_removeAnnotations:(id)a3 mostLikelyFromPageController:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  AKLegacyDoodleController *v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v23 = a4;
  objc_msgSend(v23, "annotations", v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = sub_2290302B4;
  v29[3] = &unk_24F1A7E78;
  v21 = v6;
  v30 = v21;
  v31 = self;
  v8 = v7;
  v32 = v8;
  objc_msgSend(v24, "indexesOfObjectsPassingTest:", v29);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "mutableArrayValueForKey:", CFSTR("annotations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectsAtIndexes:", v22);

  -[AKLegacyDoodleController controller](self, "controller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKLegacyDoodleController shapeDetectionController](self, "shapeDetectionController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "candidateAnnotation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v26;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v16);
        if (v17 != v12)
        {
          objc_msgSend(v10, "modelController");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "pageModelControllerForAnnotation:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "mutableArrayValueForKey:", CFSTR("annotations"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "removeObject:", v17);

        }
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v14);
  }

}

- (BOOL)preferDoodle
{
  return self->_preferDoodle;
}

- (void)setPreferDoodle:(BOOL)a3
{
  self->_preferDoodle = a3;
}

- (BOOL)coalescesDoodles
{
  return self->_coalescesDoodles;
}

- (void)setCoalescesDoodles:(BOOL)a3
{
  self->_coalescesDoodles = a3;
}

- (BOOL)shapeDetectionEnabled
{
  return self->_shapeDetectionEnabled;
}

- (BOOL)selectNewlyCreatedAnnotations
{
  return self->_selectNewlyCreatedAnnotations;
}

- (void)setSelectNewlyCreatedAnnotations:(BOOL)a3
{
  self->_selectNewlyCreatedAnnotations = a3;
}

- (void)setIntelligentSketchOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_intelligentSketchOverlayView, a3);
}

- (BOOL)pressureSensitiveDoodleMode
{
  return self->_pressureSensitiveDoodleMode;
}

- (void)setPressureSensitiveDoodleMode:(BOOL)a3
{
  self->_pressureSensitiveDoodleMode = a3;
}

- (AKShapeDetectionController)shapeDetectionController
{
  return self->_shapeDetectionController;
}

- (void)setShapeDetectionController:(id)a3
{
  objc_storeStrong((id *)&self->_shapeDetectionController, a3);
}

- (AKController)controller
{
  return (AKController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (id)performRecognitionBlock
{
  return self->_performRecognitionBlock;
}

- (void)setPerformRecognitionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (AKAnnotation)coalescedAnnotation
{
  return (AKAnnotation *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCoalescedAnnotation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableArray)recentDoodlesAnnotations
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRecentDoodlesAnnotations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableArray)recentDoodlePaths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRecentDoodlePaths:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (CGRect)recentDrawingBoundsInInputView
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_recentDrawingBoundsInInputView, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setRecentDrawingBoundsInInputView:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_recentDrawingBoundsInInputView, &v3, 32, 1, 0);
}

- (BOOL)ignoreAnnotationAndSelectionKVO
{
  return self->_ignoreAnnotationAndSelectionKVO;
}

- (void)setIgnoreAnnotationAndSelectionKVO:(BOOL)a3
{
  self->_ignoreAnnotationAndSelectionKVO = a3;
}

- (BOOL)isShowingOverlay
{
  return self->_isShowingOverlay;
}

- (void)setIsShowingOverlay:(BOOL)a3
{
  self->_isShowingOverlay = a3;
}

- (BOOL)isWaitingToCoalesceStrokes
{
  return self->_isWaitingToCoalesceStrokes;
}

- (void)setIsWaitingToCoalesceStrokes:(BOOL)a3
{
  self->_isWaitingToCoalesceStrokes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentDoodlePaths, 0);
  objc_storeStrong((id *)&self->_recentDoodlesAnnotations, 0);
  objc_storeStrong((id *)&self->_coalescedAnnotation, 0);
  objc_storeStrong(&self->_performRecognitionBlock, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_shapeDetectionController, 0);
  objc_storeStrong((id *)&self->_intelligentSketchOverlayView, 0);
}

@end
