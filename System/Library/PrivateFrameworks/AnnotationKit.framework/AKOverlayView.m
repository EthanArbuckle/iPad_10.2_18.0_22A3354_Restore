@implementation AKOverlayView

+ (void)initialize
{
  if (qword_253CF9F18 != -1)
    dispatch_once(&qword_253CF9F18, &unk_24F1A7238);
}

- (AKOverlayView)initWithPageController:(id)a3
{
  id v4;
  AKOverlayView *v5;
  AKOverlayView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AKOverlayView;
  v5 = -[AKOverlayView init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AKOverlayView setPageController:](v5, "setPageController:", v4);
    objc_msgSend(v4, "controller");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mainEventHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKOverlayView setMainEventHandler:](v6, "setMainEventHandler:", v8);

    objc_msgSend(v4, "layerPresentationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rootLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[AKOverlayView layer](v6, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSublayer:", v10);

    -[AKOverlayView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
    v12 = objc_alloc_init(MEMORY[0x24BDE33D0]);
    objc_msgSend(v12, "setDelegate:", v6);
    objc_msgSend(v12, "setElementSource:", v6);
    -[AKOverlayView addInteraction:](v6, "addInteraction:", v12);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6C78]), "initWithDelegate:", v6);
    -[AKOverlayView setPointerInteraction:](v6, "setPointerInteraction:", v13);

    -[AKOverlayView pointerInteraction](v6, "pointerInteraction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKOverlayView addInteraction:](v6, "addInteraction:", v14);

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[AKOverlayView _teardownObservation](self, "_teardownObservation");
  v3.receiver = self;
  v3.super_class = (Class)AKOverlayView;
  -[AKOverlayView dealloc](&v3, sel_dealloc);
}

- (void)willMoveToSuperview:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[AKOverlayView _willRemoveFromOldSuperview](self, "_willRemoveFromOldSuperview");
  v5.receiver = self;
  v5.super_class = (Class)AKOverlayView;
  -[AKOverlayView willMoveToSuperview:](&v5, sel_willMoveToSuperview_, v4);

}

- (void)didMoveToSuperview
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKOverlayView;
  -[AKOverlayView didMoveToSuperview](&v5, sel_didMoveToSuperview);
  -[AKOverlayView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AKOverlayView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[AKOverlayView _wasMovedToNewSuperview](self, "_wasMovedToNewSuperview");
    else
      -[AKOverlayView setDeferWasMovedToSuperviewUntilMoveToWindow:](self, "setDeferWasMovedToSuperviewUntilMoveToWindow:", 1);
  }
}

