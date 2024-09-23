@implementation _SSSScreenshotAnnotationController

- (_SSSScreenshotAnnotationController)init
{
  _SSSScreenshotAnnotationController *v2;
  _SSSScreenshotAnnotationControllerAKOverlayContainerView *v3;
  _SSSScreenshotAnnotationControllerAKOverlayContainerView *overlayView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SSSScreenshotAnnotationController;
  v2 = -[_SSSScreenshotAnnotationController init](&v6, "init");
  v3 = objc_alloc_init(_SSSScreenshotAnnotationControllerAKOverlayContainerView);
  overlayView = v2->_overlayView;
  v2->_overlayView = v3;

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  if (v3)
  {
    if (-[_SSSScreenshotAnnotationController _isEditingScreenshotImage](self, "_isEditingScreenshotImage")
      && objc_msgSend(v3, "isOverlayViewLoadedAtIndex:", 0))
    {
      objc_msgSend(v3, "relinquishOverlayAtIndex:", 0);
    }
    -[_SSSScreenshotAnnotationController setAnnotationKitController:](self, "setAnnotationKitController:", 0);
  }

  v4.receiver = self;
  v4.super_class = (Class)_SSSScreenshotAnnotationController;
  -[_SSSScreenshotAnnotationController dealloc](&v4, "dealloc");
}

- (BOOL)_isEditingScreenshotImage
{
  return -[_SSSScreenshotContentOverlayController viewState](self, "viewState") == 0;
}

- (id)pageModelController
{
  AKPageModelController *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (-[_SSSScreenshotAnnotationController _isEditingScreenshotImage](self, "_isEditingScreenshotImage"))
  {
    v3 = self->_pageModelController;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "modelController"));
    -[_SSSScreenshotContentOverlayController viewState](self, "viewState");
    v3 = (AKPageModelController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pageModelControllerForPage:", v6));

  }
  return v3;
}

- (void)setAnnotationKitController:(id)a3
{
  -[_SSSScreenshotAnnotationController setAnnotationKitController:didAllocate:](self, "setAnnotationKitController:didAllocate:", a3, 0);
}

- (void)setAnnotationKitController:(id)a3 didAllocate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v4 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  v8 = v7;
  if (v7 != v6)
  {
    if (self->_shouldTeardownAnnotationController)
    {
      objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CFSTR("modifiedImageDescription"), off_1000ACA70);
      objc_msgSend(v8, "teardown");
    }
    v9.receiver = self;
    v9.super_class = (Class)_SSSScreenshotAnnotationController;
    -[_SSSScreenshotContentOverlayController setAnnotationKitController:](&v9, "setAnnotationKitController:", v6);
    self->_shouldTeardownAnnotationController = v4;
    if (v6 && v4)
      objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("modifiedImageDescription"), 1, off_1000ACA70);
  }

}

