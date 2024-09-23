@implementation AKInkPageOverlayController

- (AKInkPageOverlayController)initWithPageController:(id)a3
{
  id v4;
  AKInkPageOverlayController *v5;
  AKInkPageOverlayController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKInkPageOverlayController;
  v5 = -[AKInkPageOverlayController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[AKInkPageOverlayController setPageController:](v5, "setPageController:", v4);

  return v6;
}

- (void)setup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__fullSetup, 0);
  -[AKInkPageOverlayController pageController](self, "pageController");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pageModelController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inkCanvasAnnotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (objc_msgSend(v5, "drawing"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "strokes"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6,
        v8))
  {
    -[AKInkPageOverlayController _fullSetup](self, "_fullSetup");
  }
  else
  {
    objc_msgSend(v3, "toolController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "allInkEnabled") & 1) != 0 || objc_msgSend(v9, "pencilInkEnabled"))
    {
      -[AKInkPageOverlayController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__fullSetup, 0, 0.25);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = off_255A25E10[0];
      objc_msgSend(v15, "pageModelController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__inkCanvasAnnotationUpdated_, v11, v12);

    }
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__toolStatusUpdated_, CFSTR("AKToolController.inkToolStatusUpdated"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__controllerWillSave_, AKControllerWillSaveNotification, v3);

}

- (void)_fullSetup
{
  void *v3;
  void *v4;
  void *v5;
  AKShapeDetectionController *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;

  -[AKInkPageOverlayController inkOverlayView](self, "inkOverlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[AKInkPageOverlayController pageController](self, "pageController");
    v51 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "controller");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && (objc_msgSend(v4, "isTornDown") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDE57D8], "begin");
      objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
      v6 = -[AKShapeDetectionController initWithController:]([AKShapeDetectionController alloc], "initWithController:", v5);
      -[AKInkPageOverlayController setShapeDetectionController:](self, "setShapeDetectionController:", v6);

      -[AKInkPageOverlayController shapeDetectionController](self, "shapeDetectionController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDelegate:", self);

      v8 = objc_msgSend(v5, "shapeDetectionEnabled");
      -[AKInkPageOverlayController shapeDetectionController](self, "shapeDetectionController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setShapeDetectionEnabled:", v8);

      objc_msgSend(v51, "pageModelController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKInkPageOverlayController shapeDetectionController](self, "shapeDetectionController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setModelControllerToObserveForAnnotationsAndSelections:", v10);

      objc_msgSend(v51, "overlayView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      objc_msgSend(v51, "inkOverlayDrawingUndoTarget");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = +[AKInkOverlayView newAKInkOverlayViewForCurrentPlatformWithPageController:drawingUndoTarget:](AKInkOverlayView, "newAKInkOverlayViewForCurrentPlatformWithPageController:drawingUndoTarget:", v51, v21);

      -[AKInkPageOverlayController setInkOverlayView:](self, "setInkOverlayView:", v22);
      objc_msgSend(v22, "setDelegate:", self);
      objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v22, "setFrame:", v14, v16, v18, v20);
      objc_msgSend(v12, "addSubview:", v22);
      objc_msgSend(v22, "centerXAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "centerXAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setActive:", 1);

      objc_msgSend(v22, "centerYAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "centerYAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setActive:", 1);

      objc_msgSend(v22, "widthAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "widthAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setActive:", 1);

      objc_msgSend(v22, "heightAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v12;
      objc_msgSend(v12, "heightAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintEqualToAnchor:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setActive:", 1);

      v35 = (double)((2 * AKAdornmentZPositionOffset) | 1uLL);
      objc_msgSend(v22, "layer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setZPosition:", v35);

      -[AKInkPageOverlayController _setupGestureDependencies](self, "_setupGestureDependencies");
      objc_msgSend(v5, "undoController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "undoManager");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = objc_msgSend(v38, "isUndoRegistrationEnabled");
      if (v39)
        objc_msgSend(v38, "disableUndoRegistration");
      objc_msgSend(v51, "pageModelController");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "inkCanvasAnnotation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        objc_msgSend(v41, "drawing");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          objc_msgSend(v41, "drawing");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "canvasView");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setDrawing:", v43);

        }
        else
        {
          NSLog(CFSTR("The canvas annotation didn't have a drawing. This should never happen! Please file a bug report."));
        }
      }
      if (v39)
        objc_msgSend(v38, "enableUndoRegistration");
      objc_msgSend(v5, "toolController");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKInkPageOverlayController _updateAllowedTouchTypesAllEnabled:pencilEnabled:](self, "_updateAllowedTouchTypesAllEnabled:pencilEnabled:", objc_msgSend(v45, "allInkEnabled"), objc_msgSend(v45, "pencilInkEnabled"));
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attributeController");
      v47 = v38;
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addObserver:selector:name:object:", self, sel__inkDidChangeNotification_, CFSTR("AKAttributeController.inkDidChange"), v48);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "addObserver:selector:name:object:", self, sel__enclosingScrollViewDidScroll_, CFSTR("AKOverlayView.AKContentScrollViewVisibleRectChangeNotification"), 0);

      objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    }

  }
}

- (void)teardown
{
  void *v3;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__fullSetup, 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[AKInkPageOverlayController _partialTeardown](self, "_partialTeardown");
}

- (void)_partialTeardown
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__fullSetup, 0);
  -[AKInkPageOverlayController inkOverlayView](self, "inkOverlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    objc_msgSend(v3, "canvasView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRulerActive:", 0);

    -[AKInkPageOverlayController _tearDownGestureDependencies](self, "_tearDownGestureDependencies");
    -[AKInkPageOverlayController shapeDetectionController](self, "shapeDetectionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setModelControllerToObserveForAnnotationsAndSelections:", 0);

    -[AKInkPageOverlayController shapeDetectionController](self, "shapeDetectionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissCandidatePicker");

    objc_msgSend(v7, "teardown");
    objc_msgSend(v7, "removeFromSuperview");
    -[AKInkPageOverlayController setInkOverlayView:](self, "setInkOverlayView:", 0);
    v3 = v7;
  }

}

