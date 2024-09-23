@implementation AKMainEventHandler

+ (id)newMainEventHandlerForCurrentPlatformWithController:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithController:", v3);

  return v4;
}

- (AKMainEventHandler)initWithController:(id)a3
{
  id v4;
  AKMainEventHandler *v5;
  AKMainEventHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKMainEventHandler;
  v5 = -[AKMainEventHandler init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[AKMainEventHandler setController:](v5, "setController:", v4);

  return v6;
}

- (BOOL)mainHandleEvent:(id)a3 orRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  BOOL v28;
  BOOL v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  BOOL v35;

  v6 = a3;
  v7 = a4;
  -[AKMainEventHandler controller](self, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentPageController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "overlayView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_22;
  objc_msgSend(v10, "window");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

    goto LABEL_13;
  }
  v13 = (void *)v12;
  objc_msgSend(v10, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
LABEL_13:
    LOBYTE(v11) = 0;
    goto LABEL_22;
  }
  -[AKMainEventHandler annotationEventHandler](self, "annotationEventHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    if (-[AKMainEventHandler mainEventHandlerIsInTrackingLoop](self, "mainEventHandlerIsInTrackingLoop"))
    {
      objc_msgSend(MEMORY[0x24BDE57D8], "activate");
      objc_msgSend(MEMORY[0x24BDE57D8], "begin");
      LOBYTE(v11) = 1;
      objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
      v28 = -[AKMainEventHandler continueDragEventTrackingLoopWithEvent:orRecognizer:](self, "continueDragEventTrackingLoopWithEvent:orRecognizer:", v6, v7);
      objc_msgSend(MEMORY[0x24BDE57D8], "commit");
      if (v28)
        goto LABEL_22;
      -[AKMainEventHandler setMainEventHandlerIsInTrackingLoop:](self, "setMainEventHandlerIsInTrackingLoop:", 0);
      -[AKMainEventHandler setWasSelectedByLongPressRecognizer:](self, "setWasSelectedByLongPressRecognizer:", 0);
      -[AKMainEventHandler setLeftMouseDownPoint:](self, "setLeftMouseDownPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    }
    else
    {
      if (!-[AKMainEventHandler mainEventHandlerIsInRotationLoop](self, "mainEventHandlerIsInRotationLoop"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v35 = -[AKMainEventHandler handleRotateEvent:orRecognizer:](self, "handleRotateEvent:orRecognizer:", v6, v7);
        else
          v35 = -[AKMainEventHandler handleDownEvent:orRecognizer:](self, "handleDownEvent:orRecognizer:", v6, v7);
        LOBYTE(v11) = v35;
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x24BDE57D8], "activate");
      objc_msgSend(MEMORY[0x24BDE57D8], "begin");
      LOBYTE(v11) = 1;
      objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
      v29 = -[AKMainEventHandler continueRotateEventTrackingLoopWithEvent:orRecognizer:](self, "continueRotateEventTrackingLoopWithEvent:orRecognizer:", v6, v7);
      objc_msgSend(MEMORY[0x24BDE57D8], "commit");
      if (v29)
        goto LABEL_22;
      -[AKMainEventHandler setMainEventHandlerIsInRotationLoop:](self, "setMainEventHandlerIsInRotationLoop:", 0);
      -[AKMainEventHandler setWasSelectedByLongPressRecognizer:](self, "setWasSelectedByLongPressRecognizer:", 0);
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *MEMORY[0x24BDD13A0];
    objc_msgSend(v8, "undoController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "undoManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "postNotificationName:object:", v31, v33);

LABEL_21:
    LOBYTE(v11) = 1;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  LOBYTE(v11) = 1;
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[AKMainEventHandler annotationEventHandler](self, "annotationEventHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "continueDraggableAreaEventTrackingLoopWithEvent:orRecognizer:", v6, v7);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  if ((v18 & 1) == 0)
  {
    -[AKMainEventHandler annotationEventHandler](self, "annotationEventHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "annotation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "setIsDraggingHandle:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || +[AKAnnotationRenderer annotationShouldAvoidRedrawDuringLiveResize:](AKAnnotationRenderer, "annotationShouldAvoidRedrawDuringLiveResize:", v20))
    {
      -[AKMainEventHandler annotationEventHandler](self, "annotationEventHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "pageController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "layerPresentationManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "forceUpdateAnnotationLayer:", v20);

    }
    -[AKMainEventHandler setAnnotationEventHandler:](self, "setAnnotationEventHandler:", 0);
    -[AKMainEventHandler setWasSelectedByLongPressRecognizer:](self, "setWasSelectedByLongPressRecognizer:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x24BDD13A0];
    objc_msgSend(v8, "undoController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "undoManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "postNotificationName:object:", v25, v27);

    goto LABEL_21;
  }
LABEL_22:

  return (char)v11;
}

- (CGPoint)modelPointFromEvent:(id)a3 orRecognizer:(id)a4 onPageController:(id *)a5
{
  double v7;
  double v8;
  CGPoint result;

  -[AKMainEventHandler windowPointFromEvent:orRecognizer:](self, "windowPointFromEvent:orRecognizer:", a3, a4);
  -[AKMainEventHandler modelPointFromWindowPoint:foundOnPageController:](self, "modelPointFromWindowPoint:foundOnPageController:", a5);
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)windowPointFromEvent:(id)a3 orRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;
  double v19;
  CGPoint result;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_13;
    -[AKMainEventHandler annotationEventHandler](self, "annotationEventHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

    }
    else if (!-[AKMainEventHandler mainEventHandlerIsInTrackingLoop](self, "mainEventHandlerIsInTrackingLoop"))
    {
      v11 = *MEMORY[0x24BDBEFB0];
      v12 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
LABEL_8:
      -[AKMainEventHandler panGestureStartPointInWindow](self, "panGestureStartPointInWindow");
      if (v14 != v11 || v13 != v12)
      {
        -[AKMainEventHandler panGestureStartPointInWindow](self, "panGestureStartPointInWindow");
LABEL_14:
        v9 = v16;
        v10 = v17;
        goto LABEL_15;
      }
LABEL_13:
      objc_msgSend(v7, "akLocationInWindow");
      goto LABEL_14;
    }
    v11 = *MEMORY[0x24BDBEFB0];
    v12 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    -[AKMainEventHandler setPanGestureStartPointInWindow:](self, "setPanGestureStartPointInWindow:", *MEMORY[0x24BDBEFB0], v12);
    goto LABEL_8;
  }
  v9 = *MEMORY[0x24BDBEFB0];
  v10 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
LABEL_15:

  v18 = v9;
  v19 = v10;
  result.y = v19;
  result.x = v18;
  return result;
}

- (CGPoint)modelPointFromWindowPoint:(CGPoint)a3 foundOnPageController:(id *)a4
{
  double y;
  double x;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGPoint result;
  CGPoint v31;
  CGRect v32;

  y = a3.y;
  x = a3.x;
  v29 = *MEMORY[0x24BDAC8D0];
  v7 = *MEMORY[0x24BDBEFB0];
  v8 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  -[AKMainEventHandler controller](self, "controller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v9, "pageControllers", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v14, "relinquishablesAreLoaded"))
        {
          objc_msgSend(v14, "overlayView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "convertPoint:fromView:", 0, x, y);
          v17 = v16;
          v19 = v18;
          objc_msgSend(v15, "bounds");
          v31.x = v17;
          v31.y = v19;
          if (CGRectContainsPoint(v32, v31))
          {
            v11 = v14;
            objc_msgSend(v11, "convertPointFromOverlayToModel:", v17, v19);
            v7 = v20;
            v8 = v21;

            goto LABEL_13;
          }

        }
      }
      v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_13:

  if (a4)
    *a4 = objc_retainAutorelease(v11);

  v22 = v7;
  v23 = v8;
  result.y = v23;
  result.x = v22;
  return result;
}

- (BOOL)handleDownEvent:(id)a3 orRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  double v24;
  int v25;
  int v26;
  BOOL v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  BOOL v33;
  uint64_t v34;
  AKMainEventHandler *v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  char v58;
  id v59;
  CGColor *v60;
  double Alpha;
  int v62;
  int v63;
  _BOOL4 v64;
  id v65;
  CGColor *v66;
  double v67;
  int v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  int v81;
  id v82;
  uint64_t v83;
  __int16 v84;
  id v85;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7 || (unint64_t)objc_msgSend(v7, "akNumberOfTouches") <= 1)
  {
    -[AKMainEventHandler controller](self, "controller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "toolController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "toolMode");

    -[AKMainEventHandler setAnnotationToBeginEditingOnDragEnd:](self, "setAnnotationToBeginEditingOnDragEnd:", 0);
    v13 = 0x24BDD1000uLL;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("AKShapeDetectionController.shouldDismissCandidatePicker"), self);

    v85 = 0;
    -[AKMainEventHandler modelPointFromEvent:orRecognizer:onPageController:](self, "modelPointFromEvent:orRecognizer:onPageController:", v6, v8, &v85);
    v16 = v15;
    v18 = v17;
    v19 = v85;
    objc_msgSend(v10, "textEditorController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEditing");

    if (!v21)
    {
LABEL_18:
      if (v6 || !v8)
      {
LABEL_51:
        if (!v19)
        {
          v9 = 0;
LABEL_111:

          goto LABEL_112;
        }
        -[AKMainEventHandler _setCurrentPageBasedOnPageController:](self, "_setCurrentPageBasedOnPageController:", v19);
        v84 = 0;
        if (-[AKMainEventHandler mainEventHandlerIsInDoodleTrackingLoop](self, "mainEventHandlerIsInDoodleTrackingLoop"))
        {
          v23 = 0;
        }
        else
        {
          -[AKMainEventHandler annotationsPassingBoundingBoxHitTestsWithPoint:onPageController:](self, "annotationsPassingBoundingBoxHitTestsWithPoint:onPageController:", v19, v16, v18);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[AKMainEventHandler wasSelectedByLongPressRecognizer](self, "wasSelectedByLongPressRecognizer")
            && -[AKMainEventHandler hitTestPointsOfInterestsAtPoint:onPageController:inAnnotations:event:recognizer:cursorUpdateOnly:](self, "hitTestPointsOfInterestsAtPoint:onPageController:inAnnotations:event:recognizer:cursorUpdateOnly:", v19, v41, v6, v8, 0, v16, v18))
          {

            v23 = 0;
LABEL_109:
            v9 = 1;
            goto LABEL_110;
          }
          -[AKMainEventHandler topmostAnnotationForBorderAndInteriorHitTestAtPoint:inAnnotations:onPageController:wasOnBorder:wasOnText:](self, "topmostAnnotationForBorderAndInteriorHitTestAtPoint:inAnnotations:onPageController:wasOnBorder:wasOnText:", v41, v19, (char *)&v84 + 1, &v84, v16, v18);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v23)
            goto LABEL_89;
          objc_msgSend(v10, "modelController");
          v42 = v6;
          v43 = v19;
          v44 = v12;
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "allSelectedAnnotations");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "containsObject:", v23);

          v13 = 0x24BDD1000;
          v12 = v44;
          v19 = v43;
          v6 = v42;
        }
        else
        {
          v47 = 1;
          if (!v23)
            goto LABEL_89;
        }
        if (!v47)
        {
LABEL_89:
          if ((unint64_t)(v12 - 1) > 1)
          {
            if (v8)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v8, "akLocationInWindow");
                if (-[AKMainEventHandler _detectFormElementInCurrentPageControllerUnderPointInWindow:](self, "_detectFormElementInCurrentPageControllerUnderPointInWindow:"))
                {
                  goto LABEL_109;
                }
              }
            }
          }
          else if (v8)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v10, "modelController");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "deselectAllAnnotations");

              objc_msgSend(v10, "hideSelectionMenu:", 0);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v10, "legacyDoodleController");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v71, "handleDragAction:", v8);

                if ((unint64_t)(objc_msgSend(v8, "state") - 3) <= 2)
                  -[AKMainEventHandler setMainEventHandlerIsInDoodleTrackingLoop:](self, "setMainEventHandlerIsInDoodleTrackingLoop:", 0);
              }
              -[AKMainEventHandler setLeftMouseDownPoint:](self, "setLeftMouseDownPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
              objc_msgSend(*(id *)(v13 + 1744), "defaultCenter");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              v73 = *MEMORY[0x24BDD13A0];
              objc_msgSend(v10, "undoController");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "undoManager");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "postNotificationName:object:", v73, v75);

              goto LABEL_109;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v10, "modelController");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "allSelectedAnnotations");
              v77 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v10, "toolbarViewController");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v78, "isPresentingPopovers"))
              {
                objc_msgSend(v78, "dismissPresentedPopovers");
LABEL_108:

                goto LABEL_109;
              }
              if (!objc_msgSend(v77, "count"))
              {
                objc_msgSend(v10, "legacyDoodleController");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v79, "handleTapAction:", v8);

                goto LABEL_108;
              }

            }
          }
          v33 = -[AKMainEventHandler _didNotHandleEventSoDeselect](self, "_didNotHandleEventSoDeselect");
          goto LABEL_106;
        }
        v83 = v12;
        if ((_BYTE)v84)
        {
          objc_msgSend(v19, "pageModelController");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "selectedAnnotations");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "containsObject:", v23);

          if (v50)
          {
            objc_msgSend(v19, "pageModelController");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "mutableSetValueForKey:", CFSTR("selectedAnnotations"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v23);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "setSet:", v53);

            -[AKMainEventHandler setAnnotationToBeginEditingOnDragEnd:](self, "setAnnotationToBeginEditingOnDragEnd:", v23);
          }
          else
          {
            +[AKTextAnnotationAttributeHelper actualOrPlaceholderTextOfAnnotation:](AKTextAnnotationAttributeHelper, "actualOrPlaceholderTextOfAnnotation:", v23);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = v54;
            if (!v54 || !objc_msgSend(v54, "length"))
              LOBYTE(v84) = 0;
          }

        }
        objc_msgSend(v19, "pageModelController");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "selectedAnnotations");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "containsObject:", v23);

        v58 = objc_opt_respondsToSelector();
        v81 = v57;
        if ((v58 & 1) != 0)
        {
          objc_msgSend(v23, "strokeColor");
          v59 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v60 = (CGColor *)objc_msgSend(v59, "CGColor");

          Alpha = CGColorGetAlpha(v60);
          v62 = Alpha > 0.0;
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            v63 = Alpha <= 0.0;
            v64 = 1;
LABEL_77:
            v13 = 0x24BDD1000;
            v12 = v83;
            goto LABEL_81;
          }
        }
        else
        {
          v62 = 1;
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            v68 = 0;
            v64 = 1;
            goto LABEL_80;
          }
        }
        objc_msgSend(v23, "fillColor");
        v65 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v66 = (CGColor *)objc_msgSend(v65, "CGColor");

        v67 = CGColorGetAlpha(v66);
        v64 = v67 > 0.0;
        if ((v58 & 1) != 0)
        {
          v63 = (v67 <= 0.0) & ~v62;
          goto LABEL_77;
        }
        v68 = 1;