- (void)_prepareAKController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  AKPageModelController *v12;
  AKPageModelController *pageModelController;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _SSSScreenshotAnnotationControllerAKOverlayContainerView *overlayView;
  void *v20;
  void *v21;
  void *v22;
  void **v23;
  uint64_t v24;
  Class (*v25)(uint64_t);
  void *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));

  if (v3)
    -[_SSSScreenshotAnnotationController setAnnotationKitController:](self, "setAnnotationKitController:", 0);
  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v4 = (void *)qword_1000AD7C0;
  v31 = qword_1000AD7C0;
  if (!qword_1000AD7C0)
  {
    v23 = _NSConcreteStackBlock;
    v24 = 3221225472;
    v25 = sub_100037E14;
    v26 = &unk_100091848;
    v27 = &v28;
    sub_100037E14((uint64_t)&v23);
    v4 = (void *)v29[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v28, 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "controllerWithDelegate:", self));
  -[_SSSScreenshotAnnotationController setAnnotationKitController:didAllocate:](self, "setAnnotationKitController:didAllocate:", v6, 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  objc_msgSend(v7, "setAnnotationEditingEnabled:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  objc_msgSend(v8, "setPencilAlwaysDraws:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  objc_msgSend(v9, "setUseHighVisibilityDefaultInks:", 1);

  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v10 = (void *)qword_1000AD7D0;
  v31 = qword_1000AD7D0;
  if (!qword_1000AD7D0)
  {
    v23 = _NSConcreteStackBlock;
    v24 = 3221225472;
    v25 = sub_100037F18;
    v26 = &unk_100091848;
    v27 = &v28;
    sub_100037F18((uint64_t)&v23);
    v10 = (void *)v29[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v28, 8);
  v12 = (AKPageModelController *)objc_alloc_init(v11);
  pageModelController = self->_pageModelController;
  self->_pageModelController = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "modelController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mutableArrayValueForKey:", CFSTR("pageModelControllers")));
  objc_msgSend(v16, "addObject:", self->_pageModelController);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  objc_msgSend(v17, "setCurrentPageIndex:", 0);

  -[_SSSScreenshotAnnotationController _enableInkingOnAKController:](self, "_enableInkingOnAKController:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  objc_msgSend(v18, "prepareOverlayAtIndex:", 0);

  overlayView = self->_overlayView;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "overlayViewAtIndex:", 0));
  -[_SSSScreenshotAnnotationControllerAKOverlayContainerView setManagedView:](overlayView, "setManagedView:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  objc_msgSend(v22, "setRulerHostingDelegate:", self);

}

- (void)_enableInkingOnAKController:(BOOL)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController", a3));
  objc_msgSend(v3, "setToolMode:", 4);

}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  void *v7;
  _SSSScreenshotAnnotationControllerAKOverlayContainerView *overlayView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v3 = a3;
  if (-[_SSSScreenshotContentOverlayController active](self, "active") != a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));

    if (v5)
    {
      v14.receiver = self;
      v14.super_class = (Class)_SSSScreenshotAnnotationController;
      -[_SSSScreenshotContentOverlayController setActive:](&v14, "setActive:", v3);
      v6 = -[_SSSScreenshotAnnotationController _isEditingScreenshotImage](self, "_isEditingScreenshotImage");
      if (v3)
      {
        if (v6)
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
          objc_msgSend(v7, "prepareOverlayAtIndex:", 0);

          overlayView = self->_overlayView;
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "overlayViewAtIndex:", 0));
          -[_SSSScreenshotAnnotationControllerAKOverlayContainerView setManagedView:](overlayView, "setManagedView:", v10);

        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
        objc_msgSend(v11, "setRulerHostingDelegate:", self);

        -[_SSSScreenshotAnnotationController _enableInkingOnAKController:](self, "_enableInkingOnAKController:", 1);
      }
      else
      {
        if (v6)
        {
          -[_SSSScreenshotAnnotationControllerAKOverlayContainerView setManagedView:](self->_overlayView, "setManagedView:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
          objc_msgSend(v12, "relinquishOverlayAtIndex:", 0);

        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
        objc_msgSend(v13, "setRulerHostingDelegate:", 0);

      }
    }
  }
}