- (void)didMoveToWindow
{
  void *v3;

  -[AKOverlayView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (-[AKOverlayView deferWasMovedToSuperviewUntilMoveToWindow](self, "deferWasMovedToSuperviewUntilMoveToWindow"))
    {
      -[AKOverlayView setDeferWasMovedToSuperviewUntilMoveToWindow:](self, "setDeferWasMovedToSuperviewUntilMoveToWindow:", 0);
      -[AKOverlayView _wasMovedToNewSuperview](self, "_wasMovedToNewSuperview");
    }
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  y = a3.y;
  x = a3.x;
  v40 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)AKOverlayView;
  -[AKOverlayView hitTest:withEvent:](&v38, sel_hitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKOverlayView pageController](self, "pageController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "controller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v8)
  {
    objc_msgSend(v10, "textEditorController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13
      || (-[AKOverlayView convertPoint:toView:](self, "convertPoint:toView:", v13, x, y),
          v15 = v14,
          v17 = v16,
          !objc_msgSend(v13, "pointInside:withEvent:", v7))
      || (objc_msgSend(v13, "hitTest:withEvent:", v7, v15, v17),
          (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v33 = v13;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      -[AKOverlayView subviews](self, "subviews");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v35;
LABEL_7:
        v22 = 0;
        while (1)
        {
          if (*(_QWORD *)v35 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v22);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;
          if (v20 == ++v22)
          {
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
            if (v20)
              goto LABEL_7;
            goto LABEL_13;
          }
        }
        v24 = v23;

        if (!v24)
          goto LABEL_17;
        -[AKOverlayView convertPoint:toView:](self, "convertPoint:toView:", v24, x, y);
        v26 = v25;
        v28 = v27;
        v13 = v33;
        if (objc_msgSend(v24, "pointInside:withEvent:", v7))
        {
          objc_msgSend(v24, "hitTest:withEvent:", v7, v26, v28);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v8 = 0;
        }
      }
      else
      {
LABEL_13:

        v24 = 0;
LABEL_17:
        v8 = 0;
        v13 = v33;
      }

    }
  }
  objc_msgSend(v11, "overlayInteractionDelegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v8)
    v31 = v29 == 0;
  else
    v31 = 1;
  if (!v31
    && (objc_msgSend(v29, "annotationController:shouldAllowOverlayHitTestAtPoint:forOverlayView:currentHitTest:", v11, self, v8, x, y) & 1) == 0)
  {

    v8 = 0;
  }

  return v8;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)_startObservingAnnotationEventHandlers
{
  void *v3;
  void *v4;
  id v5;

  if (!-[AKOverlayView isObservingEventHandling](self, "isObservingEventHandling"))
  {
    -[AKOverlayView pageController](self, "pageController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "controller");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mainEventHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("annotationEventHandler"), 0, CFSTR("AKOverlayView.eventHandlingObservationContext"));
    -[AKOverlayView setIsObservingEventHandling:](self, "setIsObservingEventHandling:", 1);

  }
}

- (void)_stopObservingAnnotationEventHandlers
{
  void *v3;
  void *v4;
  id v5;

  if (-[AKOverlayView isObservingEventHandling](self, "isObservingEventHandling"))
  {
    -[AKOverlayView pageController](self, "pageController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "controller");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mainEventHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("annotationEventHandler"), CFSTR("AKOverlayView.eventHandlingObservationContext"));
    -[AKOverlayView setIsObservingEventHandling:](self, "setIsObservingEventHandling:", 0);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  objc_super v42;
  CGRect v43;
  CGRect v44;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[AKOverlayView pageController](self, "pageController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "controller");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (a6 == CFSTR("AKOverlayView.contentViewMagnificationObservationContext"))
  {
    -[AKOverlayView _updateLayersUsingScrollView](self, "_updateLayersUsingScrollView");
    -[AKOverlayView _postScrollViewRectChangedNotification](self, "_postScrollViewRectChangedNotification");
    goto LABEL_28;
  }
  if (a6 == CFSTR("AKOverlayView.overlayViewSizeObservationContext"))
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E80]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "akRectValue");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend(v16, "akRectValue");
    v44.origin.x = v25;
    v44.origin.y = v26;
    v28 = v27;
    v30 = v29;
    v43.origin.x = v18;
    v43.origin.y = v20;
    v43.size.width = v22;
    v43.size.height = v24;
    v44.size.width = v28;
    v44.size.height = v30;
    if (CGRectEqualToRect(v43, v44))
    {
LABEL_23:

      goto LABEL_28;
    }
    if (v22 == v28 && v24 == v30)
    {
LABEL_22:
      -[AKOverlayView _postScrollViewRectChangedNotification](self, "_postScrollViewRectChangedNotification");
      goto LABEL_23;
    }
LABEL_21:
    -[AKOverlayView _updateLayersUsingScrollViewWithForcedUpdate:](self, "_updateLayersUsingScrollViewWithForcedUpdate:", 1);
    goto LABEL_22;
  }
  if (a6 == CFSTR("AKOverlayView.contentViewContentSizeObservationContext"))
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E80]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "akSizeValue");
    v33 = v32;
    v35 = v34;
    objc_msgSend(v16, "akSizeValue");
    if (v33 == v37 && v35 == v36)
      goto LABEL_23;
    goto LABEL_21;
  }
  if (a6 == CFSTR("AKOverlayView.controllerAnnotationEditingContext"))
  {
    v39 = objc_msgSend(v14, "annotationEditingEnabled");
LABEL_26:
    v40 = v39;
    -[AKOverlayView pointerInteraction](self, "pointerInteraction");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setEnabled:", v40);

    goto LABEL_28;
  }
  if (a6 == CFSTR("AKOverlayView.controllerFormFillingContext"))
  {
    v39 = objc_msgSend(v14, "formFillingEnabled");
    goto LABEL_26;
  }
  if (a6 == CFSTR("AKOverlayView.eventHandlingObservationContext"))
  {
    -[AKOverlayView _removeAllLiftOffHandleViews](self, "_removeAllLiftOffHandleViews");
  }
  else if (a6 != CFSTR("AKOverlayView.selectedAnnotationsContext"))
  {
    v42.receiver = self;
    v42.super_class = (Class)AKOverlayView;
    -[AKOverlayView observeValueForKeyPath:ofObject:change:context:](&v42, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }
LABEL_28:

}

- (void)updateLayers
{
  -[AKOverlayView _updateLayersUsingScrollViewWithForcedUpdate:](self, "_updateLayersUsingScrollViewWithForcedUpdate:", 1);
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[AKOverlayView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v8)
  {
    -[AKOverlayView pageController](self, "pageController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layerPresentationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "bounds");
    objc_msgSend(v7, "setFrame:");

  }
}

- (id)keyCommands
{
  void *v2;
  void *v3;

  -[AKOverlayView annotationController](self, "annotationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyCommandsForAnnotations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)annotationController
{
  void *v2;
  void *v3;

  -[AKOverlayView pageController](self, "pageController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)cut:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AKOverlayView annotationController](self, "annotationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cut:", v4);

}

- (void)copy:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AKOverlayView annotationController](self, "annotationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "copy:", v4);

}

- (void)paste:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AKOverlayView annotationController](self, "annotationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paste:", v4);

}

- (void)delete:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AKOverlayView annotationController](self, "annotationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delete:", v4);

}