LABEL_80:
        v13 = 0x24BDD1000uLL;
        v12 = v83;
        v63 = v68 & !v64;
LABEL_81:
        if ((_BYTE)v84)
          goto LABEL_82;
        if (HIBYTE(v84))
        {
          if (((v62 | v63) & 1) == 0)
            goto LABEL_89;
        }
        else if ((v64 | v63 | v81) != 1)
        {
          goto LABEL_89;
        }
LABEL_82:
        -[AKMainEventHandler _updateSelectionWithAnnotation:onPageController:](self, "_updateSelectionWithAnnotation:onPageController:", v23, v19);
        if (-[AKMainEventHandler enterDragEventTrackingLoopWithEvent:orRecognizer:](self, "enterDragEventTrackingLoopWithEvent:orRecognizer:", v6, v8))
        {
          v9 = 1;
          -[AKMainEventHandler setMainEventHandlerIsInTrackingLoop:](self, "setMainEventHandlerIsInTrackingLoop:", 1);
          objc_msgSend(v10, "hideSelectionMenu:", 0);
        }
        else
        {
          v69 = +[AKAnnotationEventHandler newAnnotationEventHandlerForCurrentPlatformForAnnotation:withPageController:](AKAnnotationEventHandler, "newAnnotationEventHandlerForCurrentPlatformForAnnotation:withPageController:", v23, v19);
          v9 = objc_msgSend(v69, "handleDownEvent:orRecognizer:", v6, v8);

        }
        goto LABEL_110;
      }
      objc_msgSend(v10, "toolbarViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "isPresentingPopovers"))
        objc_msgSend(v23, "dismissPresentedPopovers");
      if (objc_msgSend(v8, "conformsToProtocol:", &unk_255A4ACF8))
        objc_msgSend(v8, "penGestureDetected");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[AKMainEventHandler setWasSelectedByLongPressRecognizer:](self, "setWasSelectedByLongPressRecognizer:", 0);
        if (objc_msgSend(v8, "akNumberOfTapsRequired") == 2)
        {
          v33 = -[AKMainEventHandler handleDoubleDownEvent:orRecognizer:](self, "handleDoubleDownEvent:orRecognizer:", 0, v8);
LABEL_106:
          v9 = v33;
          goto LABEL_110;
        }
        goto LABEL_50;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "setEnabled:", 0);
        objc_msgSend(v8, "setEnabled:", 1);
        if (!-[AKMainEventHandler mainEventHandlerIsInTrackingLoop](self, "mainEventHandlerIsInTrackingLoop")
          && !-[AKMainEventHandler mainEventHandlerIsInRotationLoop](self, "mainEventHandlerIsInRotationLoop"))
        {
          -[AKMainEventHandler setWasSelectedByLongPressRecognizer:](self, "setWasSelectedByLongPressRecognizer:", 1);
        }
        goto LABEL_50;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v9 = 0;
