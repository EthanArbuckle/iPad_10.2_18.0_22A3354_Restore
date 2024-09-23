@implementation AKMainEventHandler_iOS

- (AKMainEventHandler_iOS)initWithController:(id)a3
{
  id v4;
  AKMainEventHandler_iOS *v5;
  AKTapGestureRecognizer *v6;
  UITapGestureRecognizer *tapRecognizer;
  AKTapGestureRecognizer *v8;
  UITapGestureRecognizer *doubleTapRecognizer;
  AKLongPressGestureRecognizer *v10;
  UILongPressGestureRecognizer *pressRecognizer;
  AKPanGestureRecognizer *v12;
  AKPanGestureRecognizer *panRecognizer;
  AKRotationGestureRecognizer *v14;
  AKRotationGestureRecognizer *rotationRecognizer;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AKMainEventHandler_iOS;
  v5 = -[AKMainEventHandler initWithController:](&v17, sel_initWithController_, v4);
  if (v5)
  {
    v6 = -[AKTapGestureRecognizer initWithTarget:action:]([AKTapGestureRecognizer alloc], "initWithTarget:action:", v5, sel_forwardRecognizerToMainHandleEvent_);
    tapRecognizer = v5->_tapRecognizer;
    v5->_tapRecognizer = &v6->super;

    -[UITapGestureRecognizer setDelegate:](v5->_tapRecognizer, "setDelegate:", v5);
    v8 = -[AKTapGestureRecognizer initWithTarget:action:]([AKTapGestureRecognizer alloc], "initWithTarget:action:", v5, sel_forwardRecognizerToMainHandleEvent_);
    doubleTapRecognizer = v5->_doubleTapRecognizer;
    v5->_doubleTapRecognizer = &v8->super;

    -[UITapGestureRecognizer setDelegate:](v5->_doubleTapRecognizer, "setDelegate:", v5);
    -[UITapGestureRecognizer setNumberOfTapsRequired:](v5->_doubleTapRecognizer, "setNumberOfTapsRequired:", 2);
    v10 = -[AKLongPressGestureRecognizer initWithTarget:action:]([AKLongPressGestureRecognizer alloc], "initWithTarget:action:", v5, sel_forwardRecognizerToMainHandleEvent_);
    pressRecognizer = v5->_pressRecognizer;
    v5->_pressRecognizer = &v10->super;

    -[UILongPressGestureRecognizer setDelegate:](v5->_pressRecognizer, "setDelegate:", v5);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v5->_pressRecognizer, "setMinimumPressDuration:", 0.2);
    v12 = -[AKPanGestureRecognizer initWithTarget:action:]([AKPanGestureRecognizer alloc], "initWithTarget:action:", v5, sel_forwardRecognizerToMainHandleEvent_);
    panRecognizer = v5->_panRecognizer;
    v5->_panRecognizer = v12;

    -[AKPanGestureRecognizer setDelegate:](v5->_panRecognizer, "setDelegate:", v5);
    -[AKPanGestureRecognizer setMaximumNumberOfTouches:](v5->_panRecognizer, "setMaximumNumberOfTouches:", 1);
    -[AKPanGestureRecognizer setEnabled:](v5->_panRecognizer, "setEnabled:", 1);
    -[AKPanGestureRecognizer _setHysteresis:](v5->_panRecognizer, "_setHysteresis:", 5.0);
    v14 = -[AKRotationGestureRecognizer initWithTarget:action:]([AKRotationGestureRecognizer alloc], "initWithTarget:action:", v5, sel_forwardRecognizerToMainHandleEvent_);
    rotationRecognizer = v5->_rotationRecognizer;
    v5->_rotationRecognizer = v14;

    -[AKRotationGestureRecognizer setAnnotationController:](v5->_rotationRecognizer, "setAnnotationController:", v4);
    -[AKRotationGestureRecognizer setDelegate:](v5->_rotationRecognizer, "setDelegate:", v5);
    -[UITapGestureRecognizer requireGestureRecognizerToFail:](v5->_tapRecognizer, "requireGestureRecognizerToFail:", v5->_doubleTapRecognizer);
    -[UITapGestureRecognizer requireGestureRecognizerToFail:](v5->_tapRecognizer, "requireGestureRecognizerToFail:", v5->_panRecognizer);
    -[UITapGestureRecognizer requireGestureRecognizerToFail:](v5->_tapRecognizer, "requireGestureRecognizerToFail:", v5->_rotationRecognizer);
    -[UITapGestureRecognizer requireGestureRecognizerToFail:](v5->_doubleTapRecognizer, "requireGestureRecognizerToFail:", v5->_panRecognizer);
    -[UITapGestureRecognizer requireGestureRecognizerToFail:](v5->_doubleTapRecognizer, "requireGestureRecognizerToFail:", v5->_rotationRecognizer);
    -[UILongPressGestureRecognizer requireGestureRecognizerToFail:](v5->_pressRecognizer, "requireGestureRecognizerToFail:", v5->_panRecognizer);
    -[UILongPressGestureRecognizer requireGestureRecognizerToFail:](v5->_pressRecognizer, "requireGestureRecognizerToFail:", v5->_rotationRecognizer);
    -[UITapGestureRecognizer setAllowedTouchTypes:](v5->_doubleTapRecognizer, "setAllowedTouchTypes:", &unk_24F1CF7F8);
    -[UILongPressGestureRecognizer setAllowedTouchTypes:](v5->_pressRecognizer, "setAllowedTouchTypes:", &unk_24F1CF7F8);
    -[AKPanGestureRecognizer setAllowedTouchTypes:](v5->_panRecognizer, "setAllowedTouchTypes:", &unk_24F1CF810);
  }

  return v5;
}