- (void)duplicate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AKOverlayView annotationController](self, "annotationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "duplicate:", v4);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  unsigned __int8 v11;
  uint64_t v13;
  void *v14;
  char isKindOfClass;
  objc_super v16;
  objc_super v17;
  char v18;

  v6 = a4;
  -[AKOverlayView annotationController](self, "annotationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textEditorController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v9, "isBlockedAction:", a3) & 1) != 0)
    goto LABEL_3;
  v18 = 0;
  v11 = objc_msgSend(v7, "canPerformKeyCommandAction:withSender:handled:", a3, v6, &v18);
  if (v18)
  {
LABEL_5:
    v10 = v11;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController");
  v13 = objc_claimAutoreleasedReturnValue();
  if ((id)v13 == v6)
  {

  }
  else
  {
    v14 = (void *)v13;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v16.receiver = self;
      v16.super_class = (Class)AKOverlayView;
      v11 = -[AKOverlayView canPerformAction:withSender:](&v16, sel_canPerformAction_withSender_, a3, v6);
      goto LABEL_5;
    }
  }
  if (sel_editTextAnnotation_ == a3)
  {
    v11 = objc_msgSend(v7, "validateEditTextAnnotation:", v6);
    goto LABEL_5;
  }
  if (sel_duplicate_ == a3)
  {
    v11 = objc_msgSend(v7, "validateDuplicate:", v6);
    goto LABEL_5;
  }
  if (sel_delete_ == a3)
  {
    v11 = objc_msgSend(v7, "validateDelete:", v6);
    goto LABEL_5;
  }
  if (sel_cut_ == a3)
  {
    v11 = objc_msgSend(v7, "validateCut:", v6);
    goto LABEL_5;
  }
  if (sel_copy_ == a3)
  {
    v11 = objc_msgSend(v7, "validateCopy:", v6);
    goto LABEL_5;
  }
  if (sel_paste_ != a3)
  {
    v17.receiver = self;
    v17.super_class = (Class)AKOverlayView;
    v11 = -[AKOverlayView canPerformAction:withSender:](&v17, sel_canPerformAction_withSender_, a3, v6);
    goto LABEL_5;
  }
LABEL_3:
  v10 = 0;
LABEL_6:

  return v10;
}

- (void)editTextAnnotation:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AKOverlayView pageController](self, "pageController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "validateEditTextAnnotation:", v6))
    objc_msgSend(v5, "editTextAnnotation:", v6);

}

- (id)_singleSelectedAnnotation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AKOverlayView pageController](self, "pageController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modelController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allSelectedAnnotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_postScrollViewRectChangedNotification
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDD16C8];
  -[AKOverlayView observedScrollView](self, "observedScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationWithName:object:", CFSTR("AKOverlayView.AKContentScrollViewVisibleRectChangeNotification"), v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotification:", v5);

}

- (void)_postScrollViewScrollOrMagnifyEndNotification
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDD16C8];
  -[AKOverlayView observedScrollView](self, "observedScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationWithName:object:", CFSTR("AKOverlayView.AKContentScrollViewEndScrollOrMagnifyNotification"), v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotification:", v5);

}

- (void)_updateLayersUsingScrollView
{
  -[AKOverlayView _updateLayersUsingScrollViewWithForcedUpdate:](self, "_updateLayersUsingScrollViewWithForcedUpdate:", 0);
}

- (void)_updateLayersUsingScrollViewWithForcedUpdate:(BOOL)a3
{
  -[AKOverlayView _updateLayersUsingScrollViewWithForcedUpdate:dismissSelectionMenu:](self, "_updateLayersUsingScrollViewWithForcedUpdate:dismissSelectionMenu:", a3, 1);
}

- (void)_updateLayersUsingScrollViewWithForcedUpdate:(BOOL)a3 dismissSelectionMenu:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  id v19;

  v4 = a4;
  v5 = a3;
  -[AKOverlayView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AKOverlayView observedScrollView](self, "observedScrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isZooming");

    v10 = v9 | -[AKOverlayView scrollViewIsInLiveMagnify](self, "scrollViewIsInLiveMagnify");
    -[AKOverlayView observedScrollView](self, "observedScrollView");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = 1.0;
    if (v11)
    {
      v13 = (void *)v11;
      -[AKOverlayView observedScrollView](self, "observedScrollView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "window");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[AKOverlayView observedScrollView](self, "observedScrollView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "zoomScale");
        v12 = v17;

      }
    }
    -[AKOverlayView pageController](self, "pageController");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    objc_msgSend(v19, "updateScaleFactor:isLiveUpdate:forceUpdate:", v10, v5, v12);
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    if (v4)
    {
      objc_msgSend(v19, "controller");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "hideSelectionMenu:", 0);

    }
  }
}