- (void)setScreenshot:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SSSScreenshotAnnotationController;
  -[_SSSScreenshotContentOverlayController setScreenshot:](&v13, "setScreenshot:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6 = sub_100035D18();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "removeObserver:name:object:", self, v7, 0);

  if (-[_SSSScreenshotAnnotationController _isEditingScreenshotImage](self, "_isEditingScreenshotImage"))
  {
    if ((_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages") & 1) == 0)
      -[_SSSScreenshotAnnotationController _prepareAKController](self, "_prepareAKController");
  }
  else if ((_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotPDFs") & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "representation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "screenshotRepresentationAKControllerForPDF"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v11 = sub_100035D18();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v10, "addObserver:selector:name:object:", self, "handleDrawingGestureRecognizerUpdate:", v12, v9);

    objc_msgSend(v9, "_updateGestureDependencyPriority");
  }

}

- (id)overlayView
{
  _SSSScreenshotAnnotationControllerAKOverlayContainerView *v3;

  if (-[_SSSScreenshotAnnotationController _isEditingScreenshotImage](self, "_isEditingScreenshotImage"))
    v3 = self->_overlayView;
  else
    v3 = 0;
  return v3;
}

- (CGRect)rectToCenterAboveKeyboard
{
  double v2;
  CGFloat x;
  double v4;
  CGFloat y;
  double v6;
  CGFloat width;
  double v8;
  CGFloat height;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  __int128 v32;
  __int128 v33;
  __int128 v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect result;

  v45.receiver = self;
  v45.super_class = (Class)_SSSScreenshotAnnotationController;
  -[_SSSScreenshotContentOverlayController rectToCenterAboveKeyboard](&v45, "rectToCenterAboveKeyboard");
  x = v2;
  y = v4;
  width = v6;
  height = v8;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationController pageModelController](self, "pageModelController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectedAnnotations"));

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        t1.a = 0.0;
        *(_QWORD *)&t1.b = &t1;
        *(_QWORD *)&t1.c = 0x2050000000;
        v16 = (void *)qword_1000AD7E0;
        *(_QWORD *)&t1.d = qword_1000AD7E0;
        if (!qword_1000AD7E0)
        {
          *(_QWORD *)&v40.a = _NSConcreteStackBlock;
          *(_QWORD *)&v40.b = 3221225472;
          *(_QWORD *)&v40.c = sub_100037F6C;
          *(_QWORD *)&v40.d = &unk_100091848;
          *(_QWORD *)&v40.tx = &t1;
          sub_100037F6C((uint64_t)&v40);
          v16 = *(void **)(*(_QWORD *)&t1.b + 24);
        }
        v17 = objc_retainAutorelease(v16);
        _Block_object_dispose(&t1, 8);
        objc_opt_class(v17, v18);
        if ((objc_opt_isKindOfClass(v15, v19) & 1) != 0)
        {
          objc_msgSend(v15, "drawingBounds");
          x = v20;
          y = v21;
          width = v22;
          height = v23;
          goto LABEL_13;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_13:

  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  if (!CGRectIsNull(v47))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController screenshot](self, "screenshot"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "environmentDescription"));
    objc_msgSend(v25, "imagePointSize");
    v27 = v26;

    v35 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v40.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    v33 = *(_OWORD *)&v40.a;
    *(_OWORD *)&v40.c = v35;
    *(_OWORD *)&v40.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    v32 = *(_OWORD *)&v40.tx;
    CGAffineTransformMakeScale(&t2, 1.0, -1.0);
    *(_OWORD *)&t1.a = v33;
    *(_OWORD *)&t1.c = v35;
    *(_OWORD *)&t1.tx = v32;
    CGAffineTransformConcat(&v40, &t1, &t2);
    CGAffineTransformMakeTranslation(&v37, 0.0, v27);
    v36 = v40;
    CGAffineTransformConcat(&t1, &v36, &v37);
    v40 = t1;
    v48.origin.x = x;
    v48.origin.y = y;
    v48.size.width = width;
    v48.size.height = height;
    v49 = CGRectApplyAffineTransform(v48, &t1);
    x = v49.origin.x;
    y = v49.origin.y;
    width = v49.size.width;
    height = v49.size.height;
  }
  v28 = x;
  v29 = y;
  v30 = width;
  v31 = height;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (id)gestureRecognizers
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
  void *v15;
  _QWORD v16[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));

  if (!v3)
    return &__NSArray0__struct;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tapGestureRecognizer"));
  v16[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pressGestureRecognizer"));
  v16[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "doubleTapGestureRecognizer"));
  v16[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "panGestureRecognizer"));
  v16[3] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rotationGestureRecognizer"));
  v16[4] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 5));

  return v13;
}

- (id)tapGestureRecognizer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tapGestureRecognizer"));

  return v3;
}

- (id)doubleTapGestureRecognizer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "doubleTapGestureRecognizer"));

  return v3;
}

- (id)longPressGestureRecognizer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pressGestureRecognizer"));

  return v3;
}

- (id)panGestureRecognizer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "panGestureRecognizer"));

  return v3;
}

- (id)rotationGestureRecognizer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rotationGestureRecognizer"));

  return v3;
}