- (void)teardown
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  -[AKMainEventHandler_iOS tapRecognizer](self, "tapRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKMainEventHandler_iOS tapRecognizer](self, "tapRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeGestureRecognizer:", v5);

  -[AKMainEventHandler_iOS tapRecognizer](self, "tapRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  -[AKMainEventHandler_iOS setTapRecognizer:](self, "setTapRecognizer:", 0);
  -[AKMainEventHandler_iOS doubleTapRecognizer](self, "doubleTapRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKMainEventHandler_iOS doubleTapRecognizer](self, "doubleTapRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeGestureRecognizer:", v9);

  -[AKMainEventHandler_iOS doubleTapRecognizer](self, "doubleTapRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", 0);

  -[AKMainEventHandler_iOS setDoubleTapRecognizer:](self, "setDoubleTapRecognizer:", 0);
  -[AKMainEventHandler_iOS pressRecognizer](self, "pressRecognizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKMainEventHandler_iOS pressRecognizer](self, "pressRecognizer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeGestureRecognizer:", v13);

  -[AKMainEventHandler_iOS pressRecognizer](self, "pressRecognizer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", 0);

  -[AKMainEventHandler_iOS setPressRecognizer:](self, "setPressRecognizer:", 0);
  -[AKMainEventHandler_iOS rotationRecognizer](self, "rotationRecognizer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKMainEventHandler_iOS rotationRecognizer](self, "rotationRecognizer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeGestureRecognizer:", v17);

  -[AKMainEventHandler_iOS rotationRecognizer](self, "rotationRecognizer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDelegate:", 0);

  -[AKMainEventHandler_iOS setRotationRecognizer:](self, "setRotationRecognizer:", 0);
  -[AKMainEventHandler_iOS panRecognizer](self, "panRecognizer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKMainEventHandler_iOS panRecognizer](self, "panRecognizer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeGestureRecognizer:", v21);

  -[AKMainEventHandler_iOS panRecognizer](self, "panRecognizer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDelegate:", 0);

  -[AKMainEventHandler_iOS setPanRecognizer:](self, "setPanRecognizer:", 0);
  v23.receiver = self;
  v23.super_class = (Class)AKMainEventHandler_iOS;
  -[AKMainEventHandler teardown](&v23, sel_teardown);
}

- (void)forwardRecognizerToMainHandleEvent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  -[AKMainEventHandler_iOS panRecognizer](self, "panRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v10)
  {
LABEL_2:

    v5 = v10;
    goto LABEL_8;
  }
  -[AKMainEventHandler_iOS panRecognizer](self, "panRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "penGestureDetected");

  v5 = v10;
  if (v7)
  {
    v8 = objc_msgSend(v10, "state");
    v5 = v10;
    if (v8 == 3)
    {
      -[AKMainEventHandler controller](self, "controller");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v9, "penStrokeCompletedForAnnotationController:", v4);

      goto LABEL_2;
    }
  }
LABEL_8:
  -[AKMainEventHandler mainHandleEvent:orRecognizer:](self, "mainHandleEvent:orRecognizer:", 0, v5);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  BOOL v15;
  BOOL v16;

  v6 = a3;
  v7 = a4;
  -[AKMainEventHandler controller](self, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", 0);
  v10 = v9;
  v12 = v11;

  -[AKMainEventHandler_iOS tapRecognizer](self, "tapRecognizer");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v6)
  {
    v16 = -[AKMainEventHandler_iOS _tapRecognizerCanBeginAtPoint:](self, "_tapRecognizerCanBeginAtPoint:", v10, v12);
LABEL_8:
    v15 = v16;
    goto LABEL_9;
  }
  -[AKMainEventHandler_iOS doubleTapRecognizer](self, "doubleTapRecognizer");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14 == v6)
  {
    v16 = -[AKMainEventHandler_iOS _doubleTapRecognizerCanBeginAtPoint:](self, "_doubleTapRecognizerCanBeginAtPoint:", v10, v12);
    goto LABEL_8;
  }
  v15 = (objc_msgSend(v8, "annotationEditingEnabled") & 1) != 0 || objc_msgSend(v8, "formFillingEnabled");
LABEL_9:

  return v15;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  char v18;
  BOOL v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  _BOOL4 v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  v4 = a3;
  -[AKMainEventHandler controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toolController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "toolMode");

  if ((objc_msgSend(v5, "annotationEditingEnabled") & 1) != 0)
    LODWORD(v8) = 1;
  else
    LODWORD(v8) = objc_msgSend(v5, "formFillingEnabled");
  -[AKMainEventHandler_iOS panRecognizer](self, "panRecognizer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 != v4)
  {
    -[AKMainEventHandler_iOS tapRecognizer](self, "tapRecognizer");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 == v4)
    {
      objc_msgSend(v4, "akLocationInWindow");
      v19 = -[AKMainEventHandler_iOS _tapRecognizerCanBeginAtPoint:](self, "_tapRecognizerCanBeginAtPoint:");
      goto LABEL_33;
    }
    -[AKMainEventHandler_iOS rotationRecognizer](self, "rotationRecognizer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 != v4)
    {

LABEL_8:
      -[AKMainEventHandler_iOS doubleTapRecognizer](self, "doubleTapRecognizer");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v12 != v4)
      {

        goto LABEL_10;
      }
      if ((objc_msgSend(v5, "annotationEditingEnabled") & 1) != 0)
      {

      }
      else
      {
        v23 = objc_msgSend(v5, "formFillingEnabled");

        if ((v23 & 1) == 0)
        {
LABEL_10:
          -[AKMainEventHandler_iOS pressRecognizer](self, "pressRecognizer");
          v13 = (id)objc_claimAutoreleasedReturnValue();
          if (v13 != v4)
          {

            goto LABEL_41;
          }
          if ((objc_msgSend(v5, "annotationEditingEnabled") & 1) != 0)
          {

          }
          else
          {
            v24 = objc_msgSend(v5, "formFillingEnabled");

            if ((v24 & 1) == 0)
              goto LABEL_41;
          }
          -[AKMainEventHandler_iOS panRecognizer](self, "panRecognizer");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "penGestureDetected");

          if ((v26 & 1) != 0)
          {
LABEL_40:
            LOBYTE(v8) = 0;
            goto LABEL_41;
          }
          objc_msgSend(v5, "toolController");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v27, "toolMode") == 4)
          {
            objc_msgSend(v5, "attributeController");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "ink");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "identifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "isEqual:", *MEMORY[0x24BDE3420]);

            if ((v31 & 1) != 0)
              goto LABEL_40;
          }
          else
          {

          }
          objc_msgSend(v4, "akLocationInWindow");
          v39 = 0;
          v33 = -[AKMainEventHandler hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:](self, "hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:", 0, 0, &v39);
          v34 = v39;
          LOBYTE(v8) = 0;
          if (!v33)
          {
LABEL_52:

            goto LABEL_41;
          }
          objc_msgSend(v5, "textEditorController");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "annotation");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "modelController");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "allSelectedAnnotations");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
          {
            if (objc_msgSend(v38, "count") && (objc_msgSend(v38, "containsObject:", v34) & 1) != 0)
            {
              LOBYTE(v8) = 0;
LABEL_51:

              goto LABEL_52;
            }
            if (v36)
            {
              LODWORD(v8) = objc_msgSend(v36, "isEqual:", v34) ^ 1;
              goto LABEL_51;
            }
          }
          LOBYTE(v8) = 1;
          goto LABEL_51;
        }
      }
      objc_msgSend(v4, "akLocationInWindow");
      v19 = -[AKMainEventHandler_iOS _doubleTapRecognizerCanBeginAtPoint:](self, "_doubleTapRecognizerCanBeginAtPoint:");