- (void)_setupObservation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  if (!-[AKOverlayView isObserving](self, "isObserving"))
  {
    -[AKOverlayView setIsObserving:](self, "setIsObserving:", 1);
    -[AKOverlayView _startObservingAnnotationEventHandlers](self, "_startObservingAnnotationEventHandlers");
    -[UIView akEnclosingScrollView](self, "akEnclosingScrollView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKOverlayView setObservedScrollView:](self, "setObservedScrollView:", v3);

    -[AKOverlayView observedScrollView](self, "observedScrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[AKOverlayView observedScrollView](self, "observedScrollView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("contentSize"), 3, CFSTR("AKOverlayView.contentViewContentSizeObservationContext"));

      -[AKOverlayView addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, CFSTR("pageController.controller.annotationEditingEnabled"), 0, CFSTR("AKOverlayView.controllerAnnotationEditingContext"));
      -[AKOverlayView addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, CFSTR("pageController.controller.formFillingEnabled"), 0, CFSTR("AKOverlayView.controllerFormFillingContext"));
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKOverlayView observedScrollView](self, "observedScrollView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__willStartLiveMagnify_, CFSTR("UITextSelectionWillZoom"), v7);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKOverlayView observedScrollView](self, "observedScrollView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__willEndLiveMagnify_, CFSTR("UITextSelectionDidZoom"), v9);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *MEMORY[0x24BDF81B0];
      -[AKOverlayView observedScrollView](self, "observedScrollView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__scrollViewDidEndDragging_, v11, v12);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *MEMORY[0x24BDF81A8];
      -[AKOverlayView observedScrollView](self, "observedScrollView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__scrollViewDidEndDecelerating_, v14, v15);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKOverlayView observedScrollView](self, "observedScrollView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObserver:selector:name:object:", self, sel__scrollViewDidEndAnimation_, CFSTR("_UIScrollViewAnimationEndedNotification"), v17);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKOverlayView observedScrollView](self, "observedScrollView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObserver:selector:name:object:", self, sel__scrollViewDidScrollToTop_, CFSTR("AKScrollViewDidScrollToTopNotification"), v19);

      -[AKOverlayView observedScrollView](self, "observedScrollView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObserver:forKeyPath:options:context:", self, CFSTR("frame"), 3, CFSTR("AKOverlayView.overlayViewSizeObservationContext"));

      -[AKOverlayView observedScrollView](self, "observedScrollView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObserver:forKeyPath:options:context:", self, CFSTR("bounds"), 3, CFSTR("AKOverlayView.overlayViewSizeObservationContext"));

      -[AKOverlayView addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, CFSTR("frame"), 3, CFSTR("AKOverlayView.overlayViewSizeObservationContext"));
      -[AKOverlayView addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, CFSTR("bounds"), 3, CFSTR("AKOverlayView.overlayViewSizeObservationContext"));
    }
    else
    {
      NSLog(CFSTR("Couldn't find an enclosing scroll view. Automatic layer updates disabled."));
    }
  }
}

- (void)_teardownObservation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  if (-[AKOverlayView isObserving](self, "isObserving"))
  {
    -[AKOverlayView setIsObserving:](self, "setIsObserving:", 0);
    -[AKOverlayView _stopObservingAnnotationEventHandlers](self, "_stopObservingAnnotationEventHandlers");
    -[AKOverlayView observedScrollView](self, "observedScrollView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[AKOverlayView observedScrollView](self, "observedScrollView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("contentSize"), CFSTR("AKOverlayView.contentViewContentSizeObservationContext"));

      -[AKOverlayView removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("pageController.controller.annotationEditingEnabled"), CFSTR("AKOverlayView.controllerAnnotationEditingContext"));
      -[AKOverlayView removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("pageController.controller.formFillingEnabled"), CFSTR("AKOverlayView.controllerFormFillingContext"));
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKOverlayView observedScrollView](self, "observedScrollView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UITextSelectionWillZoom"), v6);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKOverlayView observedScrollView](self, "observedScrollView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("UITextSelectionDidZoom"), v8);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *MEMORY[0x24BDF81B0];
      -[AKOverlayView observedScrollView](self, "observedScrollView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObserver:name:object:", self, v10, v11);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x24BDF81A8];
      -[AKOverlayView observedScrollView](self, "observedScrollView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObserver:name:object:", self, v13, v14);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKOverlayView observedScrollView](self, "observedScrollView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObserver:name:object:", self, CFSTR("_UIScrollViewAnimationEndedNotification"), v16);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKOverlayView observedScrollView](self, "observedScrollView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeObserver:name:object:", self, CFSTR("AKScrollViewDidScrollToTopNotification"), v18);

      -[AKOverlayView observedScrollView](self, "observedScrollView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeObserver:forKeyPath:context:", self, CFSTR("frame"), CFSTR("AKOverlayView.overlayViewSizeObservationContext"));

      -[AKOverlayView observedScrollView](self, "observedScrollView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeObserver:forKeyPath:context:", self, CFSTR("bounds"), CFSTR("AKOverlayView.overlayViewSizeObservationContext"));

      -[AKOverlayView removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("frame"), CFSTR("AKOverlayView.overlayViewSizeObservationContext"));
      -[AKOverlayView removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("bounds"), CFSTR("AKOverlayView.overlayViewSizeObservationContext"));
      -[AKOverlayView setObservedScrollView:](self, "setObservedScrollView:", 0);
    }
  }
}

- (void)_wasMovedToNewSuperview
{
  id v3;

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[AKOverlayView pageController](self, "pageController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overlayWasAddedToSuperview");
  -[AKOverlayView _setupObservation](self, "_setupObservation");
  -[AKOverlayView _updateLayersUsingScrollView](self, "_updateLayersUsingScrollView");
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

}