- (void)setGesturesEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_SSSScreenshotAnnotationController;
  -[_SSSScreenshotContentOverlayController setGesturesEnabled:](&v6, "setGesturesEnabled:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  objc_msgSend(v5, "setAnnotationEditingEnabled:", v3);

}

- (void)updateUndoState
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  objc_msgSend(v3, "validateUndo:", 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  objc_msgSend(v4, "validateRedo:", 0);

}

- (void)logDidEnterEditingWithOverlay
{
  void *v2;
  _QWORD *v3;
  void *v4;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v3 = (_QWORD *)qword_1000AD7E8;
  v9 = qword_1000AD7E8;
  if (!qword_1000AD7E8)
  {
    v4 = (void *)sub_100037E68();
    v3 = dlsym(v4, "AKStatisticsDocumentTypeImage");
    v7[3] = (uint64_t)v3;
    qword_1000AD7E8 = (uint64_t)v3;
  }
  _Block_object_dispose(&v6, 8);
  if (!v3)
  {
    v5 = (_Unwind_Exception *)sub_100057FCC();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  objc_msgSend(v2, "beginLogging:documentType:", CFSTR("screenshotservices"), *v3, v6);

}

- (void)endedEditingWithOverlay
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  objc_msgSend(v2, "endLogging");

}

- (void)_updateAnnotations
{
  -[_SSSScreenshotAnnotationController _updateAnnotationsCreateUndoCommand:](self, "_updateAnnotationsCreateUndoCommand:", 1);
}

- (void)_updateAnnotationsCreateUndoCommand:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v3 = a3;
  if (-[_SSSScreenshotAnnotationController _isEditingScreenshotImage](self, "_isEditingScreenshotImage"))
  {
    v5 = -[_SSSScreenshotContentOverlayController viewState](self, "viewState");
    -[_SSSScreenshotAnnotationController _updateAnnotationsForViewState:createUndoCommand:](self, "_updateAnnotationsForViewState:createUndoCommand:", v5, v6, v3);
    return;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController screenshot](self, "screenshot"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "PDFDocument"));
  v9 = objc_msgSend(v8, "pageCount");

  if ((unint64_t)v9 <= 1 && !v3)
  {
    v22 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController delegate](self, "delegate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController screenshot](self, "screenshot"));
    v11 = v22;
    v12 = v10;
    v13 = 0;
LABEL_14:
    objc_msgSend(v11, "screenshot:didHaveChangeOnPage:", v12, v13);

    return;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController screenshot](self, "screenshot"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "PDFDocument"));
  v16 = objc_msgSend(v15, "pageCount");

  if (v16)
  {
    v17 = 0;
    v18 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      if (-[_SSSScreenshotAnnotationController _updateAnnotationsForViewState:createUndoCommand:](self, "_updateAnnotationsForViewState:createUndoCommand:", -[_SSSScreenshotContentOverlayController viewState](self, "viewState"), v17, v3))
      {
        v18 = v17;
      }
      ++v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController screenshot](self, "screenshot"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "PDFDocument"));
      v21 = objc_msgSend(v20, "pageCount");

    }
    while (v17 < (unint64_t)v21);
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v22 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController delegate](self, "delegate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController screenshot](self, "screenshot"));
      v11 = v22;
      v12 = v10;
      v13 = v18;
      goto LABEL_14;
    }
  }
}

- (BOOL)_updateAnnotationsForViewState:(id)a3
{
  return -[_SSSScreenshotAnnotationController _updateAnnotationsForViewState:createUndoCommand:](self, "_updateAnnotationsForViewState:createUndoCommand:", a3.var0, a3.var1, 1);
}