LABEL_110:

        goto LABEL_111;
      }
      v34 = objc_msgSend(v8, "state");
      if (v34 == 2)
      {
        if (-[AKMainEventHandler mainEventHandlerIsInTrackingLoop](self, "mainEventHandlerIsInTrackingLoop")
          || (unint64_t)(v12 - 3) < 0xFFFFFFFFFFFFFFFELL)
        {
          goto LABEL_50;
        }
        v35 = self;
        v36 = 1;
      }
      else
      {
        if (v34 == 1)
        {
          if ((unint64_t)(v12 - 1) <= 1)
          {
            objc_msgSend(v10, "modelController");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "allSelectedAnnotations");
            v38 = v19;
            v39 = v12;
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[AKMainEventHandler setMainEventHandlerIsInDoodleTrackingLoop:](self, "setMainEventHandlerIsInDoodleTrackingLoop:", objc_msgSend(v40, "count") == 0);

            v12 = v39;
            v19 = v38;
            v6 = 0;

          }
          goto LABEL_50;
        }
        if (v34)
        {
LABEL_50:

          goto LABEL_51;
        }
        v35 = self;
        v36 = 0;
      }
      -[AKMainEventHandler setMainEventHandlerIsInDoodleTrackingLoop:](v35, "setMainEventHandlerIsInDoodleTrackingLoop:", v36);
      goto LABEL_50;
    }
    objc_msgSend(v10, "textEditorController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "textView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v8, "locationInView:", v23);
    else
      v24 = 1.79769313e308;
    v82 = v6;
    v25 = objc_msgSend(v23, "pointInside:withEvent:", 0, v24);
    v26 = v25;
    if (v8 && !v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v27 = objc_msgSend(v8, "state") != 1;
      if (v27)
      {
        v28 = v12;
LABEL_15:
        objc_msgSend(v10, "textEditorController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "annotation");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = +[AKTextAnnotationRenderHelper hitTestPoint:againstActualTextForAnnotation:onPageController:](AKTextAnnotationRenderHelper, "hitTestPoint:againstActualTextForAnnotation:onPageController:", v30, v19, v16, v18);
        if (v27 || (v12 = v28, v31))
        {
          if (v8)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && (objc_msgSend(v8, "state") == 3 || objc_msgSend(v8, "state") == 4 || objc_msgSend(v8, "state") == 5))
            {
              -[AKMainEventHandler setPanGestureStartPointInWindow:](self, "setPanGestureStartPointInWindow:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
            }
          }
          v9 = 1;
          v6 = v82;
          goto LABEL_110;
        }
      }
    }
    else if (v26)
    {
      v28 = v12;
      v27 = 0;
      goto LABEL_15;
    }
    objc_msgSend(v10, "textEditorController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "endEditing");

    v6 = v82;
    goto LABEL_18;
  }
  v9 = 0;