- (void)annotationEditingDidEndWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  -[AKInkPageOverlayController inkOverlayView](self, "inkOverlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canvasView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "setRulerActive:", 0);
    objc_msgSend(v5, "commitSelectionIfNecessaryWithCompletion:", v6);
  }
  else if (v6)
  {
    v6[2]();
  }

}

- (AKInkOverlayView)inkOverlayView
{
  return self->_inkOverlayView;
}

- (void)setInkOverlayView:(id)a3
{
  id WeakRetained;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_inkOverlayView, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_rulerHostingDelegate);
  if (v6 && WeakRetained)
    -[AKInkOverlayView setRulerHostingDelegate:](self->_inkOverlayView, "setRulerHostingDelegate:", WeakRetained);

}

- (void)setRulerHostingDelegate:(id)a3
{
  PKRulerHostingDelegate **p_rulerHostingDelegate;
  id v5;
  void *v6;
  id v7;

  p_rulerHostingDelegate = &self->_rulerHostingDelegate;
  v5 = a3;
  objc_storeWeak((id *)p_rulerHostingDelegate, v5);
  -[AKInkPageOverlayController inkOverlayView](self, "inkOverlayView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "canvasView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRulerHostingDelegate:", v5);

}

+ (id)newInkOverlayDrawingUndoTargetWithPageController:(id)a3
{
  return (id)MEMORY[0x24BEDD108](AKInkOverlayView, sel_newDrawingUndoTargetWithPageController_);
}

- (BOOL)inputViewCanBeginDrawing:(id)a3 withTouch:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[AKInkPageOverlayController pageController](self, "pageController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "type") == 2)
  {
    if ((objc_msgSend(v7, "pencilAlwaysDraws") & 1) == 0 && (objc_msgSend(v7, "annotationEditingEnabled") & 1) == 0)
      goto LABEL_4;
  }
  else if (!objc_msgSend(v7, "annotationEditingEnabled"))
  {
LABEL_4:
    v8 = 0;
    goto LABEL_28;
  }
  objc_msgSend(v7, "modelController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allSelectedAnnotations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
  {
    v8 = 1;
    goto LABEL_28;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v7, "modelController", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allSelectedAnnotations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "conformsToAKTextAnnotationProtocol")
          && objc_msgSend(v5, "type") == 2)
        {
          v8 = 0;
          goto LABEL_27;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v15)
        continue;
      break;
    }
  }

  objc_msgSend(v7, "textEditorController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEditing"))
  {
    objc_msgSend(v13, "textView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationInView:", v18);
    if ((objc_msgSend(v18, "pointInside:withEvent:", 0) & 1) == 0)
    {
      objc_msgSend(v13, "endEditing");
LABEL_24:
      objc_msgSend(v7, "modelController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "deselectAllAnnotations");

    }
  }
  else
  {
    if (objc_msgSend(v5, "type") == 2)
    {
      objc_msgSend(v7, "modelController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "deselectAllAnnotations");
      v8 = 1;
      goto LABEL_26;
    }
    objc_msgSend(v5, "locationInView:", 0);
    v20 = v19;
    v22 = v21;
    objc_msgSend(v7, "mainEventHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:", 1, 1, 0, v20, v22) & 1) == 0)goto LABEL_24;
  }
  v8 = 0;