- (BOOL)_updateAnnotationsForViewState:(id)a3 createUndoCommand:(BOOL)a4
{
  _BOOL4 v4;
  int64_t var1;
  int64_t var0;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  char v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  int64_t v34;
  int64_t v35;
  _BOOL4 v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];

  v4 = a4;
  var1 = a3.var1;
  var0 = a3.var0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "modelController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pageModelControllerForPage:", var1));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController screenshot](self, "screenshot"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewModificationInfoForState:", var0, var1));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "annotations"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[_SSSScreenshotAnnotationController annotationDataFromAnnotations:](_SSSScreenshotAnnotationController, "annotationDataFromAnnotations:", v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "annotationNSDatas"));
    v16 = objc_msgSend(v14, "isEqual:", v15);
    v17 = v16 ^ 1;
    if ((v16 & 1) == 0)
    {
      v30 = v15;
      v31 = v14;
      v32 = v16 ^ 1;
      v33 = v12;
      v34 = var0;
      v35 = var1;
      v36 = v4;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v37 = v10;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "annotations"));
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(_QWORD *)v39 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
            v25 = objc_msgSend(v24, "copy");
            if (v25)
            {
              objc_msgSend(v18, "addObject:", v25);
            }
            else
            {
              v26 = os_log_create("com.apple.screenshotservices", "AnnotationEditing");
              if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
              {
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "displayName"));
                *(_DWORD *)buf = 138412546;
                v43 = v27;
                v44 = 2112;
                v45 = v24;
                _os_log_fault_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "Copied annotation was nil for annotation %@ %@", buf, 0x16u);

              }
            }

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        }
        while (v21);
      }

      v12 = v33;
      objc_msgSend(v33, "setOriginalAnnotations:", v18);
      v14 = v31;
      objc_msgSend(v33, "setAnnotationNSDatas:", v31);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController screenshot](self, "screenshot"));
      objc_msgSend(v28, "promoteViewValueToModelValueForKey:forState:createUndoCommand:", 1, v34, v35, v36);

      v10 = v37;
      v17 = v32;
      v15 = v30;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)annotationDataFromAnnotations:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "dataRepresentation", (_QWORD)v12));
        objc_msgSend(v4, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)annotationsFromAnnotationData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v8);
        v19 = 0;
        v20 = &v19;
        v21 = 0x2050000000;
        v10 = (void *)qword_1000AD7F0;
        v22 = qword_1000AD7F0;
        if (!qword_1000AD7F0)
        {
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_100037FC0;
          v18[3] = &unk_100091848;
          v18[4] = &v19;
          sub_100037FC0((uint64_t)v18);
          v10 = (void *)v20[3];
        }
        v11 = objc_retainAutorelease(v10);
        _Block_object_dispose(&v19, 8);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "annotationWithData:", v9, (_QWORD)v14));
        objc_msgSend(v4, "addObject:", v12);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
    }
    while (v6);
  }

  return v4;
}

- (void)editDetectedForAnnotationController:(id)a3
{
  id v4;

  -[_SSSScreenshotAnnotationController _updateAnnotationsCreateUndoCommand:](self, "_updateAnnotationsCreateUndoCommand:", 0);
  if (-[_SSSScreenshotAnnotationController _isEditingScreenshotImage](self, "_isEditingScreenshotImage"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController delegate](self, "delegate"));
    objc_msgSend(v4, "screenshotDidMakeAnnotationEditOnImage");

  }
}

- (void)editCheckpointReachedForAnnotationController:(id)a3
{
  -[_SSSScreenshotAnnotationController _updateAnnotationsCreateUndoCommand:](self, "_updateAnnotationsCreateUndoCommand:", 0);
}

- (void)penStrokeCompletedForAnnotationController:(id)a3
{
  id v4;

  self->_didDrawPenStroke = 1;
  -[_SSSScreenshotAnnotationController _updateAnnotations](self, "_updateAnnotations", a3);
  if (-[_SSSScreenshotAnnotationController _isEditingScreenshotImage](self, "_isEditingScreenshotImage"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController delegate](self, "delegate"));
    objc_msgSend(v4, "screenshotDidMakeAnnotationEditOnImage");

  }
}

- (CGRect)maxPageRectWithPageIndex:(unint64_t)a3 forAnnotationController:(id)a4
{
  CGFloat y;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double x;
  double v12;
  double v13;
  double v14;
  CGRect result;

  y = CGRectZero.origin.y;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController screenshot](self, "screenshot", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "environmentDescription"));
  objc_msgSend(v6, "imagePointSize");
  v8 = v7;
  v10 = v9;

  x = CGRectZero.origin.x;
  v12 = y;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = x;
  return result;
}