LABEL_112:

  return v9;
}

- (BOOL)handleDoubleDownEvent:(id)a3 orRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v20;
  __int16 v21;
  id v22;

  v6 = a4;
  v7 = a3;
  -[AKMainEventHandler controller](self, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  -[AKMainEventHandler modelPointFromEvent:orRecognizer:onPageController:](self, "modelPointFromEvent:orRecognizer:onPageController:", v7, v6, &v22);
  v10 = v9;
  v12 = v11;

  v13 = v22;
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("AKShapeDetectionController.shouldDismissCandidatePicker"), self);

    if (!objc_msgSend(v6, "conformsToProtocol:", &unk_255A4ACF8)
      || (objc_msgSend(v6, "penGestureDetected") & 1) == 0)
    {
      -[AKMainEventHandler _setCurrentPageBasedOnPageController:](self, "_setCurrentPageBasedOnPageController:", v13);
      -[AKMainEventHandler annotationsPassingBoundingBoxHitTestsWithPoint:onPageController:](self, "annotationsPassingBoundingBoxHitTestsWithPoint:onPageController:", v13, v10, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      -[AKMainEventHandler topmostAnnotationForBorderAndInteriorHitTestAtPoint:inAnnotations:onPageController:wasOnBorder:wasOnText:](self, "topmostAnnotationForBorderAndInteriorHitTestAtPoint:inAnnotations:onPageController:wasOnBorder:wasOnText:", v15, v13, (char *)&v21 + 1, &v21, v10, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16
        && objc_msgSend(v16, "conformsToAKTextAnnotationProtocol")
        && (objc_msgSend(v17, "editingDisabled") & 1) == 0)
      {
        objc_msgSend(v8, "textEditorController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "beginEditingAnnotation:withPageController:selectAllText:", v17, v13, 0);

        v18 = 1;
        goto LABEL_10;
      }

    }
    v18 = -[AKMainEventHandler _didNotHandleEventSoDeselect](self, "_didNotHandleEventSoDeselect");
  }
  else
  {
    v18 = 0;
  }
LABEL_10:

  return v18;
}

- (BOOL)handleRightDownEvent:(id)a3
{
  return 0;
}

- (BOOL)handleKeyboardEvent:(id)a3
{
  return 0;
}

- (BOOL)handleRotateEvent:(id)a3 orRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v12;

  v6 = a3;
  v7 = a4;
  -[AKMainEventHandler controller](self, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  -[AKMainEventHandler modelPointFromEvent:orRecognizer:onPageController:](self, "modelPointFromEvent:orRecognizer:onPageController:", v6, v7, &v12);
  if (v12
    && (objc_msgSend(v8, "textEditorController"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "endEditing"),
        v9,
        -[AKMainEventHandler enterRotateEventTrackingLoopWithEvent:orRecognizer:](self, "enterRotateEventTrackingLoopWithEvent:orRecognizer:", v6, v7)))
  {
    v10 = 1;
    -[AKMainEventHandler setMainEventHandlerIsInRotationLoop:](self, "setMainEventHandlerIsInRotationLoop:", 1);
    objc_msgSend(v8, "hideSelectionMenu:", 0);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)enterDragEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
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
  CGFloat v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double MinX;
  double v42;
  double v43;
  double MaxX;
  double v45;
  double v46;
  double MinY;
  double v48;
  double v49;
  double MaxY;
  AKAlignmentGuideController *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  BOOL v56;
  double v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  _BYTE v65[128];
  uint64_t v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;

  v66 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v56 = 0;
  }
  else
  {
    -[AKMainEventHandler windowPointFromEvent:orRecognizer:](self, "windowPointFromEvent:orRecognizer:", v6, v7);
    v9 = v8;
    v11 = v10;
    v64 = 0;
    -[AKMainEventHandler modelPointFromWindowPoint:foundOnPageController:](self, "modelPointFromWindowPoint:foundOnPageController:", &v64);
    v58 = v12;
    v14 = v13;
    v15 = v64;
    if (v15)
    {
      -[AKMainEventHandler setDraggedAnnotationsMaxLeftEdge:](self, "setDraggedAnnotationsMaxLeftEdge:", 2.22507386e-308);
      -[AKMainEventHandler setDraggedAnnotationsMinRightEdge:](self, "setDraggedAnnotationsMinRightEdge:", 1.79769313e308);
      -[AKMainEventHandler setDraggedAnnotationsMaxBottomEdge:](self, "setDraggedAnnotationsMaxBottomEdge:", 2.22507386e-308);
      -[AKMainEventHandler setDraggedAnnotationsMinTopEdge:](self, "setDraggedAnnotationsMinTopEdge:", 1.79769313e308);
      v59 = v15;
      objc_msgSend(v15, "pageModelController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "selectedAnnotations");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v61;
LABEL_6:
        v22 = 0;
        while (1)
        {
          if (*(_QWORD *)v61 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v22);
          if (!+[AKAnnotationEventHandler allowsDraggingOfAnnotation:](AKAnnotationEventHandler, "allowsDraggingOfAnnotation:", v23))
          {

            v56 = 0;
            v15 = v59;
            goto LABEL_37;
          }
          if ((objc_msgSend(v7, "modifierFlags") & 0x80000) != 0)
          {
            -[AKMainEventHandler controller](self, "controller");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "duplicate:", 0);

          }
          if (objc_msgSend(v23, "conformsToAKRectangularAnnotationProtocol"))
          {
            objc_msgSend(v23, "rectangle");
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v23, "startPoint");
              v30 = v29;
              v32 = v31;
              objc_msgSend(v23, "endPoint");
              if (v30 >= v33)
                v35 = v33;
              else
                v35 = v30;
              if (v32 >= v34)
                v36 = v34;
              else
                v36 = v32;
              v37 = vabdd_f64(v33, v30);
              v38 = vabdd_f64(v34, v32);
              goto LABEL_24;
            }
            objc_msgSend(v23, "hitTestBounds");
          }
          v35 = v25;
          v36 = v26;
          v37 = v27;
          v38 = v28;
LABEL_24:
          -[AKMainEventHandler draggedAnnotationsMaxLeftEdge](self, "draggedAnnotationsMaxLeftEdge");
          v40 = v39;
          v67.origin.x = v35;
          v67.origin.y = v36;
          v67.size.width = v37;
          v67.size.height = v38;
          MinX = CGRectGetMinX(v67);
          if (v40 >= MinX)
            MinX = v40;
          -[AKMainEventHandler setDraggedAnnotationsMaxLeftEdge:](self, "setDraggedAnnotationsMaxLeftEdge:", MinX);
          -[AKMainEventHandler draggedAnnotationsMinRightEdge](self, "draggedAnnotationsMinRightEdge");
          v43 = v42;
          v68.origin.x = v35;
          v68.origin.y = v36;
          v68.size.width = v37;
          v68.size.height = v38;
          MaxX = CGRectGetMaxX(v68);
          if (v43 < MaxX)
            MaxX = v43;
          -[AKMainEventHandler setDraggedAnnotationsMinRightEdge:](self, "setDraggedAnnotationsMinRightEdge:", MaxX);
          -[AKMainEventHandler draggedAnnotationsMaxBottomEdge](self, "draggedAnnotationsMaxBottomEdge");
          v46 = v45;
          v69.origin.x = v35;
          v69.origin.y = v36;
          v69.size.width = v37;
          v69.size.height = v38;
          MinY = CGRectGetMinY(v69);
          if (v46 >= MinY)
            MinY = v46;
          -[AKMainEventHandler setDraggedAnnotationsMaxBottomEdge:](self, "setDraggedAnnotationsMaxBottomEdge:", MinY);
          -[AKMainEventHandler draggedAnnotationsMinTopEdge](self, "draggedAnnotationsMinTopEdge");
          v49 = v48;
          v70.origin.x = v35;
          v70.origin.y = v36;
          v70.size.width = v37;
          v70.size.height = v38;
          MaxY = CGRectGetMaxY(v70);
          if (v49 < MaxY)
            MaxY = v49;
          -[AKMainEventHandler setDraggedAnnotationsMinTopEdge:](self, "setDraggedAnnotationsMinTopEdge:", MaxY);
          if (v20 == ++v22)
          {
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
            if (v20)
              goto LABEL_6;
            break;
          }
        }
      }

      v15 = v59;
      -[AKMainEventHandler setDragPageController:](self, "setDragPageController:", v59);
      v51 = -[AKAlignmentGuideController initWithPageController:]([AKAlignmentGuideController alloc], "initWithPageController:", v59);
      -[AKMainEventHandler setDragAlignmentGuideController:](self, "setDragAlignmentGuideController:", v51);

      -[AKMainEventHandler _alignedAnnotationDragPointForPoint:withEvent:orRecognizer:](self, "_alignedAnnotationDragPointForPoint:withEvent:orRecognizer:", v6, v7, v58, v14);
      v53 = v52;
      v55 = v54;
      -[AKMainEventHandler setFirstDragPoint:](self, "setFirstDragPoint:");
      -[AKMainEventHandler setLastDragPoint:](self, "setLastDragPoint:", v53, v55);
      -[AKMainEventHandler setLastDragActualLocationInWindow:](self, "setLastDragActualLocationInWindow:", v9, v11);
      -[AKMainEventHandler setLastEventWithValidLocationForAutoscroll:](self, "setLastEventWithValidLocationForAutoscroll:", v6);
      v56 = 1;