- (void)_willStartLiveMagnify:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKOverlayView observedScrollView](self, "observedScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
    -[AKOverlayView setScrollViewIsInLiveMagnify:](self, "setScrollViewIsInLiveMagnify:", 1);
}

- (void)_willEndLiveMagnify:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKOverlayView observedScrollView](self, "observedScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    -[AKOverlayView setScrollViewIsInLiveMagnify:](self, "setScrollViewIsInLiveMagnify:", 0);
    -[AKOverlayView _updateLayersUsingScrollViewWithForcedUpdate:dismissSelectionMenu:](self, "_updateLayersUsingScrollViewWithForcedUpdate:dismissSelectionMenu:", 1, 0);
    -[AKOverlayView _postScrollViewScrollOrMagnifyEndNotification](self, "_postScrollViewScrollOrMagnifyEndNotification");
  }
}

- (void)_scrollViewDidEndDragging:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKOverlayView observedScrollView](self, "observedScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    objc_msgSend(v9, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDF81B8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if ((v8 & 1) == 0)
    {
      -[AKOverlayView _updateLayersUsingScrollViewWithForcedUpdate:](self, "_updateLayersUsingScrollViewWithForcedUpdate:", 1);
      -[AKOverlayView _postScrollViewScrollOrMagnifyEndNotification](self, "_postScrollViewScrollOrMagnifyEndNotification");
    }
  }

}

- (void)_scrollViewDidEndDecelerating:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKOverlayView observedScrollView](self, "observedScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    -[AKOverlayView _updateLayersUsingScrollViewWithForcedUpdate:](self, "_updateLayersUsingScrollViewWithForcedUpdate:", 1);
    -[AKOverlayView _postScrollViewScrollOrMagnifyEndNotification](self, "_postScrollViewScrollOrMagnifyEndNotification");
  }
}

- (void)_scrollViewDidEndAnimation:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKOverlayView observedScrollView](self, "observedScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    -[AKOverlayView _updateLayersUsingScrollViewWithForcedUpdate:](self, "_updateLayersUsingScrollViewWithForcedUpdate:", 1);
    -[AKOverlayView _postScrollViewScrollOrMagnifyEndNotification](self, "_postScrollViewScrollOrMagnifyEndNotification");
  }
}

- (void)_scrollViewDidScrollToTop:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKOverlayView observedScrollView](self, "observedScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    -[AKOverlayView _updateLayersUsingScrollViewWithForcedUpdate:](self, "_updateLayersUsingScrollViewWithForcedUpdate:", 1);
    -[AKOverlayView _postScrollViewScrollOrMagnifyEndNotification](self, "_postScrollViewScrollOrMagnifyEndNotification");
  }
}

- (CGRect)_findResizeHandleRectAtLocation:(CGPoint)a3 withVisualStyle:(id *)a4
{
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  id v10;
  id v11;
  __int128 v12;
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  CGFloat v28;
  CGFloat v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  double *v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  id v42;
  id v43;
  CGRect result;

  y = a3.y;
  x = a3.x;
  -[AKOverlayView _singleSelectedAnnotation](self, "_singleSelectedAnnotation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[AKOverlayView pageController](self, "pageController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    v43 = 0;
    +[AKAnnotationPointOfInterestHelper pointsOfInterest:withVisualStyle:ofAnnotation:pageControllerForPixelAlignment:](AKAnnotationPointOfInterestHelper, "pointsOfInterest:withVisualStyle:ofAnnotation:pageControllerForPixelAlignment:", &v43, &v42, v8, v9);
    v10 = v43;
    v11 = v42;
    v36 = 0;
    v37 = (double *)&v36;
    v38 = 0x4010000000;
    v39 = &unk_22909F2DD;
    v12 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
    v40 = *MEMORY[0x24BDBF090];
    v41 = v12;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = sub_229052D84;
    v34 = sub_229052D94;
    v35 = 0;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_229052D9C;
    v23[3] = &unk_24F1A8180;
    v13 = v9;
    v24 = v13;
    v14 = v11;
    v28 = x;
    v29 = y;
    v25 = v14;
    v26 = &v36;
    v27 = &v30;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v23);
    if (a4)
      *a4 = objc_retainAutorelease((id)v31[5]);
    v15 = v37[4];
    v16 = v37[5];
    v17 = v37[6];
    v18 = v37[7];

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v36, 8);

  }
  else
  {
    v15 = *MEMORY[0x24BDBF070];
    v16 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v17 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v18 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }

  v19 = v15;
  v20 = v16;
  v21 = v17;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (BOOL)_hasResizeHandleAtLocation:(CGPoint)a3
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  id v11;
  BOOL v12;
  id v14;
  CGRect v15;

  v14 = 0;
  -[AKOverlayView _findResizeHandleRectAtLocation:withVisualStyle:](self, "_findResizeHandleRectAtLocation:withVisualStyle:", &v14, a3.x, a3.y);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = v14;
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  v12 = 0;
  if (!CGRectIsEmpty(v15) && v11)
    v12 = (unint64_t)objc_msgSend(v11, "integerValue") < 2;

  return v12;
}