- (CGRect)visibleRectOfOverlayAtPageIndex:(unint64_t)a3 forAnnotationController:(id)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  CGFloat v10;
  CGSize v11;
  CGFloat v12;
  CGFloat v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v21;
  __int128 v22;
  __int128 v23;
  CGSize v24;
  CGRect v25;

  v23 = 0u;
  v24 = (CGSize)0;
  v22 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController screenshot](self, "screenshot", a3, a4));
  v6 = -[_SSSScreenshotContentOverlayController viewState](self, "viewState");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "modelModificationInfoForState:", v6, v7));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "cropInfo");
  }
  else
  {
    v23 = 0u;
    v24 = (CGSize)0;
    v22 = 0u;
  }

  v10 = *((double *)&v23 + 1);
  v11 = v24;
  v13 = *((double *)&v22 + 1);
  v12 = *(double *)&v23;
  v16 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v21.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  v15 = *(_OWORD *)&v21.a;
  *(_OWORD *)&v21.c = v16;
  *(_OWORD *)&v21.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v14 = *(_OWORD *)&v21.tx;
  CGAffineTransformMakeScale(&t2, 1.0, -1.0);
  *(_OWORD *)&t1.a = v15;
  *(_OWORD *)&t1.c = v16;
  *(_OWORD *)&t1.tx = v14;
  CGAffineTransformConcat(&v21, &t1, &t2);
  CGAffineTransformMakeTranslation(&v18, 0.0, v13);
  v17 = v21;
  CGAffineTransformConcat(&t1, &v17, &v18);
  v21 = t1;
  v25.origin.x = v12;
  v25.origin.y = v10;
  v25.size = v11;
  return CGRectApplyAffineTransform(v25, &t1);
}

- (double)modelBaseScaleFactorOfPageAtIndex:(unint64_t)a3 forAnnotationController:(id)a4
{
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationController overlayView](self, "overlayView", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));

  v7 = 1.0;
  if (-[_SSSScreenshotContentOverlayController active](self, "active") && v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationController overlayView](self, "overlayView"));
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationController overlayView](self, "overlayView"));
    objc_msgSend(v6, "convertRect:fromView:", v17, v10, v12, v14, v16);
    v19 = v18;

    objc_msgSend(v6, "bounds");
    if (v19 <= 0.0)
      v7 = 1.0;
    else
      v7 = v20 / v19;
  }

  return v7;
}