LABEL_26:

LABEL_27:
LABEL_28:

  return v8;
}

- (void)inputViewDidBeginStroke:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__performDelayedShapeDetection, 0);
  -[AKInkPageOverlayController setDelayedShapeDetectionBlock:](self, "setDelayedShapeDetectionBlock:", 0);
  -[AKInkPageOverlayController pageController](self, "pageController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolbarViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v5, "isPresentingPopovers"))
    objc_msgSend(v5, "dismissPresentedPopovers");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("AKShapeDetectionController.shouldDismissCandidatePicker"), self);

  objc_msgSend(v9, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modelController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deselectAllAnnotations");

}

- (void)inputView:(id)a3 didCollectDrawingForAnalysis:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  AKInkAnnotation2 *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double Current;
  double v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  double v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id from;
  id location;

  v6 = a3;
  v30 = a4;
  -[AKInkPageOverlayController pageController](self, "pageController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "canvasView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "drawing");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modelController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deselectAllAnnotations");

  objc_msgSend(v7, "pageModelController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inkCanvasAnnotation");
  v13 = (AKInkAnnotation2 *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_rootStrokes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v13)
    v16 = 1;
  else
    v16 = v15 == 0;
  v17 = !v16;
  if (v13 && !v15)
  {
    objc_msgSend(v7, "pageModelController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "mutableArrayValueForKey:", CFSTR("annotations"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "removeObject:", v13);
    v13 = 0;
    goto LABEL_16;
  }
  if (v17)
  {
    v13 = objc_alloc_init(AKInkAnnotation2);
    objc_msgSend(v6, "canvasSizeInPKDrawingSpace");
    -[AKInkAnnotation setDrawingSize:](v13, "setDrawingSize:");
    objc_msgSend(v7, "modelBaseScaleFactor");
    -[AKAnnotation setOriginalModelBaseScaleFactor:](v13, "setOriginalModelBaseScaleFactor:");
    -[AKAnnotation setOriginalExifOrientation:](v13, "setOriginalExifOrientation:", 1);
  }
  else if (!v15)
  {
    goto LABEL_14;
  }
  objc_msgSend(v10, "bounds");
  -[AKInkPageOverlayController _convertRect:fromDrawingInCanvasView:toPageControllerModelSpace:](self, "_convertRect:fromDrawingInCanvasView:toPageControllerModelSpace:", v9, v7);
  -[AKInkAnnotation setRectangle:](v13, "setRectangle:");
LABEL_14:
  if (v13)
  {
    v20 = (void *)objc_msgSend(v10, "copy");
    -[AKInkAnnotation setDrawing:](v13, "setDrawing:", v20);

    -[AKAnnotation setShouldUseAppearanceOverride:](v13, "setShouldUseAppearanceOverride:", 0);
  }
LABEL_16:
  if (v17)
  {
    objc_msgSend(v7, "pageModelController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setInkCanvasAnnotationOneTime:", v13);

  }
  Current = CFAbsoluteTimeGetCurrent();
  -[AKInkPageOverlayController lastStrokeEndTime](self, "lastStrokeEndTime");
  v24 = v23;
  -[AKInkPageOverlayController setLastStrokeEndTime:](self, "setLastStrokeEndTime:", Current);
  -[AKInkPageOverlayController shapeDetectionController](self, "shapeDetectionController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v25, "shapeDetectionEnabled") & 1) != 0)
  {
    objc_msgSend(v30, "strokes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");

    if (v27 == 1)
    {
      v28 = Current - v24;
      if (Current - v24 > 0.5)
      {
        objc_initWeak(&location, self);
        objc_initWeak(&from, v7);
        objc_initWeak(&v38, v9);
        objc_initWeak(&v37, v6);
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = sub_229009ADC;
        v31[3] = &unk_24F1A7AE0;
        objc_copyWeak(&v33, &location);
        objc_copyWeak(&v34, &from);
        objc_copyWeak(&v35, &v38);
        objc_copyWeak(&v36, &v37);
        v32 = v30;
        -[AKInkPageOverlayController setDelayedShapeDetectionBlock:](self, "setDelayedShapeDetectionBlock:", v31);
        -[AKInkPageOverlayController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__performDelayedShapeDetection, 0, 0.2);

        objc_destroyWeak(&v36);
        objc_destroyWeak(&v35);
        objc_destroyWeak(&v34);
        objc_destroyWeak(&v33);
        objc_destroyWeak(&v37);
        objc_destroyWeak(&v38);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }
    }
  }
  else
  {

  }
  objc_msgSend(v8, "delegate", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v29, "penStrokeCompletedForAnnotationController:", v8);

}

- (void)_performDelayedShapeDetection
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__performDelayedShapeDetection, 0);
  -[AKInkPageOverlayController delayedShapeDetectionBlock](self, "delayedShapeDetectionBlock");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AKInkPageOverlayController setDelayedShapeDetectionBlock:](self, "setDelayedShapeDetectionBlock:", 0);
  v3 = v4;
  if (v4)
  {
    (*((void (**)(id))v4 + 2))(v4);
    v3 = v4;
  }

}