LABEL_37:

    }
    else
    {
      v56 = 0;
    }

  }
  return v56;
}

- (BOOL)continueDragEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxX;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double MinX;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double MaxY;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double MinY;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  BOOL v74;
  double v76;
  double v77;
  double v78;
  double v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (!v7)
    goto LABEL_22;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_24;
  v9 = objc_msgSend(v7, "state") != 3 && objc_msgSend(v7, "state") != 4 && objc_msgSend(v7, "state") != 5;
  -[AKMainEventHandler lastDragPoint](self, "lastDragPoint");
  v78 = v11;
  v79 = v10;
  -[AKMainEventHandler windowPointFromEvent:orRecognizer:](self, "windowPointFromEvent:orRecognizer:", v8, v7);
  v13 = v12;
  v15 = v14;
  -[AKMainEventHandler setLastDragActualLocationInWindow:](self, "setLastDragActualLocationInWindow:");
  -[AKMainEventHandler setLastEventWithValidLocationForAutoscroll:](self, "setLastEventWithValidLocationForAutoscroll:", v8);
  -[AKMainEventHandler dragPageController](self, "dragPageController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKMainEventHandler _modelPointFromPointInWindow:usingPageController:](self, "_modelPointFromPointInWindow:usingPageController:", v16, v13, v15);
  v76 = v17;
  v77 = v18;

  -[AKMainEventHandler dragPageController](self, "dragPageController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "visibleRectOfOverlay");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  -[AKMainEventHandler dragPageController](self, "dragPageController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "overlayView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKGeometryHelper convertRect:fromScreenPointsToView:](AKGeometryHelper, "convertRect:fromScreenPointsToView:", v29, 0.0, 0.0, 12.0, 12.0);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;

  -[AKMainEventHandler dragPageController](self, "dragPageController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "convertRectFromOverlayToModel:", v31, v33, v35, v37);
  v40 = v39;
  v42 = v41;

  v80.origin.x = v21;
  v80.origin.y = v23;
  v80.size.width = v25;
  v80.size.height = v27;
  v81 = CGRectInset(v80, v40, v42);
  x = v81.origin.x;
  y = v81.origin.y;
  width = v81.size.width;
  height = v81.size.height;
  MaxX = CGRectGetMaxX(v81);
  -[AKMainEventHandler firstDragPoint](self, "firstDragPoint");
  v49 = v48;
  -[AKMainEventHandler draggedAnnotationsMaxLeftEdge](self, "draggedAnnotationsMaxLeftEdge");
  v51 = MaxX + v49 - v50;
  if (v76 >= v51)
    v52 = v51;
  else
    v52 = v76;
  v82.origin.x = x;
  v82.origin.y = y;
  v82.size.width = width;
  v82.size.height = height;
  MinX = CGRectGetMinX(v82);
  -[AKMainEventHandler draggedAnnotationsMinRightEdge](self, "draggedAnnotationsMinRightEdge");
  v55 = v54;
  -[AKMainEventHandler firstDragPoint](self, "firstDragPoint");
  v57 = MinX - (v55 - v56);
  if (v52 >= v57)
    v58 = v52;
  else
    v58 = v57;
  v83.origin.x = x;
  v83.origin.y = y;
  v83.size.width = width;
  v83.size.height = height;
  MaxY = CGRectGetMaxY(v83);
  -[AKMainEventHandler firstDragPoint](self, "firstDragPoint");
  v61 = v60;
  -[AKMainEventHandler draggedAnnotationsMaxBottomEdge](self, "draggedAnnotationsMaxBottomEdge");
  v63 = MaxY + v61 - v62;
  if (v77 >= v63)
    v64 = v63;
  else
    v64 = v77;
  v84.origin.x = x;
  v84.origin.y = y;
  v84.size.width = width;
  v84.size.height = height;
  MinY = CGRectGetMinY(v84);
  -[AKMainEventHandler draggedAnnotationsMinTopEdge](self, "draggedAnnotationsMinTopEdge");
  v67 = v66;
  -[AKMainEventHandler firstDragPoint](self, "firstDragPoint");
  if (v64 >= MinY - (v67 - v68))
    v69 = v64;
  else
    v69 = MinY - (v67 - v68);
  -[AKMainEventHandler _alignedAnnotationDragPointForPoint:withEvent:orRecognizer:](self, "_alignedAnnotationDragPointForPoint:withEvent:orRecognizer:", v8, v7, v58, v69, *(_QWORD *)&v76);
  v71 = v70;
  v73 = v72;
  -[AKMainEventHandler setLastDragActualLocation:](self, "setLastDragActualLocation:");
  -[AKMainEventHandler setLastDragPoint:](self, "setLastDragPoint:", v79 + v71 - v79, v78 + v73 - v78);
  if (vabdd_f64(v71, v79) >= 0.0005 || vabdd_f64(v73, v78) >= 0.0005)
  {
    -[AKMainEventHandler applyTranslationToAllSelectedAnnotations:](self, "applyTranslationToAllSelectedAnnotations:", v71 - v79, v73 - v78);
    if (v9)
      goto LABEL_22;
LABEL_24:
    -[AKMainEventHandler finishTranslationOfAllSelectedAnnotations](self, "finishTranslationOfAllSelectedAnnotations");
    -[AKMainEventHandler setLastEventWithValidLocationForAutoscroll:](self, "setLastEventWithValidLocationForAutoscroll:", 0);
    v74 = 0;
    goto LABEL_25;
  }
  if (!v9)
    goto LABEL_24;
LABEL_22:
  v74 = 1;
LABEL_25:

  return v74;
}

- (BOOL)enterRotateEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v6 = a3;
  v7 = a4;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v12 = 0;
  }
  else
  {
    -[AKMainEventHandler controller](self, "controller");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentPageController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pageModelController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectedAnnotations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "count") != 0;
  }

  return v12;
}