- (id)newContentSnapshotPDFDataIncludingAdornments:(BOOL)a3 atScale:(double)a4 inRect:(CGRect)a5 onOverlayAtPageIndex:(unint64_t)a6 forAnnotationController:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  void *v15;
  void *v16;
  id v17;
  CGImage *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  size_t v28;
  size_t v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  size_t v36;
  size_t v37;
  CGColorSpace *ColorSpace;
  CGColorSpace *v39;
  CGColorSpace *v40;
  uint32_t v41;
  CGContextRef v42;
  CGContext *v43;
  CGFloat v44;
  id v45;
  CGImage *Image;
  __CFData *Mutable;
  __CFData *v48;
  CGDataConsumer *v49;
  CGDataConsumer *v50;
  CGContext *v51;
  CGContext *v52;
  double MinY;
  CGFloat v54;
  double v56;
  double sx;
  double sxa;
  CGFloat sxb;
  double v60;
  CGFloat v61;
  CGFloat v62;
  CGRect mediaBox;
  CGAffineTransform v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController screenshot](self, "screenshot"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "imageProvider"));
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "requestCGImageBackedUneditedImageForUIBlocking")));
  v18 = (CGImage *)objc_msgSend(v17, "CGImage");

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "overlayViewAtIndex:", a6));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController screenshot](self, "screenshot"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "environmentDescription"));
  objc_msgSend(v21, "imageScale");
  v23 = v22;

  CGAffineTransformMakeScale(&v64, v23, v23);
  v65.origin.x = x;
  v65.origin.y = y;
  v65.size.width = width;
  v65.size.height = height;
  v66 = CGRectApplyAffineTransform(v65, &v64);
  v24 = v66.origin.x;
  v25 = v66.origin.y;
  v62 = v66.origin.y;
  v26 = v66.size.width;
  v27 = v66.size.height;
  mediaBox.origin = CGPointZero;
  sx = a4;
  mediaBox.size.width = v66.size.width * a4;
  mediaBox.size.height = v66.size.height * a4;
  v28 = CGImageGetWidth(v18);
  v29 = CGImageGetHeight(v18);
  v67.origin.x = v24;
  v67.origin.y = v25;
  v67.size.width = v26;
  v67.size.height = v27;
  v68 = CGRectIntegral(v67);
  v30 = v68.origin.x;
  v31 = v68.origin.y;
  v32 = v68.size.width;
  v33 = v68.size.height;
  v34 = CGRectGetWidth(v68);
  v60 = v30;
  v69.origin.x = v30;
  v69.origin.y = v31;
  v61 = v33;
  v69.size.width = v32;
  v69.size.height = v33;
  v35 = CGRectGetHeight(v69);
  v70.origin.x = v24;
  v70.origin.y = v62;
  v70.size.width = v26;
  v70.size.height = v27;
  if (CGRectIsEmpty(v70))
    goto LABEL_16;
  v56 = v34;
  v36 = vcvtad_u64_f64(v34);
  v37 = vcvtad_u64_f64(v35);
  ColorSpace = CGImageGetColorSpace(v18);
  if (!ColorSpace || (v39 = ColorSpace, CGColorSpaceUsesExtendedRange(ColorSpace)) || CGColorSpaceIsWideGamutRGB(v39))
  {
    v40 = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
    v39 = v40;
  }
  else
  {
    v40 = 0;
  }
  v41 = CGColorSpaceGetNumberOfComponents(v39) != 1;
  v42 = CGBitmapContextCreate(0, v36, v37, 8uLL, 0, v39, v41);
  if (v42)
  {
    v43 = v42;
    v44 = (double)v28;
    v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
    CGContextSetFillColorWithColor(v43, (CGColorRef)objc_msgSend(v45, "CGColor"));

    v71.origin.x = v60;
    v71.origin.y = v31;
    v71.size.width = v32;
    v71.size.height = v61;
    CGContextFillRect(v43, v71);
    CGContextTranslateCTM(v43, -v60, -v31);
    CGContextSetInterpolationQuality(v43, kCGInterpolationNone);
    v72.origin.x = 0.0;
    v72.origin.y = 0.0;
    v72.size.width = v44;
    v72.size.height = (double)v29;
    CGContextDrawImage(v43, v72, v18);
    Image = CGBitmapContextCreateImage(v43);
    CGContextRelease(v43);
    if (!v40)
      goto LABEL_9;
    goto LABEL_8;
  }
  Image = 0;
  if (v40)
LABEL_8:
    CGColorSpaceRelease(v40);
LABEL_9:
  if (!Image)
  {
LABEL_16:
    v48 = 0;
    goto LABEL_17;
  }
  Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
  v48 = Mutable;
  if (Mutable)
  {
    v49 = CGDataConsumerCreateWithCFData(Mutable);
    if (v49)
    {
      v50 = v49;
      v51 = CGPDFContextCreate(v49, &mediaBox, 0);
      if (v51)
      {
        v52 = v51;
        CGPDFContextBeginPage(v51, 0);
        CGContextSaveGState(v52);
        CGContextScaleCTM(v52, sx, sx);
        v73.origin.x = v24;
        v73.origin.y = v62;
        v73.size.width = v26;
        v73.size.height = v27;
        sxa = CGRectGetMinX(v73);
        v74.origin.x = v60;
        v74.origin.y = v31;
        v74.size.width = v32;
        v74.size.height = v61;
        sxb = sxa - CGRectGetMinX(v74);
        v75.origin.x = v24;
        v75.origin.y = v62;
        v75.size.width = v26;
        v75.size.height = v27;
        MinY = CGRectGetMinY(v75);
        v76.origin.x = v60;
        v76.origin.y = v31;
        v76.size.width = v32;
        v76.size.height = v61;
        v54 = CGRectGetMinY(v76);
        CGContextTranslateCTM(v52, -sxb, -(MinY - v54));
        CGContextSetInterpolationQuality(v52, kCGInterpolationNone);
        v77.origin.x = 0.0;
        v77.origin.y = 0.0;
        v77.size.height = (double)(unint64_t)round(v35);
        v77.size.width = (double)(unint64_t)round(v56);
        CGContextDrawImage(v52, v77, Image);
        CGContextRestoreGState(v52);
        CGPDFContextEndPage(v52);
        CGPDFContextClose(v52);
        CGContextRelease(v52);
      }
      CGDataConsumerRelease(v50);
    }
  }
  CGImageRelease(Image);