- (void)shapeDetectionControllerWillPickCandidate:(id)a3 isInk:(BOOL)a4
{
  void *v5;
  void *v6;

  if (!a4)
  {
    -[AKInkPageOverlayController setIgnoreAnnotationAndSelectionKVO:](self, "setIgnoreAnnotationAndSelectionKVO:", 1);
    -[AKInkPageOverlayController pageController](self, "pageController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "controller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "undo:", self);

    -[AKInkPageOverlayController setIgnoreAnnotationAndSelectionKVO:](self, "setIgnoreAnnotationAndSelectionKVO:", 0);
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

- (void)beginIgnoringAnnotationSelectionObservation:(id)a3
{
  -[AKInkPageOverlayController setIgnoreAnnotationAndSelectionKVO:](self, "setIgnoreAnnotationAndSelectionKVO:", 1);
}

- (void)endIgnoringAnnotationSelectionObservation:(id)a3
{
  -[AKInkPageOverlayController setIgnoreAnnotationAndSelectionKVO:](self, "setIgnoreAnnotationAndSelectionKVO:", 0);
}

- (BOOL)isIgnoringAnnotationAndSelectionKVO:(id)a3
{
  return MEMORY[0x24BEDD108](self, sel_ignoreAnnotationAndSelectionKVO);
}

- (BOOL)isWaitingToCoalesceStrokes
{
  return 0;
}

- (BOOL)shapeDetectionController:(id)a3 shouldSelectCandidateAnnotation:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  char v8;

  v5 = a4;
  -[AKInkPageOverlayController pageController](self, "pageController");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "selectNewlyCreatedAnnotations");

  objc_opt_class();
  LOBYTE(v6) = objc_opt_isKindOfClass();

  return v8 & (v6 ^ 1);
}