- (id)_liftOffHandleViewInFrame:(CGRect)a3 withPointStyle:(unint64_t)a4
{
  void *v4;
  double height;
  double width;
  double y;
  double x;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double MidX;
  CGRect v23;
  CGRect v24;

  if (a4 <= 1)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    -[AKOverlayView _singleSelectedAnnotation](self, "_singleSelectedAnnotation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[AKOverlayView pageController](self, "pageController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "layerPresentationManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "adornmentLayerForAnnotation:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v14, "handleSublayerWithStyle:", a4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", x, y, width, height);
        objc_msgSend(v4, "layer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addSublayer:", v15);

        objc_msgSend(v4, "bounds");
        v17 = v23.origin.x;
        v18 = v23.origin.y;
        v19 = v23.size.width;
        v20 = v23.size.height;
        MidX = CGRectGetMidX(v23);
        v24.origin.x = v17;
        v24.origin.y = v18;
        v24.size.width = v19;
        v24.size.height = v20;
        objc_msgSend(v15, "setPosition:", MidX, CGRectGetMidY(v24));

      }
      else
      {
        v4 = 0;
      }

    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_liftOffHandleViewForRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AKOverlayView pointerRegionToHandleViewDict](self, "pointerRegionToHandleViewDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_addLiftOffHandleViewForRegion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    v14 = v4;
    -[AKOverlayView pointerRegionToHandleViewDict](self, "pointerRegionToHandleViewDict");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      -[AKOverlayView setPointerRegionToHandleViewDict:](self, "setPointerRegionToHandleViewDict:", v6);

    }
    -[AKOverlayView pointerRegionToHandleViewDict](self, "pointerRegionToHandleViewDict");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(v14, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = objc_msgSend(v9, "integerValue");
        if (v11 <= 1)
        {
          v12 = v11;
          objc_msgSend(v14, "rect");
          -[AKOverlayView _liftOffHandleViewInFrame:withPointStyle:](self, "_liftOffHandleViewInFrame:withPointStyle:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            -[AKOverlayView addSubview:](self, "addSubview:", v13);
            objc_msgSend(v7, "setObject:forKey:", v13, v14);
          }

        }
      }

    }
    v4 = v14;
  }

}

- (void)_removeAllLiftOffHandleViews
{
  void *v2;
  id v3;

  -[AKOverlayView pointerRegionToHandleViewDict](self, "pointerRegionToHandleViewDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &unk_24F1A81C0);
    objc_msgSend(v3, "removeAllObjects");
    v2 = v3;
  }

}

- (void)_removeLiftOffHandleViewForRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    -[AKOverlayView pointerRegionToHandleViewDict](self, "pointerRegionToHandleViewDict");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "removeFromSuperview");
      objc_msgSend(v5, "removeObjectForKey:", v8);
    }

    v4 = v8;
  }

}

- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  double y;
  double x;
  _BOOL4 v7;

  y = a4.y;
  x = a4.x;
  v7 = -[AKOverlayView _isEditingTextBoxAnnotation](self, "_isEditingTextBoxAnnotation", a3);
  if (v7)
    LOBYTE(v7) = !-[AKOverlayView _hasResizeHandleAtLocation:](self, "_hasResizeHandleAtLocation:", x, y);
  return v7;
}

- (BOOL)_isEditingTextBoxAnnotation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[AKOverlayView pageController](self, "pageController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "annotationEditingEnabled"))
  {
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
    objc_msgSend(v3, "modelController", 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allSelectedAnnotations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = 0;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v7 = 1;
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
      LOBYTE(v6) = v7 & 1;
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (UIEdgeInsets)_scribbleInteraction:(id)a3 hitToleranceInsetsForElement:(id)a4 defaultInsets:(UIEdgeInsets)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v5 = a5.top + -30.0;
  v6 = a5.bottom + -30.0;
  v7 = a5.left + -100.0;
  v8 = a5.right + -100.0;
  result.right = v8;
  result.bottom = v6;
  result.left = v7;
  result.top = v5;
  return result;
}

- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  void (**v6)(id, void *, uint64_t);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *, uint64_t))a5;
  -[AKOverlayView pageController](self, "pageController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "textEditorController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "annotation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "annotationEditingEnabled"))
  {
    v22 = v9;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v8, "modelController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allSelectedAnnotations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v17);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v18, "editingDisabled") & 1) == 0)
          {
            objc_msgSend(v18, "UUID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v19);

          }
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v15);
    }

    v9 = v22;
  }
  if (v10)
  {
    objc_msgSend(v10, "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v11, "indexOfObject:", v20);

  }
  else
  {
    v21 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v6[2](v6, v11, v21);

}

- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
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
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;
  CGRect result;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[AKOverlayView pageController](self, "pageController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDBF070];
  v9 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v10 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v11 = *(double *)(MEMORY[0x24BDBF070] + 24);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v7, "modelController", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allSelectedAnnotations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v18, "UUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqual:", v5);

        if (v20)
        {
          objc_msgSend(v18, "hitTestBounds");
          v8 = v21;
          v9 = v22;
          v10 = v23;
          v11 = v24;
          goto LABEL_11;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_11:

  v39.origin.x = v8;
  v39.origin.y = v9;
  v39.size.width = v10;
  v39.size.height = v11;
  if (!CGRectIsNull(v39))
  {
    objc_msgSend(v6, "convertRectFromModelToOverlay:", v8, v9, v10, v11);
    v8 = v25;
    v9 = v26;
    v10 = v27;
    v11 = v28;
  }

  v29 = v8;
  v30 = v9;
  v31 = v10;
  v32 = v11;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(id, void *))a6;
  -[AKOverlayView pageController](self, "pageController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "controller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v11, "modelController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allSelectedAnnotations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v14)
  {
    v15 = v14;
    v23 = v10;
    v16 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v18, "UUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqual:", v8);

        if (v20)
        {
          objc_msgSend(v11, "textEditorController");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v23;
          if ((objc_msgSend(v22, "isEditing") & 1) == 0)
            objc_msgSend(v22, "beginEditingAnnotation:withPageController:selectAllText:withPencil:", v18, v23, 0, 1);
          objc_msgSend(v22, "textView");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_14;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v15)
        continue;
      break;
    }
    v21 = 0;
    v10 = v23;
  }
  else
  {
    v21 = 0;
  }