- (BOOL)continueRotateEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4
{
  id v6;
  BOOL v7;

  v6 = a4;
  -[AKMainEventHandler applyToAllSelectedAnnotationsRotateEvent:orRecognizer:](self, "applyToAllSelectedAnnotationsRotateEvent:orRecognizer:", a3, v6);
  v7 = !v6 || objc_msgSend(v6, "state") != 3 && objc_msgSend(v6, "state") != 4;

  return v7;
}

- (id)annotationsPassingBoundingBoxHitTestsWithPoint:(CGPoint)a3 onPageController:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGPoint v29;
  CGRect v30;
  CGRect v31;

  y = a3.y;
  x = a3.x;
  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentModelToScreenScaleFactor");
  +[AKAnnotationPointOfInterestHelper draggableAreaScaleFactorForScaleFactor:](AKAnnotationPointOfInterestHelper, "draggableAreaScaleFactorForScaleFactor:");
  v9 = v8;
  v10 = *(double *)&AKPointOfInterestSize_LargestHandleSize;
  objc_msgSend(v6, "pageModelController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "annotations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v12, "reverseObjectEnumerator", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = -1.0 / v9 * v10;
    v17 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_msgSend(v19, "editingDisabled") & 1) == 0)
        {
          objc_msgSend(v19, "hitTestBounds");
          v31 = CGRectInset(v30, v16, v16);
          v29.x = x;
          v29.y = y;
          if (CGRectContainsPoint(v31, v29))
            objc_msgSend(v7, "addObject:", v19);
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }

  objc_msgSend(v7, "reversedOrderedSet");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)topmostAnnotationForBorderAndInteriorHitTestAtPoint:(CGPoint)a3 inAnnotations:(id)a4 onPageController:(id)a5 wasOnBorder:(BOOL *)a6 wasOnText:(BOOL *)a7
{
  double y;
  double x;
  id v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t i;
  void *v22;
  id v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  y = a3.y;
  x = a3.x;
  v31 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a5;
  *a6 = 0;
  *a7 = 0;
  objc_msgSend(v13, "currentModelToScreenScaleFactor");
  v15 = v14;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v12, "reverseObjectEnumerator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v17)
  {
    v18 = v17;
    v25 = v12;
    v19 = *(_QWORD *)v27;
    v20 = 20.0 / v15;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if ((objc_msgSend(v22, "editingDisabled") & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v22, "showHandles"))
          {
            if (objc_msgSend(v22, "conformsToAKTextAnnotationProtocol"))
            {
              v23 = v22;
              if (+[AKTextAnnotationRenderHelper hitTestPoint:againstActualTextForAnnotation:onPageController:](AKTextAnnotationRenderHelper, "hitTestPoint:againstActualTextForAnnotation:onPageController:", v23, v13, x, y))
              {
                *a7 = 1;
                goto LABEL_22;
              }

            }
            if (+[AKAnnotationRenderer pointIsOnBorder:ofAnnotation:minimumBorderThickness:](AKAnnotationRenderer, "pointIsOnBorder:ofAnnotation:minimumBorderThickness:", v22, x, y, v20))
            {
              *a6 = 1;
LABEL_20:
              v23 = v22;
              goto LABEL_22;
            }
            if (+[AKAnnotationRenderer pointIsOnInside:ofAnnotation:](AKAnnotationRenderer, "pointIsOnInside:ofAnnotation:", v22, x, y))
            {
              *a6 = 0;
              goto LABEL_20;
            }
          }
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v18)
        continue;
      break;
    }
    v23 = 0;
LABEL_22:
    v12 = v25;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (BOOL)hitTestPointsOfInterestsAtPoint:(CGPoint)a3 onPageController:(id)a4 inAnnotations:(id)a5 event:(id)a6 recognizer:(id)a7 cursorUpdateOnly:(BOOL)a8
{
  double y;
  double x;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  id v34;
  void *v35;
  void *v37;
  void *v39;
  void *v40;
  __int128 v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  y = a3.y;
  x = a3.x;
  v48 = *MEMORY[0x24BDAC8D0];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  objc_msgSend(v14, "pageModelController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "selectedAnnotations");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "currentModelToScreenScaleFactor");
  v21 = v20;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEE0]), "initWithArray:", v15);
  objc_msgSend(v22, "intersectSet:", v19);
  objc_msgSend(v14, "pageModelController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "cropAnnotation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    objc_msgSend(v22, "insertObject:atIndex:", v24, 0);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(v22, "reverseObjectEnumerator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (!v26)
  {
    LOBYTE(v33) = 0;
    goto LABEL_26;
  }
  v27 = v26;
  v39 = v22;
  v40 = v19;
  *(_QWORD *)&v41 = v17;
  *((_QWORD *)&v41 + 1) = v16;
  v42 = v15;
  v28 = *(_QWORD *)v44;
LABEL_5:
  v29 = 0;
  while (1)
  {
    if (*(_QWORD *)v44 != v28)
      objc_enumerationMutation(v25);
    v30 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v29);
    if ((objc_msgSend(v30, "editingDisabled") & 1) == 0
      && (v30 != v24 || objc_msgSend(v24, "showHandles")))
    {
      break;
    }
LABEL_14:
    if (v27 == ++v29)
    {
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v27)
        goto LABEL_5;
LABEL_16:
      LOBYTE(v33) = 0;
      v15 = v42;
      v17 = (id)v41;
      goto LABEL_25;
    }
  }
  v31 = +[AKAnnotationPointOfInterestHelper draggableAreaForPoint:onAnnotation:withScale:pageControllerForPixelAlignment:](AKAnnotationPointOfInterestHelper, "draggableAreaForPoint:onAnnotation:withScale:pageControllerForPixelAlignment:", v30, v14, x, y, v21);
  v32 = v31;
  if (!v31 || a8)
  {
    if (v31)
      goto LABEL_16;
    goto LABEL_14;
  }
  v17 = (id)v41;
  v15 = v42;
  if (v41 == 0)
  {
    LOBYTE(v33) = 1;
  }
  else
  {
    v34 = +[AKAnnotationEventHandler newAnnotationEventHandlerForCurrentPlatformForAnnotation:withPageController:](AKAnnotationEventHandler, "newAnnotationEventHandlerForCurrentPlatformForAnnotation:withPageController:", v30, v14);
    objc_msgSend(v34, "setInitiallyDraggedArea:", v32);
    v33 = objc_msgSend(v34, "enterDraggableAreaEventTrackingLoopWithEvent:orRecognizer:", v16, (_QWORD)v41);
    if (v33)
    {
      -[AKMainEventHandler controller](self, "controller");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKMainEventHandler setAnnotationEventHandler:](self, "setAnnotationEventHandler:", v34);
      if (v30 == v24)
      {
        objc_msgSend(v37, "modelController");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "deselectAllAnnotations");

      }
      objc_msgSend(v37, "hideSelectionMenu:", 0);
      objc_msgSend(v30, "setIsDraggingHandle:", 1);

    }
  }