- (void)_inkDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[AKInkPageOverlayController pageController](self, "pageController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "controller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributeController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v8)
    {
      objc_msgSend(v6, "attributeController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ink");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[AKInkPageOverlayController inkOverlayView](self, "inkOverlayView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setInk:", v10);

    }
  }

}

- (void)didToggleRuler
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[AKInkPageOverlayController inkOverlayView](self, "inkOverlayView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "canvasView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRulerActive") ^ 1;
  -[AKInkPageOverlayController inkOverlayView](self, "inkOverlayView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "canvasView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRulerActive:", v4);

}

- (void)_enclosingScrollViewDidScroll:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("AKShapeDetectionController.shouldDismissCandidatePicker"), self);

  -[AKInkPageOverlayController inkOverlayView](self, "inkOverlayView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "canvasView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (void)_inkCanvasAnnotationUpdated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  -[AKInkPageOverlayController inkOverlayView](self, "inkOverlayView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[AKInkPageOverlayController pageController](self, "pageController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pageModelController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inkCanvasAnnotation");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v7 = v11;
    if (v11)
    {
      objc_msgSend(v11, "drawing");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "strokes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      v7 = v11;
      if (v10)
      {
        -[AKInkPageOverlayController _fullSetup](self, "_fullSetup");
        v7 = v11;
      }
    }

  }
}

- (void)_toolStatusUpdated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  -[AKInkPageOverlayController pageController](self, "pageController", a3);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "allInkEnabled") & 1) != 0 || objc_msgSend(v6, "pencilInkEnabled"))
    {
      -[AKInkPageOverlayController inkOverlayView](self, "inkOverlayView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        -[AKInkPageOverlayController _fullSetup](self, "_fullSetup");
    }
    else
    {
      objc_msgSend(v15, "pageModelController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "inkCanvasAnnotation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[AKInkPageOverlayController inkOverlayView](self, "inkOverlayView");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        objc_msgSend(v9, "drawing");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "strokes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (!v14)
          -[AKInkPageOverlayController _partialTeardown](self, "_partialTeardown");
      }

    }
    -[AKInkPageOverlayController _updateAllowedTouchTypesAllEnabled:pencilEnabled:](self, "_updateAllowedTouchTypesAllEnabled:pencilEnabled:", objc_msgSend(v6, "allInkEnabled"), objc_msgSend(v6, "pencilInkEnabled"));
    -[AKInkPageOverlayController _updateGestureDependencyPriority](self, "_updateGestureDependencyPriority");
  }

}

- (void)_controllerWillSave:(id)a3
{
  void *v3;
  id v4;

  -[AKInkPageOverlayController inkOverlayView](self, "inkOverlayView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canvasView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commitSelectionIfNecessaryWithCompletion:", 0);

}

- (void)_updateAllowedTouchTypesAllEnabled:(BOOL)a3 pencilEnabled:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a4;
  v5 = a3;
  -[AKInkPageOverlayController pageController](self, "pageController");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "overlayView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKInkPageOverlayController inkOverlayView](self, "inkOverlayView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "drawingGestureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "akEnclosingScrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "akEnclosingScrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "panGestureRecognizer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "panGestureRecognizer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 || v4)
    v15 = &unk_24F1CF108;
  else
    v15 = &unk_24F1CF120;
  objc_msgSend(v13, "setAllowedTouchTypes:", v15);
  objc_msgSend(v14, "setAllowedTouchTypes:", v15);
  objc_msgSend(v9, "allowedTouchTypes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  AKLog(CFSTR("%s %@ types: %@ on recognizer: %p scrollview recognizer: %p"));

}

- (void)_setupGestureDependencies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[AKInkPageOverlayController pageController](self, "pageController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKInkPageOverlayController inkOverlayView](self, "inkOverlayView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "drawingGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeGestureRecognizer:", v6);

  }
  -[AKInkPageOverlayController inkOverlayView](self, "inkOverlayView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pinchGestureRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v10, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeGestureRecognizer:", v10);

  }
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (v3 && v13 && v6)
        objc_msgSend(v4, "installDrawingGestureRecognizer:forPageAtIndex:forAnnotationController:", v6, objc_msgSend(v13, "pageIndex"), v3);
    }
    else
    {
      NSLog(CFSTR("This client is missing the new required delegate method installDrawingGestureRecognizer!"));
    }
    -[AKInkPageOverlayController _updateGestureDependencyPriority](self, "_updateGestureDependencyPriority");
  }

}