LABEL_33:
      LOBYTE(v8) = v19;
      goto LABEL_41;
    }
    if ((objc_msgSend(v5, "annotationEditingEnabled") & 1) != 0)
    {

    }
    else
    {
      v20 = objc_msgSend(v5, "formFillingEnabled");

      if ((v20 & 1) == 0)
        goto LABEL_8;
    }
    objc_msgSend(v5, "currentPageController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pageModelController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectedAnnotations");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v8) = objc_msgSend(v22, "count") != 0;
    goto LABEL_41;
  }
  objc_msgSend(v4, "locationOfFirstTouchInView:", 0);
  v15 = v14;
  v17 = v16;
  v18 = objc_msgSend(v5, "annotationEditingEnabled");
  if (v7 == 4)
  {
    if ((v18 & 1) != 0 || objc_msgSend(v5, "formFillingEnabled"))
    {
      if (!-[AKMainEventHandler hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:](self, "hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:", 1, 1, 0, v15, v17))goto LABEL_40;
    }
    else if (!(_DWORD)v8)
    {
      goto LABEL_41;
    }
LABEL_35:
    -[AKMainEventHandler setPanGestureStartPointInWindow:](self, "setPanGestureStartPointInWindow:", v15, v17);
    LOBYTE(v8) = 1;
    goto LABEL_41;
  }
  if ((v18 & 1) == 0 && !objc_msgSend(v5, "formFillingEnabled"))
    goto LABEL_40;
  if ((unint64_t)(v7 - 1) < 2)
    goto LABEL_35;
  LOBYTE(v8) = 0;
  if (-[AKMainEventHandler hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:](self, "hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:", 1, 0, 0, v15, v17))
  {
    goto LABEL_35;
  }