LABEL_14:

  v9[2](v9, v21);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  void *v18;
  id v20;
  CGRect v21;

  v7 = a5;
  objc_msgSend(a4, "location");
  v20 = 0;
  -[AKOverlayView _findResizeHandleRectAtLocation:withVisualStyle:](self, "_findResizeHandleRectAtLocation:withVisualStyle:", &v20);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = v20;
  v21.origin.x = v9;
  v21.origin.y = v11;
  v21.size.width = v13;
  v21.size.height = v15;
  if (CGRectIsEmpty(v21))
  {
    v17 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6C88], "regionWithRect:identifier:", v16, v9, v11, v13, v15);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  return v18;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  if (a4)
    MEMORY[0x24BEDD108](self, sel__addLiftOffHandleViewForRegion_);
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[AKOverlayView _liftOffHandleViewForRegion:](self, "_liftOffHandleViewForRegion:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_229053CB8;
    v12[3] = &unk_24F1A81E8;
    objc_copyWeak(&v14, &location);
    v13 = v9;
    objc_msgSend(v10, "addCompletion:", v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD *v29;
  _QWORD v31[4];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (unint64_t)objc_msgSend(v6, "integerValue") <= 1)
  {
    -[AKOverlayView _singleSelectedAnnotation](self, "_singleSelectedAnnotation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[AKOverlayView pageController](self, "pageController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "rect");
      +[AKGeometryHelper centerOfRect:](AKGeometryHelper, "centerOfRect:");
      objc_msgSend(v10, "convertPointFromOverlayToModel:");
      v12 = v11;
      v14 = v13;
      objc_msgSend(v10, "currentModelToScreenScaleFactor");
      v16 = +[AKAnnotationPointOfInterestHelper draggableAreaForPoint:onAnnotation:withScale:pageControllerForPixelAlignment:](AKAnnotationPointOfInterestHelper, "draggableAreaForPoint:onAnnotation:withScale:pageControllerForPixelAlignment:", v9, v10, v12, v14, v15);
      objc_msgSend(MEMORY[0x24BDF6C98], "hiddenPointerStyle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        -[AKOverlayView _liftOffHandleViewForRegion:](self, "_liftOffHandleViewForRegion:", v5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E90]), "initWithView:", v17);
          objc_msgSend(MEMORY[0x24BDF6C70], "effectWithPreview:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDF6C98], "styleWithEffect:shape:", v19, 0);
          v20 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v20;
        }

        if (v16 <= 8)
        {
          v21 = objc_msgSend(v9, "conformsToAKRotatableAnnotationProtocol");
          v22 = 0.0;
          if (v21)
            objc_msgSend(v9, "rotationAngle", 0.0);
          v16 = (((_BYTE)v16 + vcvtad_u64_f64(v22 / 0.785398163) - 1) & 7) + 1;
        }
        switch(v16)
        {
          case 1uLL:
          case 5uLL:
            objc_msgSend(MEMORY[0x24BDF6C68], "arrowAccessoryWithPosition:", *MEMORY[0x24BDF7C30], *(double *)(MEMORY[0x24BDF7C30] + 8));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v35[0] = v23;
            objc_msgSend(MEMORY[0x24BDF6C68], "arrowAccessoryWithPosition:", *MEMORY[0x24BDF7C60], *(double *)(MEMORY[0x24BDF7C60] + 8));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v35[1] = v24;
            v28 = (void *)MEMORY[0x24BDBCE30];
            v29 = v35;
            goto LABEL_19;
          case 2uLL:
          case 6uLL:
            objc_msgSend(MEMORY[0x24BDF6C68], "arrowAccessoryWithPosition:", *MEMORY[0x24BDF7C50], *(double *)(MEMORY[0x24BDF7C50] + 8));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v34[0] = v23;
            objc_msgSend(MEMORY[0x24BDF6C68], "arrowAccessoryWithPosition:", *MEMORY[0x24BDF7C28], *(double *)(MEMORY[0x24BDF7C28] + 8));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v34[1] = v24;
            v28 = (void *)MEMORY[0x24BDBCE30];
            v29 = v34;
            goto LABEL_19;
          case 3uLL:
          case 7uLL:
          case 0x12uLL:
          case 0x13uLL:
            objc_msgSend(MEMORY[0x24BDF6C68], "arrowAccessoryWithPosition:", *MEMORY[0x24BDF7C58], *(double *)(MEMORY[0x24BDF7C58] + 8));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v33[0] = v23;
            objc_msgSend(MEMORY[0x24BDF6C68], "arrowAccessoryWithPosition:", *MEMORY[0x24BDF7C38], *(double *)(MEMORY[0x24BDF7C38] + 8));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v33[1] = v24;
            v28 = (void *)MEMORY[0x24BDBCE30];
            v29 = v33;
            goto LABEL_19;
          case 4uLL:
          case 8uLL:
            objc_msgSend(MEMORY[0x24BDF6C68], "arrowAccessoryWithPosition:", *MEMORY[0x24BDF7C40], *(double *)(MEMORY[0x24BDF7C40] + 8));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v32[0] = v23;
            objc_msgSend(MEMORY[0x24BDF6C68], "arrowAccessoryWithPosition:", *MEMORY[0x24BDF7C48], *(double *)(MEMORY[0x24BDF7C48] + 8));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v32[1] = v24;
            v28 = (void *)MEMORY[0x24BDBCE30];
            v29 = v32;
LABEL_19:
            objc_msgSend(v28, "arrayWithObjects:count:", v29, 2);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setAccessories:", v25);
            goto LABEL_20;
          case 9uLL:
          case 0xAuLL:
          case 0xBuLL:
          case 0xEuLL:
          case 0xFuLL:
            objc_msgSend(MEMORY[0x24BDF6C68], "arrowAccessoryWithPosition:", *MEMORY[0x24BDF7C50], *(double *)(MEMORY[0x24BDF7C50] + 8));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v31[0] = v23;
            objc_msgSend(MEMORY[0x24BDF6C68], "arrowAccessoryWithPosition:", *MEMORY[0x24BDF7C28], *(double *)(MEMORY[0x24BDF7C28] + 8));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v31[1] = v24;
            objc_msgSend(MEMORY[0x24BDF6C68], "arrowAccessoryWithPosition:", *MEMORY[0x24BDF7C40], *(double *)(MEMORY[0x24BDF7C40] + 8));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v31[2] = v25;
            objc_msgSend(MEMORY[0x24BDF6C68], "arrowAccessoryWithPosition:", *MEMORY[0x24BDF7C48], *(double *)(MEMORY[0x24BDF7C48] + 8));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v31[3] = v26;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 4);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setAccessories:", v27);

LABEL_20:
            break;
          default:
            break;
        }
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (AKPageController)pageController
{
  return (AKPageController *)objc_loadWeakRetained((id *)&self->_pageController);
}

- (void)setPageController:(id)a3
{
  objc_storeWeak((id *)&self->_pageController, a3);
}

- (AKMainEventHandler)mainEventHandler
{
  return (AKMainEventHandler *)objc_loadWeakRetained((id *)&self->_mainEventHandler);
}

- (void)setMainEventHandler:(id)a3
{
  objc_storeWeak((id *)&self->_mainEventHandler, a3);
}

- (BOOL)isObserving
{
  return self->_isObserving;
}

- (void)setIsObserving:(BOOL)a3
{
  self->_isObserving = a3;
}

- (BOOL)deferWasMovedToSuperviewUntilMoveToWindow
{
  return self->_deferWasMovedToSuperviewUntilMoveToWindow;
}

- (void)setDeferWasMovedToSuperviewUntilMoveToWindow:(BOOL)a3
{
  self->_deferWasMovedToSuperviewUntilMoveToWindow = a3;
}

- (UIScrollView)observedScrollView
{
  return (UIScrollView *)objc_getProperty(self, a2, 440, 1);
}

- (void)setObservedScrollView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (BOOL)scrollViewIsInLiveMagnify
{
  return self->_scrollViewIsInLiveMagnify;
}

- (void)setScrollViewIsInLiveMagnify:(BOOL)a3
{
  self->_scrollViewIsInLiveMagnify = a3;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_pointerInteraction, a3);
}

- (NSMutableDictionary)pointerRegionToHandleViewDict
{
  return self->_pointerRegionToHandleViewDict;
}

- (void)setPointerRegionToHandleViewDict:(id)a3
{
  objc_storeStrong((id *)&self->_pointerRegionToHandleViewDict, a3);
}

- (BOOL)isObservingEventHandling
{
  return self->_isObservingEventHandling;
}

- (void)setIsObservingEventHandling:(BOOL)a3
{
  self->_isObservingEventHandling = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerRegionToHandleViewDict, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_observedScrollView, 0);
  objc_destroyWeak((id *)&self->_mainEventHandler);
  objc_destroyWeak((id *)&self->_pageController);
}

@end