- (void)_updateGestureDependencyPriority
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _BYTE v39[128];
  _QWORD v40[3];

  v40[1] = *MEMORY[0x24BDAC8D0];
  -[AKInkPageOverlayController pageController](self, "pageController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainEventHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKInkPageOverlayController inkOverlayView](self, "inkOverlayView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "canvasView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_selectionInteraction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", v5);

  objc_msgSend(v4, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKInkPageOverlayController inkOverlayView](self, "inkOverlayView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "drawingGestureRecognizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v3 && v11)
  {
    objc_msgSend(v4, "modelController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allSelectedAnnotations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count") == 0;

    objc_msgSend(v4, "toolController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "allInkEnabled") & 1) == 0 && !objc_msgSend(v15, "pencilInkEnabled"))
      v14 = 0;
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "updateDrawingGestureRecognizer:forPageAtIndex:withPriority:forAnnotationController:", v11, objc_msgSend(v3, "pageIndex"), v14, v4);
      if ((_DWORD)v14)
      {
        -[AKInkPageOverlayController inkOverlayView](self, "inkOverlayView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "canvasView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_tiledView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "allowsFingerDrawing");

        if ((v19 & 1) == 0)
        {
          v32 = v14;
          objc_msgSend(v4, "tapGestureRecognizer");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v40[0] = v20;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          v22 = v21;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v34;
            do
            {
              for (i = 0; i != v24; ++i)
              {
                if (*(_QWORD *)v34 != v25)
                  objc_enumerationMutation(v22);
                v27 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
                objc_msgSend(v11, "removeFailureRequirement:", v27);
                objc_msgSend(v27, "requireGestureRecognizerToFail:", v11);
              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
            }
            while (v24);
          }

          v14 = v32;
        }
      }
    }
    else
    {
      NSLog(CFSTR("This client is missing the new required delegate method updateDrawingGestureRecognizer!"));
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = AKControllerDrawingGestureRecognizerNeedsDependencyUpdate;
    v37[0] = CFSTR("drawingGestureRecognizer");
    v37[1] = CFSTR("highPriority");
    v38[0] = v11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v14);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "postNotificationName:object:userInfo:", v29, v4, v31);

  }
}

- (void)_tearDownGestureDependencies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[AKInkPageOverlayController pageController](self, "pageController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[AKInkPageOverlayController inkOverlayView](self, "inkOverlayView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "drawingGestureRecognizer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3 && v7 && v6)
        objc_msgSend(v4, "uninstallDrawingGestureRecognizer:forPageAtIndex:forAnnotationController:", v6, objc_msgSend(v7, "pageIndex"), v3);

    }
    else
    {
      NSLog(CFSTR("This client is missing the new required delegate method uninstallDrawingGestureRecognizer!"));
    }
  }

}

- (CGSize)scaleFromDrawingInCanvasView:(id)a3 toPageControllerModelSpace:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[AKInkPageOverlayController _convertRect:fromDrawingInCanvasView:toPageControllerModelSpace:](self, "_convertRect:fromDrawingInCanvasView:toPageControllerModelSpace:", a3, a4, 0.0, 0.0, 1.0, 1.0);
  v5 = v4;
  v7 = v6;
  result.height = v7;
  result.width = v5;
  return result;
}