LABEL_41:

  return (char)v8;
}

- (BOOL)_tapRecognizerCanBeginAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  char isKindOfClass;
  _BOOL4 v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  y = a3.y;
  x = a3.x;
  -[AKMainEventHandler controller](self, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "annotationEditingEnabled") & 1) != 0 || objc_msgSend(v6, "formFillingEnabled"))
  {
    isKindOfClass = -[AKMainEventHandler_iOS _shouldAllowTapAtLocationInWindow:](self, "_shouldAllowTapAtLocationInWindow:", x, y);
  }
  else if ((objc_msgSend(v6, "allEditingDisabled") & 1) != 0)
  {
    isKindOfClass = 0;
  }
  else
  {
    v13 = 0;
    v9 = -[AKMainEventHandler hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:](self, "hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:", 0, 0, &v13, x, y);
    v10 = v13;
    isKindOfClass = 0;
    if (v9)
    {
      objc_opt_self();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        isKindOfClass = 1;
      }
      else
      {
        objc_opt_self();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        isKindOfClass = objc_opt_isKindOfClass();

      }
    }

  }
  return isKindOfClass & 1;
}

- (BOOL)_doubleTapRecognizerCanBeginAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  _BOOL4 v7;
  id v8;
  char v9;
  id v11;

  y = a3.y;
  x = a3.x;
  -[AKMainEventHandler controller](self, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "annotationEditingEnabled") & 1) != 0 || objc_msgSend(v6, "formFillingEnabled"))
  {
    v11 = 0;
    v7 = -[AKMainEventHandler hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:](self, "hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:", 0, 0, &v11, x, y);
    v8 = v11;
    v9 = 0;
    if (v7)
      v9 = objc_msgSend(v6, "canBeginEditingTextAnnotation:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_shouldAllowTapAtLocationInWindow:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v12;

  y = a3.y;
  x = a3.x;
  -[AKMainEventHandler controller](self, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentPageController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pageModelController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectedAnnotations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    v10 = 1;
  }
  else
  {
    v12 = 0;
    v10 = -[AKMainEventHandler hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:](self, "hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:", 0, 0, &v12, x, y);
  }

  return v10;
}

- (BOOL)selectionInteractionShouldBegin:(id)a3 atPoint:(CGPoint)a4 forEvent:(id)a5 orGestureRecognizer:(id)a6
{
  double y;
  double x;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL4 v17;
  int v18;

  y = a4.y;
  x = a4.x;
  v10 = a3;
  v11 = a6;
  objc_msgSend(v10, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertPoint:toView:", 0, x, y);
  v14 = v13;
  v16 = v15;

  v17 = -[AKMainEventHandler_iOS _shouldAllowTapAtLocationInWindow:](self, "_shouldAllowTapAtLocationInWindow:", v14, v16);
  objc_opt_class();
  LOBYTE(self) = objc_opt_isKindOfClass();

  if ((self & 1) != 0)
    v18 = objc_msgSend(v10, "hasCurrentSelection") | !v17;
  else
    LOBYTE(v18) = 1;

  return v18;
}

- (void)applyToAllSelectedAnnotationsRotateEvent:(id)a3 orRecognizer:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (objc_msgSend(v5, "state") == 3)
    -[AKMainEventHandler_iOS setLastRotationAngleInRotationGesture:](self, "setLastRotationAngleInRotationGesture:", 0.0);
  if (objc_msgSend(v5, "state") == 2)
  {
    -[AKMainEventHandler controller](self, "controller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentPageController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pageModelController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectedAnnotations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && objc_msgSend(v9, "count"))
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v23 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            if (objc_msgSend(v15, "conformsToAKRotatableAnnotationProtocol", (_QWORD)v22))
            {
              objc_msgSend(v5, "rotation");
              v17 = 6.28318531 - v16;
              -[AKMainEventHandler_iOS lastRotationAngleInRotationGesture](self, "lastRotationAngleInRotationGesture");
              v19 = v17 - v18;
              objc_msgSend(v15, "rotationAngle");
              objc_msgSend(v15, "setRotationAngle:", v20 + v19);
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v12);
      }

    }
    objc_msgSend(v5, "rotation", (_QWORD)v22);
    -[AKMainEventHandler_iOS setLastRotationAngleInRotationGesture:](self, "setLastRotationAngleInRotationGesture:", 6.28318531 - v21);

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  AKPanGestureRecognizer *panRecognizer;
  UILongPressGestureRecognizer *pressRecognizer;
  BOOL v12;

  v6 = a3;
  v7 = a4;
  panRecognizer = self->_panRecognizer;
  pressRecognizer = self->_pressRecognizer;
  v12 = panRecognizer == v6 && pressRecognizer == v7 || panRecognizer == v7 && pressRecognizer == v6;

  return v12;
}

- (UITapGestureRecognizer)tapRecognizer
{
  return (UITapGestureRecognizer *)objc_getProperty(self, a2, 232, 1);
}

- (void)setTapRecognizer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (UITapGestureRecognizer)doubleTapRecognizer
{
  return (UITapGestureRecognizer *)objc_getProperty(self, a2, 240, 1);
}

- (void)setDoubleTapRecognizer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (UILongPressGestureRecognizer)pressRecognizer
{
  return (UILongPressGestureRecognizer *)objc_getProperty(self, a2, 248, 1);
}

- (void)setPressRecognizer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (AKPanGestureRecognizer)panRecognizer
{
  return (AKPanGestureRecognizer *)objc_getProperty(self, a2, 256, 1);
}

- (void)setPanRecognizer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (AKRotationGestureRecognizer)rotationRecognizer
{
  return (AKRotationGestureRecognizer *)objc_getProperty(self, a2, 264, 1);
}

- (void)setRotationRecognizer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (double)lastRotationAngleInRotationGesture
{
  return self->_lastRotationAngleInRotationGesture;
}

- (void)setLastRotationAngleInRotationGesture:(double)a3
{
  self->_lastRotationAngleInRotationGesture = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotationRecognizer, 0);
  objc_storeStrong((id *)&self->_panRecognizer, 0);
  objc_storeStrong((id *)&self->_pressRecognizer, 0);
  objc_storeStrong((id *)&self->_doubleTapRecognizer, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
}

@end