LABEL_25:
  v22 = v39;
  v19 = v40;
LABEL_26:

  return v33;
}

- (BOOL)hitTestAnnotationsIncludingPOI:(BOOL)a3 ignoreIfDeselected:(BOOL)a4 atPointInWindow:(CGPoint)a5 outAnnotation:(id *)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  __int16 v23;
  id v24;

  v7 = a4;
  v8 = a3;
  v24 = 0;
  -[AKMainEventHandler modelPointFromWindowPoint:foundOnPageController:](self, "modelPointFromWindowPoint:foundOnPageController:", &v24, a5.x, a5.y);
  v11 = v10;
  v13 = v12;
  v14 = v24;
  -[AKMainEventHandler annotationsPassingBoundingBoxHitTestsWithPoint:onPageController:](self, "annotationsPassingBoundingBoxHitTestsWithPoint:onPageController:", v14, v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && -[AKMainEventHandler hitTestPointsOfInterestsAtPoint:onPageController:inAnnotations:event:recognizer:cursorUpdateOnly:](self, "hitTestPointsOfInterestsAtPoint:onPageController:inAnnotations:event:recognizer:cursorUpdateOnly:", v14, v15, 0, 0, 0, v11, v13))
  {
    v16 = 1;
  }
  else
  {
    v23 = 0;
    -[AKMainEventHandler topmostAnnotationForBorderAndInteriorHitTestAtPoint:inAnnotations:onPageController:wasOnBorder:wasOnText:](self, "topmostAnnotationForBorderAndInteriorHitTestAtPoint:inAnnotations:onPageController:wasOnBorder:wasOnText:", v15, v14, (char *)&v23 + 1, &v23, v11, v13);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (id)v17;
    v16 = v17 != 0;
    if (v7
      && v17
      && (objc_msgSend(v14, "pageModelController"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v19, "selectedAnnotations"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend(v20, "containsObject:", v18),
          v20,
          v19,
          (v21 & 1) == 0))
    {

      v16 = 0;
      v18 = 0;
    }
    else if (a6 && v18)
    {
      v18 = objc_retainAutorelease(v18);
      *a6 = v18;
      v16 = 1;
    }

  }
  return v16;
}

- (void)applyTranslationToAllSelectedAnnotations:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  y = a3.y;
  x = a3.x;
  v20 = *MEMORY[0x24BDAC8D0];
  if (a3.x != *MEMORY[0x24BDBEFB0] || a3.y != *(double *)(MEMORY[0x24BDBEFB0] + 8))
  {
    -[AKMainEventHandler controller](self, "controller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentPageController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pageModelController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectedAnnotations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "translateBy:", x, y, (_QWORD)v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
}

- (void)finishTranslationOfAllSelectedAnnotations
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[AKMainEventHandler controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPageController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pageModelController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedAnnotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v3, "layerPresentationManager", (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "forceUpdateAnnotationLayer:", v11);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (CGPoint)_modelPointFromPointInWindow:(CGPoint)a3 usingPageController:(id)a4
{
  double y;
  double x;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v6 = a4;
  objc_msgSend(v6, "overlayView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertPoint:fromView:", 0, x, y);
  objc_msgSend(v6, "convertPointFromOverlayToModel:");
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)_setCurrentPageBasedOnPageController:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[AKMainEventHandler controller](self, "controller");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "pageIndex");

  objc_msgSend(v6, "setCurrentPageIndex:", v5);
}

- (BOOL)_didNotHandleEventSoDeselect
{
  void *v2;
  void *v3;
  void *v4;

  -[AKMainEventHandler controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deselectAllAnnotations");

  objc_msgSend(v2, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "clearHighlightableSelectionForAnnotationController:", v2);
  objc_msgSend(v2, "hideSelectionMenu:", 0);

  return 0;
}

- (void)_updateSelectionWithAnnotation:(id)a3 onPageController:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a4, "pageModelController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutableSetValueForKey:", CFSTR("selectedAnnotations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "containsObject:", v8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSet:", v7);

  }
}