- (CGRect)_convertRect:(CGRect)a3 fromDrawingInCanvasView:(id)a4 toPageControllerModelSpace:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
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
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGAffineTransform v37[2];
  CGRect v38;
  CGRect v39;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v11 = a5;
  memset(&v37[1], 0, sizeof(CGAffineTransform));
  if (v10)
    objc_msgSend(v10, "drawingTransform");
  v37[0] = v37[1];
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  v39 = CGRectApplyAffineTransform(v38, v37);
  v12 = v39.origin.x;
  v13 = v39.origin.y;
  v14 = v39.size.width;
  v15 = v39.size.height;
  objc_msgSend(v11, "overlayView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertRect:toView:", v16, v12, v13, v14, v15);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  objc_msgSend(v11, "convertRectFromOverlayToModel:", v18, v20, v22, v24);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

  v33 = v26;
  v34 = v28;
  v35 = v30;
  v36 = v32;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (id)_convertCHDrawing:(id)a3 fromDrawingInCanvasView:(id)a4 toInkOverlayView:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  double a;
  double b;
  double c;
  double d;
  double tx;
  double ty;
  unint64_t v20;
  unint64_t v21;
  double v22;
  double v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v30;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x24BE1BDC8]);
  v11 = *MEMORY[0x24BDBD8B8];
  v12 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v13 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  if (v8)
  {
    v26 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v27 = *MEMORY[0x24BDBD8B8];
    v25 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    objc_msgSend(v8, "drawingTransform");
    v13 = v25;
    v12 = v26;
    v11 = v27;
  }
  else
  {
    memset(&t2, 0, sizeof(t2));
  }
  *(_OWORD *)&t1.a = v11;
  *(_OWORD *)&t1.c = v12;
  *(_OWORD *)&t1.tx = v13;
  CGAffineTransformConcat(&v30, &t1, &t2);
  a = v30.a;
  b = v30.b;
  c = v30.c;
  d = v30.d;
  tx = v30.tx;
  ty = v30.ty;
  if (objc_msgSend(v7, "strokeCount"))
  {
    v20 = 0;
    do
    {
      if (objc_msgSend(v7, "pointCountForStrokeIndex:", v20))
      {
        v21 = 0;
        do
        {
          objc_msgSend(v7, "pointForStrokeIndex:pointIndex:", v20, v21);
          objc_msgSend(v8, "convertPoint:toView:", v9, tx + c * v22 + a * v23, ty + d * v22 + b * v23);
          objc_msgSend(v10, "addPoint:");
          ++v21;
        }
        while (v21 < objc_msgSend(v7, "pointCountForStrokeIndex:", v20));
      }
      objc_msgSend(v10, "endStroke");
      ++v20;
    }
    while (v20 < objc_msgSend(v7, "strokeCount"));
  }

  return v10;
}

- (AKPageController)pageController
{
  return (AKPageController *)objc_loadWeakRetained((id *)&self->_pageController);
}

- (void)setPageController:(id)a3
{
  objc_storeWeak((id *)&self->_pageController, a3);
}

- (AKShapeDetectionController)shapeDetectionController
{
  return (AKShapeDetectionController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setShapeDetectionController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PKRulerHostingDelegate)rulerHostingDelegate
{
  return (PKRulerHostingDelegate *)objc_loadWeakRetained((id *)&self->_rulerHostingDelegate);
}

- (BOOL)ignoreAnnotationAndSelectionKVO
{
  return self->_ignoreAnnotationAndSelectionKVO;
}

- (void)setIgnoreAnnotationAndSelectionKVO:(BOOL)a3
{
  self->_ignoreAnnotationAndSelectionKVO = a3;
}

- (BOOL)onlyPencilDraws
{
  return self->_onlyPencilDraws;
}

- (void)setOnlyPencilDraws:(BOOL)a3
{
  self->_onlyPencilDraws = a3;
}

- (id)delayedShapeDetectionBlock
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setDelayedShapeDetectionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (double)lastStrokeEndTime
{
  return self->_lastStrokeEndTime;
}

- (void)setLastStrokeEndTime:(double)a3
{
  self->_lastStrokeEndTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_delayedShapeDetectionBlock, 0);
  objc_destroyWeak((id *)&self->_rulerHostingDelegate);
  objc_storeStrong((id *)&self->_shapeDetectionController, 0);
  objc_destroyWeak((id *)&self->_pageController);
  objc_storeStrong((id *)&self->_inkOverlayView, 0);
}

@end