LABEL_17:

  return v48;
}

- (id)contentSnapshot
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contentSnapshot"));

  return v3;
}

- (id)undoManagerForAnnotationController:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController screenshot](self, "screenshot", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "undoManagerForEditMode:", -[_SSSScreenshotContentOverlayController viewState](self, "viewState")));

  return v5;
}

- (id)popoverPresentingViewControllerForAnnotationController:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController delegate](self, "delegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllerForOverlayPresentations"));

  return v4;
}

- (void)controllerDidDismissPopover:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationController popoverPresentingViewControllerForAnnotationController:](self, "popoverPresentingViewControllerForAnnotationController:", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v3, "setNeedsLayout");

}

- (id)layerContainingQuickBackgroundForLoupeOnOverlayAtPageIndex:(unint64_t)a3 forAnnotationController:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController delegate](self, "delegate", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewContainingScreenshotContents"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));

  return v6;
}

- (void)installDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController delegate](self, "delegate"));
  objc_msgSend(v7, "installInterstitialGesture:", v6);

}

- (void)uninstallDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController delegate](self, "delegate"));
  objc_msgSend(v7, "uninstallInterstitialGesture:", v6);

}

- (void)updateDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 withPriority:(BOOL)a5 forAnnotationController:(id)a6
{
  _BOOL4 v6;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v6 = a5;
  v8 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotAnnotationController gestureRecognizers](self, "gestureRecognizers", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "requireGestureRecognizerToFail:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController delegate](self, "delegate"));
  v15 = v14;
  if (v6)
    objc_msgSend(v14, "requireAllOtherGestureRecognizersToFailBeforeGestureRecognizer:", v8);
  else
    objc_msgSend(v14, "requireGestureRecognizerToFailBeforeAllOtherGestureRecognizers:", v8);

}

- (void)handleDrawingGestureRecognizerUpdate:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("drawingGestureRecognizer")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("highPriority")));
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController delegate](self, "delegate"));
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "requireAllOtherGestureRecognizersToFailBeforeGestureRecognizer:", v4);
  else
    objc_msgSend(v7, "requireGestureRecognizerToFailBeforeAllOtherGestureRecognizers:", v4);

}

- (NSString)originalImageDescription
{
  return 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  objc_super v14;

  if (off_1000ACA70 == a6)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("modifiedImageDescription"), a4, a5))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController screenshot](self, "screenshot"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewModificationInfo"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController annotationKitController](self, "annotationKitController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modifiedImageDescription"));
      objc_msgSend(v8, "setImageDescription:", v10);

      v13 = (id)objc_claimAutoreleasedReturnValue(-[_SSSScreenshotContentOverlayController screenshot](self, "screenshot"));
      v11 = -[_SSSScreenshotContentOverlayController viewState](self, "viewState");
      objc_msgSend(v13, "promoteViewValueToModelValueForKey:forState:createUndoCommand:", 4, v11, v12, 0);

    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_SSSScreenshotAnnotationController;
    -[_SSSScreenshotAnnotationController observeValueForKeyPath:ofObject:change:context:](&v14, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (BOOL)didDrawPenStroke
{
  return self->_didDrawPenStroke;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_pageModelController, 0);
}

@end