- (CGPoint)_alignedAnnotationDragPointForPoint:(CGPoint)a3 withEvent:(id)a4 orRecognizer:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v9 = a5;
  v10 = a4;
  -[AKMainEventHandler dragAlignmentGuideController](self, "dragAlignmentGuideController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "guideAlignedPointForPoint:withEvent:orRecognizer:", v10, v9, x, y);
  v13 = v12;
  v15 = v14;

  -[AKMainEventHandler dragPageController](self, "dragPageController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "geometryHelper");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "screenPixelAlignedPointForPoint:", v13, v15);
  v19 = v18;
  v21 = v20;

  -[AKMainEventHandler dragPageController](self, "dragPageController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "geometryHelper");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "contentAlignedPointForPoint:", v19, v21);
  v25 = v24;
  v27 = v26;

  v28 = v25;
  v29 = v27;
  result.y = v29;
  result.x = v28;
  return result;
}

- (BOOL)_detectFormElementInCurrentPageControllerUnderPointInWindow:(CGPoint)a3 withStartingPoint:(CGPoint)a4
{
  double y;
  double x;
  double v7;

  y = a3.y;
  x = a3.x;
  -[AKMainEventHandler leftMouseDownPoint](self, "leftMouseDownPoint", a3.x, a3.y, a4.x, a4.y);
  +[AKGeometryHelper distanceBetweenPoints:andPoint:](AKGeometryHelper, "distanceBetweenPoints:andPoint:");
  return v7 <= 0.0
      && -[AKMainEventHandler _detectFormElementInCurrentPageControllerUnderPointInWindow:](self, "_detectFormElementInCurrentPageControllerUnderPointInWindow:", x, y);
}

- (BOOL)_detectFormElementInCurrentPageControllerUnderPointInWindow:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  char v15;

  y = a3.y;
  x = a3.x;
  -[AKMainEventHandler controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v6, "controllerShouldDetectFormElements:", v5))
  {
    objc_msgSend(v5, "currentPageController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "overlayView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "convertPoint:fromView:", 0, x, y);
    v10 = v9;
    v12 = v11;
    objc_msgSend(v5, "formDetectionController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentPageController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "detectFormFeatureAtPoint:inPageController:", v14, v10, v12);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)mainEventHandlerIsInTrackingLoop
{
  return self->_mainEventHandlerIsInTrackingLoop;
}

- (void)setMainEventHandlerIsInTrackingLoop:(BOOL)a3
{
  self->_mainEventHandlerIsInTrackingLoop = a3;
}

- (BOOL)mainEventHandlerIsInDoodleTrackingLoop
{
  return self->_mainEventHandlerIsInDoodleTrackingLoop;
}

- (void)setMainEventHandlerIsInDoodleTrackingLoop:(BOOL)a3
{
  self->_mainEventHandlerIsInDoodleTrackingLoop = a3;
}

- (BOOL)mainEventHandlerIsInRotationLoop
{
  return self->_mainEventHandlerIsInRotationLoop;
}

- (void)setMainEventHandlerIsInRotationLoop:(BOOL)a3
{
  self->_mainEventHandlerIsInRotationLoop = a3;
}

- (AKAnnotationEventHandler)annotationEventHandler
{
  return (AKAnnotationEventHandler *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAnnotationEventHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unint64_t)currentModifierFlags
{
  return self->_currentModifierFlags;
}

- (void)setCurrentModifierFlags:(unint64_t)a3
{
  self->_currentModifierFlags = a3;
}

- (BOOL)shouldEatNextLeftMouseUp
{
  return self->_shouldEatNextLeftMouseUp;
}

- (void)setShouldEatNextLeftMouseUp:(BOOL)a3
{
  self->_shouldEatNextLeftMouseUp = a3;
}

- (BOOL)shouldEatNextRightMouseUp
{
  return self->_shouldEatNextRightMouseUp;
}

- (void)setShouldEatNextRightMouseUp:(BOOL)a3
{
  self->_shouldEatNextRightMouseUp = a3;
}

- (BOOL)dragDidCopySelectedAnnotations
{
  return self->_dragDidCopySelectedAnnotations;
}

- (void)setDragDidCopySelectedAnnotations:(BOOL)a3
{
  self->_dragDidCopySelectedAnnotations = a3;
}

- (BOOL)undoManagerWasGroupingByEvent
{
  return self->_undoManagerWasGroupingByEvent;
}

- (void)setUndoManagerWasGroupingByEvent:(BOOL)a3
{
  self->_undoManagerWasGroupingByEvent = a3;
}

- (CGPoint)leftMouseDownPoint
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_leftMouseDownPoint, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setLeftMouseDownPoint:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_leftMouseDownPoint, &v3, 16, 1, 0);
}

- (AKPageController)dragPageController
{
  return (AKPageController *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDragPageController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (AKAlignmentGuideController)dragAlignmentGuideController
{
  return (AKAlignmentGuideController *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDragAlignmentGuideController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (CGPoint)lastDragPoint
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_lastDragPoint, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setLastDragPoint:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_lastDragPoint, &v3, 16, 1, 0);
}

- (CGPoint)lastDragActualLocation
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_lastDragActualLocation, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setLastDragActualLocation:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_lastDragActualLocation, &v3, 16, 1, 0);
}

- (CGPoint)lastDragActualLocationInWindow
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_lastDragActualLocationInWindow, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setLastDragActualLocationInWindow:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_lastDragActualLocationInWindow, &v3, 16, 1, 0);
}

- (double)draggedAnnotationsMaxLeftEdge
{
  return self->_draggedAnnotationsMaxLeftEdge;
}

- (void)setDraggedAnnotationsMaxLeftEdge:(double)a3
{
  self->_draggedAnnotationsMaxLeftEdge = a3;
}

- (double)draggedAnnotationsMinRightEdge
{
  return self->_draggedAnnotationsMinRightEdge;
}

- (void)setDraggedAnnotationsMinRightEdge:(double)a3
{
  self->_draggedAnnotationsMinRightEdge = a3;
}

- (double)draggedAnnotationsMaxBottomEdge
{
  return self->_draggedAnnotationsMaxBottomEdge;
}

- (void)setDraggedAnnotationsMaxBottomEdge:(double)a3
{
  self->_draggedAnnotationsMaxBottomEdge = a3;
}

- (double)draggedAnnotationsMinTopEdge
{
  return self->_draggedAnnotationsMinTopEdge;
}

- (void)setDraggedAnnotationsMinTopEdge:(double)a3
{
  self->_draggedAnnotationsMinTopEdge = a3;
}

- (UIEvent)lastEventWithValidLocationForAutoscroll
{
  return (UIEvent *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastEventWithValidLocationForAutoscroll:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (UIEvent)lastLeftMouseDownEvent
{
  return (UIEvent *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLastLeftMouseDownEvent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (BOOL)wasSelectedByLongPressRecognizer
{
  return self->_wasSelectedByLongPressRecognizer;
}

- (void)setWasSelectedByLongPressRecognizer:(BOOL)a3
{
  self->_wasSelectedByLongPressRecognizer = a3;
}

- (AKAnnotation)annotationToBeginEditingOnDragEnd
{
  return (AKAnnotation *)objc_loadWeakRetained((id *)&self->_annotationToBeginEditingOnDragEnd);
}

- (void)setAnnotationToBeginEditingOnDragEnd:(id)a3
{
  objc_storeWeak((id *)&self->_annotationToBeginEditingOnDragEnd, a3);
}

- (AKHighlightColorEditorController)highlightColorEditor
{
  return (AKHighlightColorEditorController *)objc_getProperty(self, a2, 120, 1);
}

- (void)setHighlightColorEditor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (AKController)controller
{
  return (AKController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (CGPoint)firstDragPoint
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_firstDragPoint, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setFirstDragPoint:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_firstDragPoint, &v3, 16, 1, 0);
}

- (CGPoint)panGestureStartPointInWindow
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_panGestureStartPointInWindow, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPanGestureStartPointInWindow:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_panGestureStartPointInWindow, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_highlightColorEditor, 0);
  objc_destroyWeak((id *)&self->_annotationToBeginEditingOnDragEnd);
  objc_storeStrong((id *)&self->_lastLeftMouseDownEvent, 0);
  objc_storeStrong((id *)&self->_lastEventWithValidLocationForAutoscroll, 0);
  objc_storeStrong((id *)&self->_dragAlignmentGuideController, 0);
  objc_storeStrong((id *)&self->_dragPageController, 0);
  objc_storeStrong((id *)&self->_annotationEventHandler, 0);
}

@end
