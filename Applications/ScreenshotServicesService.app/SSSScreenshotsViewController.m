@implementation SSSScreenshotsViewController

- (SSSScreenshotsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SSSScreenshotsViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SSSDisplayLinkObserver *v10;
  SSSDisplayLinkObserver *displayLinkObserver;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SSSScreenshotsViewController;
  v4 = -[SSSScreenshotsViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", a3, a4);
  v4->_contentSwitcherAlpha = 1.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", v4, "_screenshotManagerDidProcessMetadataUpdate:", CFSTR("SSSScreenshotManagerDidProcessMetadataUpdate"), 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", v4, "_screenshotManagerDidProcessDocumentUpdate:", CFSTR("SSSScreenshotManagerDidProcessDocumentUpdate"), 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", v4, "_undoManagerDidUndoRedoChange:", NSUndoManagerDidUndoChangeNotification, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "addObserver:selector:name:object:", v4, "_undoManagerDidUndoRedoChange:", NSUndoManagerDidRedoChangeNotification, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "addObserver:selector:name:object:", v4, "_handlePencilSqueezeInteractionWillShowPaletteViewNotification:", PKPencilSqueezeInteractionWillShowPaletteViewNotification, 0);

  v10 = objc_alloc_init(SSSDisplayLinkObserver);
  displayLinkObserver = v4->_displayLinkObserver;
  v4->_displayLinkObserver = v10;

  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SSSScreenshotManagerDidProcessMetadataUpdate"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("SSSScreenshotManagerDidProcessDocumentUpdate"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, NSUndoManagerDidUndoChangeNotification, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, NSUndoManagerDidRedoChangeNotification, 0);

  if (self->_presentationControllerDismissalObserver)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "removeObserver:name:object:", self->_presentationControllerDismissalObserver, UIPresentationControllerDismissalTransitionDidEndNotification, 0);

  }
  v8.receiver = self;
  v8.super_class = (Class)SSSScreenshotsViewController;
  -[SSSScreenshotsViewController dealloc](&v8, "dealloc");
}

- (void)parentScreenshotView:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v6, "parentScreenshotView:animated:", v10, v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_internalPDFView"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_internalPDFView"));
    objc_msgSend(v8, "addObserver:selector:name:object:", self, "_pdfPageChanged:", PDFViewPageChangedNotification, v9);

  }
  -[SSSScreenshotsViewController _updateBarButtonItemPositionsAnimated:](self, "_updateBarButtonItemPositionsAnimated:", v4);

}

- (void)removeScreenshots:(id)a3 forReason:(unint64_t)a4 alongsideAnimations:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  id v22;
  _QWORD *v23;
  id v24;
  id v25;
  _QWORD *v26;
  id v27;
  id v28;
  id *v29;
  id v30;
  _QWORD v31[4];
  _QWORD *v32;
  _QWORD v33[4];
  _QWORD *v34;
  _QWORD v35[4];
  _QWORD *v36;
  _QWORD v37[6];
  _QWORD v38[5];
  id v39;
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  unint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (a4)
  {
    v13 = &__NSArray0__struct;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "viewsForScreenshots:", v10));

  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v20, "setIsBeingRemoved:", 1);
        objc_msgSend(v20, "updatePaletteVisibilityIfNecessary:", 0);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v17);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v21, "layoutIfNeeded");

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100040128;
  v41[3] = &unk_1000928F8;
  v41[4] = self;
  v30 = v10;
  v42 = v30;
  v44 = a4;
  v22 = v11;
  v43 = v22;
  v23 = objc_retainBlock(v41);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10004023C;
  v38[3] = &unk_100091FD8;
  v38[4] = self;
  v24 = v15;
  v39 = v24;
  v25 = v12;
  v40 = v25;
  v26 = objc_retainBlock(v38);
  v27 = objc_msgSend(objc_alloc((Class)UICubicTimingParameters), "initWithControlPoint1:controlPoint2:", 0.289999992, 0.0133330002, 0.816670001, 0.493330002);
  v28 = objc_msgSend(objc_alloc((Class)UIViewPropertyAnimator), "initWithDuration:timingParameters:", v27, 0.21);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100040360;
  v37[3] = &unk_1000919E0;
  v37[4] = self;
  v37[5] = a4;
  objc_msgSend(v28, "addAnimations:", v37);
  objc_msgSend(v28, "startAnimation");
  if (!a4)
  {
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000403E0;
    v35[3] = &unk_100092078;
    v29 = (id *)&v36;
    v36 = v23;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000403EC;
    v33[3] = &unk_1000920F0;
    v34 = v26;
    +[UIView performSystemAnimation:onViews:options:animations:completion:](UIView, "performSystemAnimation:onViews:options:animations:completion:", 0, v24, 4, v35, v33);

    goto LABEL_15;
  }
  if (a4 == 1)
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000403F8;
    v31[3] = &unk_1000920F0;
    v29 = (id *)&v32;
    v32 = v26;
    +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 4, v23, v31);
LABEL_15:

  }
}

- (NSArray)dragItems
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dragItems"));

  return (NSArray *)v3;
}

- (id)previewForDragItem:(id)a3 inContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "previewForDragItem:inContainer:", v7, v6));

  return v9;
}

- (id)targetForCancellingDragItem:(id)a3 inContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "targetForCancellingDragItem:inContainer:", v7, v6));

  return v9;
}

- (NSArray)visibleScreenshots
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "visibleScreenshots"));

  return (NSArray *)v3;
}

- (SSSScreenshot)currentScreenshot
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentScreenshot"));

  return (SSSScreenshot *)v3;
}

- (void)loadView
{
  SSSScreenshotsView *v3;

  v3 = objc_alloc_init(SSSScreenshotsView);
  -[SSSScreenshotsView setDelegate:](v3, "setDelegate:", self);
  -[SSSScreenshotsViewController setView:](self, "setView:", v3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updateForFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v7, "updateForFrame:", x, y, width, height);

}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSSScreenshotsViewController;
  -[SSSScreenshotsViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController imageAnalyzer](self, "imageAnalyzer"));

  if (!v3)
  {
    v4 = objc_alloc_init((Class)VKCImageAnalyzer);
    -[SSSScreenshotsViewController setImageAnalyzer:](self, "setImageAnalyzer:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController imageAnalyzer](self, "imageAnalyzer"));
    objc_msgSend(v5, "setCreateFeedbackProviders:", 1);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController imageAnalyzer](self, "imageAnalyzer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v7, "setImageAnalyzer:", v6);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SSSScreenshotsViewController;
  -[SSSScreenshotsViewController viewDidAppear:](&v11, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_rootSheetPresentationController"));
  objc_msgSend(v6, "_setShouldScaleDownBehindDescendantSheets:", 0);

  -[SSSScreenshotsViewController becomeFirstResponder](self, "becomeFirstResponder");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "windowScene"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[PKPencilSqueezeInteraction _existingInteractionForWindowScene:](PKPencilSqueezeInteraction, "_existingInteractionForWindowScene:", v9));

  objc_msgSend(v10, "set_delegate:", self);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSSScreenshotsViewController;
  -[SSSScreenshotsViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  -[SSSScreenshotsViewController resignFirstResponder](self, "resignFirstResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController presentedViewController](self, "presentedViewController"));

  if (v4)
    -[SSSScreenshotsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canResignFirstResponder
{
  void *v3;
  unsigned __int8 v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v4 = objc_msgSend(v3, "isPerformingFullscreenSetup");

  if ((v4 & 1) != 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)SSSScreenshotsViewController;
  return -[SSSScreenshotsViewController canResignFirstResponder](&v6, "canResignFirstResponder");
}

- (void)_presentUndoRedoAlertControllerIfNecessary
{
  void *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _currentScreenshotView](self, "_currentScreenshotView"));
  v4 = objc_msgSend(v3, "canUndo");
  v5 = objc_msgSend(v3, "canRedo");
  v6 = v5;
  if ((v4 & 1) != 0 || v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIBarButtonItem title](self->_undoItem, "title"));
    v8 = objc_claimAutoreleasedReturnValue(-[UIBarButtonItem title](self->_redoItem, "title"));
    v9 = (void *)v8;
    if (v4)
      v10 = v7;
    else
      v10 = (void *)v8;
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CANCEL_SHAKE_TO_UNDO"), CFSTR("Cancel"), 0));

    objc_initWeak(location, self);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v11, 1));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100040BD8;
    v22[3] = &unk_100092920;
    objc_copyWeak(&v23, location);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 1, v22));
    objc_msgSend(v14, "addAction:", v15);

    if (v4)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100040C04;
      v20[3] = &unk_100092920;
      objc_copyWeak(&v21, location);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v7, 0, v20));
      objc_msgSend(v14, "addAction:", v16);

      objc_destroyWeak(&v21);
    }
    if (v6)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100040C50;
      v18[3] = &unk_100092920;
      objc_copyWeak(&v19, location);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v9, 0, v18));
      objc_msgSend(v14, "addAction:", v17);

      objc_destroyWeak(&v19);
    }
    -[SSSScreenshotsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
    objc_destroyWeak(&v23);

    objc_destroyWeak(location);
  }

}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  unsigned int v9;
  void *v10;
  objc_super v11;
  objc_super v12;

  v6 = a4;
  if (a3 == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _currentScreenshotView](self, "_currentScreenshotView"));
    v8 = objc_msgSend(v7, "canUndo");
    v9 = objc_msgSend(v7, "canRedo");
    if ((v8 & 1) != 0 || v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
      objc_msgSend(v10, "dismissOverlayManagedViewControllers");

      -[SSSScreenshotsViewController _presentUndoRedoAlertControllerIfNecessary](self, "_presentUndoRedoAlertControllerIfNecessary");
    }

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SSSScreenshotsViewController;
    if (-[SSSScreenshotsViewController respondsToSelector:](&v12, "respondsToSelector:", "motionEnded:withEvent:"))
    {
      v11.receiver = self;
      v11.super_class = (Class)SSSScreenshotsViewController;
      -[SSSScreenshotsViewController motionEnded:withEvent:](&v11, "motionEnded:withEvent:", a3, v6);
    }
  }

}

- (BOOL)_pencilSqueezeInteractionCanShowPaletteView:(id)a3
{
  return !-[SSSScreenshotsViewController isShowingModalUI](self, "isShowingModalUI", a3);
}

- (void)setContentSwitcherAlpha:(double)a3
{
  self->_contentSwitcherAlpha = a3;
  -[UIView setAlpha:](self->_contentSwitcherView, "setAlpha:");
}

- (void)_configureBarsIfNecessary
{
  void *v3;
  id v4;

  if (!self->_hasConfiguredBarButtonItems)
  {
    self->_hasConfiguredBarButtonItems = 1;
    -[SSSScreenshotsViewController _configureBarButtonItems](self, "_configureBarButtonItems");
  }
  if (!self->_hasAddedNavigationItemToTopBar)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topBar"));

    if (v4)
    {
      self->_hasAddedNavigationItemToTopBar = 1;
      objc_msgSend(v4, "setAlpha:", 0.0);
      objc_msgSend(v4, "pushNavigationItem:animated:", self->_managedNavigationItem, 0);
      objc_msgSend(v4, "setAlpha:", 1.0);
      -[SSSScreenshotsViewController _updateBarButtonItemPositionsAnimated:](self, "_updateBarButtonItemPositionsAnimated:", 0);
    }

  }
}

- (void)_configureBarButtonItems
{
  UINavigationItem *v3;
  UINavigationItem *managedNavigationItem;
  UIBarButtonItem *v5;
  UIBarButtonItem *shareItem;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  UIBarButtonItem *v11;
  UIBarButtonItem *doneItem;
  UIBarButtonItem *v13;
  UIBarButtonItem *undoItem;
  void *v15;
  void *v16;
  UIBarButtonItem *v17;
  UIBarButtonItem *redoItem;
  void *v19;
  void *v20;
  UIBarButtonItem *v21;
  UIBarButtonItem *deleteItem;
  void *v23;
  void *v24;
  SSVellumOpacityControl *v25;
  SSVellumOpacityControl *opacityControl;
  SSVellumOpacityControl *v27;
  double v28;
  double v29;
  double v30;
  UIBarButtonItem *v31;
  UIBarButtonItem *opacityItem;
  UIBarButtonItem *v33;
  UIBarButtonItem *cropItem;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  UIBarButtonItem *v40;
  UIBarButtonItem *resetCropItem;
  id v42;
  void *v43;
  void *v44;
  UIBarButtonItem *v45;
  UIBarButtonItem *cancelCropItem;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  UISegmentedControl *v53;
  UISegmentedControl *contentSwitcher;
  UIView *v55;
  UIView *contentSwitcherView;
  VKSelectableBarButtonItem *v57;
  VKSelectableBarButtonItem *annotationEnabledButton;
  void *v59;
  void *v60;
  _BOOL4 v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  UIBarButtonItem *v66;
  UIBarButtonItem *visualSearchBarButtonItem;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  UIBarButtonItem *v75;
  UIBarButtonItem *recapItem;
  uint64_t v77;
  _QWORD v78[4];
  id v79;
  id location;
  _QWORD v81[2];

  v3 = (UINavigationItem *)objc_alloc_init((Class)UINavigationItem);
  managedNavigationItem = self->_managedNavigationItem;
  self->_managedNavigationItem = v3;

  v5 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem _sss_shareItemWithTarget:action:](UIBarButtonItem, "_sss_shareItemWithTarget:action:", self));
  shareItem = self->_shareItem;
  self->_shareItem = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SHARE"), CFSTR("Share"), 0));
  -[UIBarButtonItem setTitle:](self->_shareItem, "setTitle:", v8);

  v9 = objc_alloc((Class)UIBarButtonItem);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _buildDoneMenu](self, "_buildDoneMenu"));
  v11 = (UIBarButtonItem *)objc_msgSend(v9, "initWithBarButtonSystemItem:menu:", 0, v10);
  doneItem = self->_doneItem;
  self->_doneItem = v11;

  v13 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem _sss_undoItemWithTarget:action:](UIBarButtonItem, "_sss_undoItemWithTarget:action:", self));
  undoItem = self->_undoItem;
  self->_undoItem = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("UNDO"), CFSTR("Undo"), 0));
  -[UIBarButtonItem setTitle:](self->_undoItem, "setTitle:", v16);

  objc_initWeak(&location, self);
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_100041898;
  v78[3] = &unk_100092948;
  objc_copyWeak(&v79, &location);
  -[UIBarButtonItem _setSecondaryActionsProvider:](self->_undoItem, "_setSecondaryActionsProvider:", v78);
  v17 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem _sss_redoItemWithTarget:action:](UIBarButtonItem, "_sss_redoItemWithTarget:action:", self));
  redoItem = self->_redoItem;
  self->_redoItem = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("REDO"), CFSTR("Redo"), 0));
  -[UIBarButtonItem setTitle:](self->_redoItem, "setTitle:", v20);

  v21 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem _sss_trashItemWithTarget:action:](UIBarButtonItem, "_sss_trashItemWithTarget:action:", self, "_deletePushed"));
  deleteItem = self->_deleteItem;
  self->_deleteItem = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("DELETE"), CFSTR("Delete"), 0));
  -[UIBarButtonItem setTitle:](self->_deleteItem, "setTitle:", v24);

  v25 = (SSVellumOpacityControl *)objc_alloc_init((Class)SSVellumOpacityControl);
  opacityControl = self->_opacityControl;
  self->_opacityControl = v25;

  v27 = self->_opacityControl;
  +[SSVellumOpacityControl preferredWidth](SSVellumOpacityControl, "preferredWidth");
  v29 = v28;
  -[SSVellumOpacityControl intrinsicContentSize](self->_opacityControl, "intrinsicContentSize");
  -[SSVellumOpacityControl setFrame:](v27, "setFrame:", 0.0, 0.0, v29, v30);
  -[SSVellumOpacityControl addTarget:action:forEvents:](self->_opacityControl, "addTarget:action:forEvents:", self, "_opacityControlChanged", 4096);
  -[SSVellumOpacityControl addTarget:action:forEvents:](self->_opacityControl, "addTarget:action:forEvents:", self, "_opacityControlLifted", 64);
  -[SSVellumOpacityControl addTarget:action:forEvents:](self->_opacityControl, "addTarget:action:forEvents:", self, "_opacityControlLifted", 128);
  v31 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", self->_opacityControl);
  opacityItem = self->_opacityItem;
  self->_opacityItem = v31;

  v33 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem _sss_cropItemWithTarget:action:](UIBarButtonItem, "_sss_cropItemWithTarget:action:", self, "_enterCrop"));
  cropItem = self->_cropItem;
  self->_cropItem = v33;

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("CROP"), CFSTR("Crop"), 0));
  -[UIBarButtonItem setTitle:](self->_cropItem, "setTitle:", v36);

  v37 = objc_alloc((Class)UIBarButtonItem);
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("RESET"), CFSTR("Reset"), 0));
  v40 = (UIBarButtonItem *)objc_msgSend(v37, "initWithTitle:style:target:action:", v39, 0, self, "_resetCrop");
  resetCropItem = self->_resetCropItem;
  self->_resetCropItem = v40;

  v42 = objc_alloc((Class)UIBarButtonItem);
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("CANCEL"), CFSTR("Cancel"), 0));
  v45 = (UIBarButtonItem *)objc_msgSend(v42, "initWithTitle:style:target:action:", v44, 0, self, "_cancelCrop");
  cancelCropItem = self->_cancelCropItem;
  self->_cancelCropItem = v45;

  v47 = objc_alloc((Class)UISegmentedControl);
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("SCREEN"), CFSTR("Screen"), 0));
  v81[0] = v49;
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("FULL_PAGE"), CFSTR("Full Page"), 0));
  v81[1] = v51;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v81, 2));
  v53 = (UISegmentedControl *)objc_msgSend(v47, "initWithItems:", v52);
  contentSwitcher = self->_contentSwitcher;
  self->_contentSwitcher = v53;

  -[UISegmentedControl addTarget:action:forControlEvents:](self->_contentSwitcher, "addTarget:action:forControlEvents:", self, "_selectScreenshotOrFull:", 4096);
  -[UISegmentedControl setSelectedSegmentIndex:](self->_contentSwitcher, "setSelectedSegmentIndex:", 0);
  -[UISegmentedControl setOverrideUserInterfaceStyle:](self->_contentSwitcher, "setOverrideUserInterfaceStyle:", 2);
  v55 = (UIView *)objc_alloc_init((Class)UIView);
  contentSwitcherView = self->_contentSwitcherView;
  self->_contentSwitcherView = v55;

  -[UIView addSubview:](self->_contentSwitcherView, "addSubview:", self->_contentSwitcher);
  -[UIView setAlpha:](self->_contentSwitcherView, "setAlpha:", self->_contentSwitcherAlpha);
  v57 = (VKSelectableBarButtonItem *)objc_alloc_init((Class)VKSelectableBarButtonItem);
  annotationEnabledButton = self->_annotationEnabledButton;
  self->_annotationEnabledButton = v57;

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v59, "horizontalSizeClass") == (id)1)
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController traitCollection](self, "traitCollection"));
    v61 = objc_msgSend(v60, "verticalSizeClass") == (id)1;

  }
  else
  {
    v61 = 0;
  }

  v62 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("pencil.tip.crop.circle")));
  if (v61)
    v63 = 2;
  else
    v63 = 3;
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", UIFontTextStyleBody, v63, 112));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "imageWithSymbolConfiguration:", v64));
  -[VKSelectableBarButtonItem setImage:](self->_annotationEnabledButton, "setImage:", v65);

  -[VKSelectableBarButtonItem setTarget:](self->_annotationEnabledButton, "setTarget:", self);
  -[VKSelectableBarButtonItem setAction:](self->_annotationEnabledButton, "setAction:", "annotationButtonPressed:");
  v66 = (UIBarButtonItem *)objc_alloc_init((Class)UIBarButtonItem);
  visualSearchBarButtonItem = self->_visualSearchBarButtonItem;
  self->_visualSearchBarButtonItem = v66;

  v68 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("info.circle.and.sparkles")));
  -[UIBarButtonItem setImage:](self->_visualSearchBarButtonItem, "setImage:", v68);

  -[UIBarButtonItem setTarget:](self->_visualSearchBarButtonItem, "setTarget:", self);
  -[UIBarButtonItem setAction:](self->_visualSearchBarButtonItem, "setAction:", "viButtonPressed:");
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v69, "setShareItemTarget:", self);

  v70 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v70, "setShareItemAction:", "_sharePushed:");

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v71, "setUndoItemTarget:", self);

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v72, "setUndoItemAction:", "_undoPushed");

  v73 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v73, "setRedoItemTarget:", self);

  v74 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v74, "setRedoItemAction:", "_redoPushed");

  -[UIBarButtonItem setAccessibilityIdentifier:](self->_shareItem, "setAccessibilityIdentifier:", CFSTR("share-button"));
  -[UIBarButtonItem setAccessibilityIdentifier:](self->_doneItem, "setAccessibilityIdentifier:", CFSTR("done-button"));
  -[UIBarButtonItem setAccessibilityIdentifier:](self->_undoItem, "setAccessibilityIdentifier:", CFSTR("undo-button"));
  -[UIBarButtonItem setAccessibilityIdentifier:](self->_redoItem, "setAccessibilityIdentifier:", CFSTR("redo-button"));
  -[UIBarButtonItem setAccessibilityIdentifier:](self->_deleteItem, "setAccessibilityIdentifier:", CFSTR("delete-button"));
  -[UIBarButtonItem setAccessibilityIdentifier:](self->_cropItem, "setAccessibilityIdentifier:", CFSTR("content-toggle-crop"));
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v77), "setAccessibilityIdentifier:", CFSTR("content-reset-crop"));
  -[UIBarButtonItem setAccessibilityIdentifier:](self->_cancelCropItem, "setAccessibilityIdentifier:", CFSTR("content-cancel-crop"));
  if (_SSEnableContinuousScreenCaptureForBugFiling(-[UISegmentedControl setAccessibilityIdentifier:](self->_contentSwitcher, "setAccessibilityIdentifier:", CFSTR("content-switcher-control")))&& +[SSSRecapViewController recapAvailable](SSSRecapViewController, "recapAvailable"))
  {
    v75 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 15, self, "_recapPushed");
    recapItem = self->_recapItem;
    self->_recapItem = v75;

    -[UIBarButtonItem setAccessibilityIdentifier:](self->_recapItem, "setAccessibilityIdentifier:", CFSTR("recap-button"));
  }
  -[SSSScreenshotsViewController _updateUndoRedoEnabledState](self, "_updateUndoRedoEnabledState");
  -[SSSScreenshotsViewController _updateBarButtonItemPositionsAnimated:](self, "_updateBarButtonItemPositionsAnimated:", 0);
  objc_destroyWeak(&v79);
  objc_destroyWeak(&location);
}

- (id)_accessibilityHUDWindow
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));

  return v3;
}

- (void)_updateBarButtonItemPositionsAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _BOOL4 shouldShowSharrow;
  unsigned __int8 v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  SSVellumOpacityControl *opacityControl;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  UIBarButtonItem *undoItem;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  UIBarButtonItem *resetCropItem;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  UIView *v40;
  double v41;
  double v42;
  UIView *contentSwitcherView;
  void *v44;
  UISegmentedControl *v45;
  void *v46;
  double v47;
  UISegmentedControl *contentSwitcher;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  UINavigationItem *v56;
  UINavigationItem *managedNavigationItem;
  id v58;
  unsigned __int8 v59;
  UIBarButtonItem *recapItem;
  _BOOL4 v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[2];
  VKSelectableBarButtonItem *annotationEnabledButton;
  UIBarButtonItem *v67;
  UIBarButtonItem *v68;
  UIBarButtonItem *v69;
  UIBarButtonItem *deleteItem;
  UIBarButtonItem *shareItem;

  if (!self->_hasConfiguredBarButtonItems)
    return;
  v61 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  +[SSChromeHelper defaultBarButtonSpacing](SSChromeHelper, "defaultBarButtonSpacing");
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[SSChromeHelper createFixedSpaceBarButtonItemWithWidth:](SSChromeHelper, "createFixedSpaceBarButtonItemWithWidth:"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v6 = objc_msgSend(v5, "editMode");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentLiveTextBarButtonItemIfExists"));

  shouldShowSharrow = self->_shouldShowSharrow;
  recapItem = self->_recapItem;
  v9 = +[VKCImageAnalyzer supportedAnalysisTypes](VKCImageAnalyzer, "supportedAnalysisTypes");
  +[SSChromeHelper defaultBarButtonSpacing](SSChromeHelper, "defaultBarButtonSpacing");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController traitCollection](self, "traitCollection"));
  v13 = (uint64_t)objc_msgSend(v12, "userInterfaceIdiom");

  if (v13 == 1)
  {
    v59 = v9;
    -[UIBarButtonItem _setFlexible:](self->_opacityItem, "_setFlexible:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController view](self, "view"));
    +[SSChromeHelper widthForOpacityControlInView:withContentSwitcher:](SSChromeHelper, "widthForOpacityControlInView:withContentSwitcher:", v14, self->_contentSwitcher);
    v16 = v15;

    opacityControl = self->_opacityControl;
    -[SSVellumOpacityControl intrinsicContentSize](opacityControl, "intrinsicContentSize");
    -[SSVellumOpacityControl setFrame:](opacityControl, "setFrame:", 0.0, 0.0, v16, v18);
    objc_msgSend(v4, "addObject:", self->_doneItem);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem fixedSpaceItemOfWidth:](UIBarButtonItem, "fixedSpaceItemOfWidth:", v11));
    objc_msgSend(v4, "addObject:", v19);

    v13 = 1;
    objc_msgSend(v4, "addObject:", self->_opacityItem);
    if (v6 != (id)2)
    {
      if (shouldShowSharrow)
      {
        shareItem = self->_shareItem;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &shareItem, 1));
        objc_msgSend(v64, "addObjectsFromArray:", v20);

      }
      deleteItem = self->_deleteItem;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &deleteItem, 1));
      objc_msgSend(v64, "addObjectsFromArray:", v21);

      if (recapItem)
      {
        v22 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
        objc_msgSend(v22, "setWidth:", 31.0);
        objc_msgSend(v64, "addObject:", v22);

        objc_msgSend(v64, "addObject:", self->_recapItem);
      }
      objc_msgSend(v64, "addObject:", self->_annotationEnabledButton);
      if (v63 && (v59 & 1) != 0)
        objc_msgSend(v64, "addObject:", v63);
      if ((v59 & 0x30) != 0)
        objc_msgSend(v64, "addObject:", self->_visualSearchBarButtonItem);
      objc_msgSend(v64, "addObject:", v62);
    }
  }
  else
  {
    objc_msgSend(v4, "addObject:", self->_doneItem);
    if (v6 != (id)2)
    {
      if (shouldShowSharrow)
      {
        v69 = self->_shareItem;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v69, 1));
        objc_msgSend(v64, "addObjectsFromArray:", v23);

      }
      v68 = self->_deleteItem;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v68, 1));
      objc_msgSend(v64, "addObjectsFromArray:", v24);

      if (recapItem)
      {
        v67 = self->_recapItem;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v67, 1));
        objc_msgSend(v64, "addObjectsFromArray:", v25);

      }
      if (!v6)
      {
        annotationEnabledButton = self->_annotationEnabledButton;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &annotationEnabledButton, 1));
        objc_msgSend(v64, "addObjectsFromArray:", v26);

      }
      undoItem = self->_undoItem;
      v65[0] = self->_redoItem;
      v65[1] = undoItem;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v65, 2));
      objc_msgSend(v64, "addObjectsFromArray:", v28);

    }
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topBar"));

  -[UIView setHidden:](self->_contentSwitcherView, "setHidden:", -[SSSScreenshotsViewController _layoutShouldShowContentSwitcher](self, "_layoutShouldShowContentSwitcher") ^ 1);
  -[UIView setUserInteractionEnabled:](self->_contentSwitcherView, "setUserInteractionEnabled:", -[SSSScreenshotsViewController _layoutShouldEnableContentSwitcher](self, "_layoutShouldEnableContentSwitcher"));
  if (!-[SSSScreenshotsViewController _layoutShouldShowContentSwitcher](self, "_layoutShouldShowContentSwitcher"))
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
    v38 = objc_msgSend(v37, "editMode");

    if (v38)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
      objc_msgSend(v39, "setEditMode:", 0);

      v38 = 0;
    }
    v40 = 0;
    v31 = v64;
    goto LABEL_39;
  }
  v31 = v64;
  if ((id)-[UISegmentedControl selectedSegmentIndex](self->_contentSwitcher, "selectedSegmentIndex") == (id)1)
  {
    if (v13 == 1)
    {
      +[SSChromeHelper defaultBarButtonSpacing](SSChromeHelper, "defaultBarButtonSpacing");
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[SSChromeHelper createFixedSpaceBarButtonItemWithWidth:](SSChromeHelper, "createFixedSpaceBarButtonItemWithWidth:"));
      objc_msgSend(v4, "addObject:", v32);

    }
    if (-[SSSScreenshotsViewController _cropPDFEnabled](self, "_cropPDFEnabled"))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
      v34 = objc_msgSend(v33, "editMode");

      if (v34 == (id)2)
      {
        objc_msgSend(v64, "addObject:", self->_cancelCropItem);
        objc_msgSend(v64, "addObject:", self->_resetCropItem);
        resetCropItem = self->_resetCropItem;
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
        -[UIBarButtonItem setEnabled:](resetCropItem, "setEnabled:", objc_msgSend(v36, "isCropped"));

      }
      else
      {
        objc_msgSend(v4, "addObject:", self->_cropItem);
      }
    }
  }
  +[SSChromeHelper contentSwitcherPadding](SSChromeHelper, "contentSwitcherPadding");
  if (v6 == (id)2)
  {
    v38 = 0;
  }
  else
  {
    v42 = v41;
    if (!-[SSSScreenshotsViewController _contentSwitcherShouldMoveDown](self, "_contentSwitcherShouldMoveDown"))
    {
      contentSwitcher = self->_contentSwitcher;
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController view](self, "view"));
      +[SSChromeHelper widthForContentSwitcher:forView:](SSChromeHelper, "widthForContentSwitcher:forView:", contentSwitcher, v49);
      v51 = v50;

      -[UISegmentedControl setWidth:forSegmentAtIndex:](self->_contentSwitcher, "setWidth:forSegmentAtIndex:", 0, v51);
      -[UISegmentedControl setWidth:forSegmentAtIndex:](self->_contentSwitcher, "setWidth:forSegmentAtIndex:", 1, v51);
      -[UISegmentedControl bounds](self->_contentSwitcher, "bounds");
      v53 = v52;
      v55 = v54 + v42 * 2.0;
      -[UIView setFrame:](self->_contentSwitcherView, "setFrame:");
      -[UISegmentedControl setFrame:](self->_contentSwitcher, "setFrame:", v42, 0.0, v55, v53);
      v40 = self->_contentSwitcherView;
      v38 = 0;
      goto LABEL_39;
    }
    v38 = objc_msgSend(objc_alloc((Class)_UINavigationBarPalette), "initWithContentView:", self->_contentSwitcherView);
    objc_msgSend(v38, "setPreferredHeight:", 38.0);
    contentSwitcherView = self->_contentSwitcherView;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController view](self, "view"));
    objc_msgSend(v44, "frame");
    -[UIView setFrame:](contentSwitcherView, "setFrame:", 0.0, 0.0);

    v45 = self->_contentSwitcher;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController view](self, "view"));
    objc_msgSend(v46, "frame");
    -[UISegmentedControl setFrame:](v45, "setFrame:", v42, 4.0, v47 + v42 * -2.0, 30.0);

  }
  v40 = 0;
LABEL_39:
  -[UINavigationItem setLeftBarButtonItems:animated:](self->_managedNavigationItem, "setLeftBarButtonItems:animated:", v4, v61);
  -[UINavigationItem setRightBarButtonItems:animated:](self->_managedNavigationItem, "setRightBarButtonItems:animated:", v31, v61);
  -[UINavigationItem setTitleView:](self->_managedNavigationItem, "setTitleView:", v40);
  -[UINavigationItem _setBottomPalette:](self->_managedNavigationItem, "_setBottomPalette:", v38);
  v56 = (UINavigationItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topItem"));
  managedNavigationItem = self->_managedNavigationItem;

  if (v56 != managedNavigationItem)
  {
    v58 = objc_msgSend(v30, "popNavigationItemAnimated:", 0);
    objc_msgSend(v30, "pushNavigationItem:animated:", self->_managedNavigationItem, 0);
  }

}

- (BOOL)_layoutShouldShowContentSwitcher
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v3 = objc_msgSend(v2, "_layoutShouldShowContentSwitcher");

  return v3;
}

- (BOOL)_layoutShouldEnableContentSwitcher
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v3 = objc_msgSend(v2, "_layoutShouldEnableContentSwitcher");

  return v3;
}

- (BOOL)_contentSwitcherShouldMoveDown
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v3 = objc_msgSend(v2, "_contentSwitcherShouldMoveDown");

  return v3;
}

- (void)_presentActivityViewControllerFromBarButtonItem:(id)a3
{
  SSSActivityViewController *activityViewController;
  id v5;
  id v6;

  activityViewController = self->_activityViewController;
  v5 = a3;
  -[SSSScreenshotsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", activityViewController, 1, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController popoverPresentationController](self->_activityViewController, "popoverPresentationController"));
  objc_msgSend(v6, "setBarButtonItem:", v5);

  objc_msgSend(v6, "_setIgnoreBarButtonItemSiblings:", 1);
}

- (void)_actuallyPresentShareFromBarButtonItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SSSScreenshotsViewController _updateActivityViewController](self, "_updateActivityViewController");
  -[SSSScreenshotsViewController _presentActivityViewControllerFromBarButtonItem:](self, "_presentActivityViewControllerFromBarButtonItem:", v4);

  -[SSSScreenshotsViewController _updateBarButtonItemPositionsAnimated:](self, "_updateBarButtonItemPositionsAnimated:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v5, "setIsSharing:", 1);

}

- (void)_sharePushed:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  unsigned __int8 v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "screenshotsViewControllerShouldAllowSharing:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController delegate](self, "delegate"));
    v8 = objc_msgSend(v7, "screenshotsViewControllerShouldAllowSharing:", self);

    if ((v8 & 1) == 0)
      goto LABEL_8;
  }
  else
  {
    v9 = os_log_create("com.apple.screenshotservices", "ShareSheet");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Sharing was attempted but is not allowed because device is locked", buf, 2u);
    }

  }
  -[SSSScreenshotsViewController becomeFirstResponder](self, "becomeFirstResponder");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController delegate](self, "delegate"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004243C;
  v11[3] = &unk_100092970;
  v11[4] = self;
  v12 = v4;
  objc_msgSend(v10, "screenshotsViewController:requestsPresentingActivityViewControllerWithBlock:", self, v11);

LABEL_8:
}

- (void)annotationButtonPressed:(id)a3
{
  -[SSSScreenshotsViewController setAnnotationModeEnabled:](self, "setAnnotationModeEnabled:", -[SSSScreenshotsViewController annotationModeEnabled](self, "annotationModeEnabled", a3) ^ 1);
  _SSSetAnnotationModePreference(-[SSSScreenshotsViewController annotationModeEnabled](self, "annotationModeEnabled"));
}

- (void)_handlePencilSqueezeInteractionWillShowPaletteViewNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  _DWORD v6[2];

  v4 = os_log_create("com.apple.screenshotservices", "Screenshot");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = -[SSSScreenshotsViewController annotationModeEnabled](self, "annotationModeEnabled");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "will show squeeze palette view, annotationModeEnabled: %{BOOL}d", (uint8_t *)v6, 8u);
  }

  if (!-[SSSScreenshotsViewController annotationModeEnabled](self, "annotationModeEnabled"))
  {
    -[SSSScreenshotsViewController setAnnotationModeEnabled:](self, "setAnnotationModeEnabled:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
    objc_msgSend(v5, "setNeedsLayout");

  }
}

- (BOOL)isShowingDoneActionSheet
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController presentedViewController](self, "presentedViewController"));
  objc_opt_class(UIDocumentPickerViewController, v3);
  isKindOfClass = objc_opt_isKindOfClass(v2, v4);

  return isKindOfClass & 1;
}

- (id)_buildDoneMenu
{
  void *v2;
  void *v3;
  void *v4;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;
  void *v12;

  objc_initWeak(&location, self);
  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_100042834;
  v9 = &unk_1000929C0;
  objc_copyWeak(&v10, &location);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDeferredMenuElement elementWithUncachedProvider:](UIDeferredMenuElement, "elementWithUncachedProvider:", &v6));
  v12 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1, v6, v7, v8, v9));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v3));

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v4;
}

- (id)_buildDoneMenuElements
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
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
  void *v35;
  void *v36;
  id v37;
  char v38;
  uint64_t v39;
  void *i;
  void *v41;
  void *v42;
  _BOOL4 v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  unsigned int v56;
  char *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id v87;
  _QWORD v88[4];
  id v89;
  _QWORD v90[4];
  id v91;
  _QWORD v92[4];
  id v93;
  _QWORD v94[4];
  id v95;
  BOOL v96;
  _QWORD v97[4];
  id v98;
  BOOL v99;
  id location;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  void *v104;
  _QWORD v105[2];
  _QWORD v106[2];
  _BYTE v107[128];

  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v4 = objc_msgSend(v3, "editMode");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SAVE_TO_PHOTOS"), CFSTR("Save to Photos"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.arrow.down")));
  v97[0] = _NSConcreteStackBlock;
  v97[1] = 3221225472;
  v97[2] = sub_100043778;
  v97[3] = &unk_1000929E8;
  objc_copyWeak(&v98, &location);
  v99 = v4 == 0;
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v6, v7, 0, v97));

  v72 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("folder")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SAVE_TO_FILES"), CFSTR("Save to Files"), 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SAVE_PDF_TO_FILES"), CFSTR("Save PDF to Files"), 0));

  v10 = v70;
  if (v4)
    v10 = v69;
  v68 = v10;
  v94[0] = _NSConcreteStackBlock;
  v94[1] = 3221225472;
  v94[2] = sub_100043814;
  v94[3] = &unk_1000929E8;
  objc_copyWeak(&v95, &location);
  v96 = v4 == 0;
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v68, v72, 0, v94));
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("quicknote")));
  if (_SSScreenshotsInQuickNoteEnabled())
  {
    v101 = 0;
    v102 = &v101;
    v103 = 0x2020000000;
    v11 = off_1000AD808;
    v104 = off_1000AD808;
    if (!off_1000AD808)
    {
      v12 = (void *)sub_100048AAC();
      v11 = dlsym(v12, "SYIsQuickNoteAvailable");
      v102[3] = (uint64_t)v11;
      off_1000AD808 = v11;
    }
    _Block_object_dispose(&v101, 8);
    if (!v11)
    {
      v57 = dlerror();
      abort_report_np("%s", v57);
      __break(1u);
    }
    v13 = ((uint64_t (*)(void))v11)();
    v14 = v13;
    if (v4)
      v15 = 0;
    else
      v15 = v13;
    if (v15 == 1)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SAVE_TO_QUICK_NOTE"), CFSTR("Save to Quick Note"), 0));

      v92[0] = _NSConcreteStackBlock;
      v92[1] = 3221225472;
      v92[2] = sub_100043898;
      v92[3] = &unk_100092A10;
      objc_copyWeak(&v93, &location);
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v17, v64, 0, v92));
      objc_destroyWeak(&v93);

      v14 = 1;
      goto LABEL_14;
    }
  }
  else
  {
    v14 = 0;
  }
  v71 = 0;
LABEL_14:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("SAVE_TO_PHOTOS_AND_FILES"), CFSTR("Save All to Photos and Files"), 0));

  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = sub_100043904;
  v90[3] = &unk_100092A10;
  objc_copyWeak(&v91, &location);
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v67, v72, 0, v90));
  if (v14)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("SAVE_ALL_TO_A_QUICK_NOTE_AND_FILES"), CFSTR("Save All to a Quick Note and Files"), 0));

    v88[0] = _NSConcreteStackBlock;
    v88[1] = 3221225472;
    v88[2] = sub_100043970;
    v88[3] = &unk_100092A10;
    objc_copyWeak(&v89, &location);
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v20, v64, 0, v88));
    objc_destroyWeak(&v89);

  }
  else
  {
    v59 = 0;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("SAVE_ALL_TO_FILES"), CFSTR("Save All to Files"), 0));

  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472;
  v86[2] = sub_1000439DC;
  v86[3] = &unk_100092A10;
  objc_copyWeak(&v87, &location);
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v66, v72, 0, v86));
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = sub_100043A48;
  v84[3] = &unk_100092A10;
  objc_copyWeak(&v85, &location);
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", CFSTR("Export Vellum PDF"), 0, 0, v84));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("SHARE_BETA_FEEDBACK"), CFSTR("Share Beta Feedback…"), 0));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("exclamationmark.bubble")));
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_100043A74;
  v82[3] = &unk_100092A10;
  objc_copyWeak(&v83, &location);
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v23, v24, 0, v82));

  if (-[SSSScreenshotsViewController _shouldSendToDeveloper](self, "_shouldSendToDeveloper"))
    objc_msgSend(v73, "addObject:", v62);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("COPY_AND_DELETE_ACTION_TITLE"), CFSTR("Copy and Delete"), 0));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("doc.on.trash")));
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_100043AA0;
  v80[3] = &unk_100092A10;
  objc_copyWeak(&v81, &location);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v26, v27, 0, v80));

  objc_msgSend(v28, "setAttributes:", 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("DELETE_SCREENSHOTS_FORMAT"), &stru_1000937C8, 0));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController visibleScreenshots](self, "visibleScreenshots"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v30, objc_msgSend(v31, "count")));

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("trash")));
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_100043B2C;
  v78[3] = &unk_100092A10;
  objc_copyWeak(&v79, &location);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v32, v33, 0, v78));

  objc_msgSend(v34, "setAttributes:", 2);
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "visibleScreenshots"));

  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v74, v107, 16);
  if (!v37)
  {

LABEL_31:
    v44 = objc_msgSend(v73, "addObject:", v65);
    goto LABEL_32;
  }
  v38 = 0;
  v39 = *(_QWORD *)v75;
  do
  {
    for (i = 0; i != v37; i = (char *)i + 1)
    {
      if (*(_QWORD *)v75 != v39)
        objc_enumerationMutation(v36);
      v38 |= objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)i), "lastViewEditMode") == (id)1;
    }
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v74, v107, 16);
  }
  while (v37);

  if ((v38 & 1) == 0)
    goto LABEL_31;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "visibleScreenshots"));
  v43 = (unint64_t)objc_msgSend(v42, "count") > 1;

  if (v43)
  {
    objc_msgSend(v73, "addObject:", v60);
    v44 = objc_msgSend(v73, "addObject:", v58);
    v45 = v59;
    if (!v59)
      goto LABEL_37;
    goto LABEL_36;
  }
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "visibleScreenshots"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "firstObject"));
  v56 = objc_msgSend(v55, "pdfCanBeConvertedToImage");

  if (v56)
    goto LABEL_31;
LABEL_32:
  if (self->_shouldShowSharrow)
    v44 = objc_msgSend(v73, "addObject:", v63);
  if (v71)
  {
    v45 = v71;
    if (self->_shouldShowSharrow)
LABEL_36:
      v44 = objc_msgSend(v73, "addObject:", v45);
  }
LABEL_37:
  if (self->_shouldShowSharrow && _SSEnableVellumExport(v44))
    objc_msgSend(v73, "addObject:", v61);
  v46 = objc_msgSend(v73, "copy", v45);
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1000937C8, 0, 0, 1, v46));
  v106[0] = v47;
  v105[0] = v28;
  v105[1] = v34;
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v105, 2));
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1000937C8, 0, 0, 1, v48));
  v106[1] = v49;
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v106, 2));
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1000937C8, 0, 0, 1, v50));

  objc_destroyWeak(&v79);
  objc_destroyWeak(&v81);

  objc_destroyWeak(&v83);
  objc_destroyWeak(&v85);

  objc_destroyWeak(&v87);
  objc_destroyWeak(&v91);

  objc_destroyWeak(&v95);
  objc_destroyWeak(&v98);
  objc_destroyWeak(&location);

  return v51;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView", a3));
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)_savePDFToPhotosPushed
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  UIImage *v9;
  UIImage *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController visibleScreenshots](self, "visibleScreenshots", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "lastViewEditMode") == (id)1)
        {
          v9 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pdfAsImage"));
          v10 = v9;
          if (v9)
            UIImageWriteToSavedPhotosAlbum(v9, self, "_image:didFinishSavingWithError:contextInfo:", 0);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)_image:(id)a3 didFinishSavingWithError:(id)a4 contextInfo:(void *)a5
{
  id v5;
  NSObject *v6;

  v5 = a4;
  if (v5)
  {
    v6 = os_log_create("com.apple.screenshotservices", "Screenshot");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000580F8(v5, v6);

  }
}

- (void)_saveToFilesPushed:(BOOL)a3 savePDF:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  BOOL v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  _BYTE v27[128];

  v4 = a4;
  v5 = a3;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100043FCC;
  v26[3] = &unk_100092A60;
  v26[4] = self;
  v7 = objc_retainBlock(v26);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController visibleScreenshots](self, "visibleScreenshots"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v15, "lastViewEditMode"))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "temporaryPDFFile"));
          if (v16)
            objc_msgSend(v9, "addObject:", v16);

        }
        else
        {
          objc_msgSend(v8, "addObject:", v15);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v12);
  }

  if (v5)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshotManager sharedScreenshotManager](SSSScreenshotManager, "sharedScreenshotManager"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100044138;
    v18[3] = &unk_100092A88;
    v21 = v4;
    v20 = v7;
    v19 = v9;
    objc_msgSend(v17, "saveScreenshotsToTemporaryLocation:completion:", v8, v18);

  }
  else if (v4)
  {
    ((void (*)(_QWORD *, void *))v7[2])(v7, v9);
  }

}

- (void)_clearSecurityScopedResourcesAndTemporaryFiles
{
  NSMutableArray *securityScopedResourceURLs;
  NSMutableArray *temporaryURLs;

  -[NSMutableArray enumerateObjectsUsingBlock:](self->_securityScopedResourceURLs, "enumerateObjectsUsingBlock:", &stru_100092AC8);
  securityScopedResourceURLs = self->_securityScopedResourceURLs;
  self->_securityScopedResourceURLs = 0;

  -[NSMutableArray enumerateObjectsUsingBlock:](self->_temporaryURLs, "enumerateObjectsUsingBlock:", &stru_100092AE8);
  temporaryURLs = self->_temporaryURLs;
  self->_temporaryURLs = 0;

}

- (void)_dismissWithDeleteOptions:(unint64_t)a3
{
  _QWORD *v4;
  void *v5;
  id *v6;
  uint64_t v7;
  NSMutableArray *quickNoteImages;
  id v9;
  NSMutableArray *v10;
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  _QWORD v18[4];
  _QWORD *v19;
  _QWORD v20[6];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100044478;
  v20[3] = &unk_100092B38;
  v20[4] = self;
  v20[5] = a3;
  v4 = objc_retainBlock(v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController traitCollection](self, "traitCollection"));
  v6 = (id *)objc_msgSend(v5, "userInterfaceIdiom");

  v7 = 224;
  quickNoteImages = self->_quickNoteImages;
  if (quickNoteImages)
    v9 = -[NSMutableArray copy](quickNoteImages, "copy");
  else
    v9 = &__NSArray0__struct;
  v10 = self->_quickNoteImages;
  self->_quickNoteImages = 0;

  if (v6)
  {
    objc_initWeak(&location, self);
    v11 = objc_msgSend(v9, "count");
    if (v11)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100044654;
      v14[3] = &unk_100091A08;
      v12 = v14;
      v6 = &v16;
      objc_copyWeak(&v16, &location);
      v7 = (uint64_t)&v15;
      v15 = v9;
    }
    else
    {
      v12 = 0;
    }
    v13 = objc_retainBlock(v12);
    ((void (*)(_QWORD *, _QWORD *))v4[2])(v4, v13);

    if (v11)
    {

      objc_destroyWeak(v6);
    }
    objc_destroyWeak(&location);
  }
  else if (objc_msgSend(v9, "count"))
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100044644;
    v18[3] = &unk_100092078;
    v19 = v4;
    -[SSSScreenshotsViewController _saveImages:toQuickNoteWithDismissalCompletionBlock:](self, "_saveImages:toQuickNoteWithDismissalCompletionBlock:", v9, v18);

  }
  else
  {
    ((void (*)(_QWORD *, _QWORD))v4[2])(v4, 0);
  }

}

- (void)_saveImages:(id)a3 toQuickNoteWithDismissalCompletionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *presentationControllerDismissalObserver;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController traitCollection](self, "traitCollection"));
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v10 = (void *)qword_1000AD818;
  v27 = qword_1000AD818;
  if (!qword_1000AD818)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100048B5C;
    v23[3] = &unk_100091848;
    v23[4] = &v24;
    sub_100048B5C((uint64_t)v23);
    v10 = (void *)v25[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v24, 8);
  v12 = objc_alloc_init(v11);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000448A4;
  v21[3] = &unk_100092B60;
  v13 = v6;
  v22 = v13;
  objc_msgSend(v12, "insertImagesData:completion:", v13, v21);
  if (!v9 && !self->_presentationControllerDismissalObserver)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v15 = UIPresentationControllerDismissalTransitionDidEndNotification;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000449C4;
    v19[3] = &unk_100092B88;
    v20 = v7;
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "addObserverForName:object:queue:usingBlock:", v15, 0, v16, v19));
    presentationControllerDismissalObserver = self->_presentationControllerDismissalObserver;
    self->_presentationControllerDismissalObserver = v17;

  }
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  id v5;

  -[SSSScreenshotsViewController _dismissWithDeleteOptions:](self, "_dismissWithDeleteOptions:", self->_saveToFilesDeleteOptions, a4);
  -[SSSScreenshotsViewController _clearSecurityScopedResourcesAndTemporaryFiles](self, "_clearSecurityScopedResourcesAndTemporaryFiles");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v5, "setNeedsLayout");

}

- (void)documentPickerWasCancelled:(id)a3
{
  id v4;

  -[SSSScreenshotsViewController _clearSecurityScopedResourcesAndTemporaryFiles](self, "_clearSecurityScopedResourcesAndTemporaryFiles", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)_saveToQuickNotePushed:(BOOL)a3 savePDF:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *quickNoteImages;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *v15;
  NSData *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  objc_class *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  _BYTE v33[128];

  if (a3)
  {
    v4 = a4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageItems"));

    v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    quickNoteImages = self->_quickNoteImages;
    self->_quickNoteImages = v8;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          v15 = self->_quickNoteImages;
          v16 = UIImagePNGRepresentation(*(UIImage **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v14));
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          -[NSMutableArray addObject:](v15, "addObject:", v17, (_QWORD)v28);

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v12);
    }

    if (v4
      && (v18 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController visibleScreenshots](self, "visibleScreenshots")),
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject")),
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "temporaryPDFFile")),
          v19,
          v18,
          v20))
    {
      if (objc_msgSend(v20, "startAccessingSecurityScopedResource"))
        v21 = 208;
      else
        v21 = 216;
      v22 = *(Class *)((char *)&self->super.super.super.isa + v21);
      if (v22)
      {
        objc_msgSend(v22, "addObject:", v20);
      }
      else
      {
        v23 = (objc_class *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v20));
        v24 = *(Class *)((char *)&self->super.super.super.isa + v21);
        *(Class *)((char *)&self->super.super.super.isa + v21) = v23;

      }
      v25 = objc_alloc((Class)UIDocumentPickerViewController);
      v32 = v20;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
      v27 = objc_msgSend(v25, "initForExportingURLs:asCopy:", v26, 1);

      objc_msgSend(v27, "setDelegate:", self);
      -[SSSScreenshotsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v27, 1, 0);

    }
    else
    {
      -[SSSScreenshotsViewController _dismissWithDeleteOptions:](self, "_dismissWithDeleteOptions:", 2, (_QWORD)v28);
    }

  }
}

- (void)_deletePushed
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  UIAlertController *v21;
  UIAlertController *deleteActionSheet;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id location;
  _QWORD v31[5];
  BOOL v32;
  BOOL v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v4 = objc_msgSend(v3, "editMode");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  if (objc_msgSend(v5, "editMode") == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController currentScreenshot](self, "currentScreenshot"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "PDFDocument"));
    v8 = objc_msgSend(v7, "pageCount") == (id)1;

  }
  else
  {
    v8 = 0;
  }

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100045140;
  v31[3] = &unk_100092BB0;
  v32 = v4 == 0;
  v33 = v8;
  v31[4] = self;
  v9 = objc_retainBlock(v31);
  objc_initWeak(&location, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  if (v4)
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DELETE_PAGE_ALERT_BUTTON"), CFSTR("Delete Page"), 0));
  else
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DELETE_SCREENSHOT_ALERT_BUTTON"), CFSTR("Delete Screenshot"), 0));
  v12 = (void *)v11;

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000452BC;
  v27[3] = &unk_100092BD8;
  objc_copyWeak(&v29, &location);
  v13 = v9;
  v28 = v13;
  v24 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 2, v27));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DELETE_SCREENSHOT_ALERT_CANCEL_BUTTON"), CFSTR("Cancel"), 0));

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10004531C;
  v25[3] = &unk_100092920;
  objc_copyWeak(&v26, &location);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 1, v25));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  if (v4)
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("DELETE_PDF_PAGE_BUTTON_TITLE"), CFSTR("Are you sure you want to delete this page?"), 0));
  else
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("DELETE_SCREENSHOT_BUTTON_TITLE"), CFSTR("Are you sure you want to delete this screenshot?"), 0));
  v20 = (void *)v19;

  -[SSSScreenshotsViewController becomeFirstResponder](self, "becomeFirstResponder");
  v21 = (UIAlertController *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v20, 0, 0));
  deleteActionSheet = self->_deleteActionSheet;
  self->_deleteActionSheet = v21;

  -[UIAlertController addAction:](self->_deleteActionSheet, "addAction:", v14);
  -[UIAlertController addAction:](self->_deleteActionSheet, "addAction:", v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIAlertController popoverPresentationController](self->_deleteActionSheet, "popoverPresentationController"));
  objc_msgSend(v23, "setBarButtonItem:", self->_deleteItem);

  -[SSSScreenshotsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_deleteActionSheet, 1, 0);
  objc_destroyWeak(&v26);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

- (BOOL)isShowingDeleteConfirmation
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController presentedViewController](self, "presentedViewController"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController presentedViewController](self, "presentedViewController"));
    v5 = objc_msgSend(v4, "isEqual:", self->_deleteActionSheet);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isShowingModalUI
{
  unsigned int v3;
  void *v4;
  void *v5;

  if (-[SSSScreenshotsViewController isShowingDoneActionSheet](self, "isShowingDoneActionSheet")
    || -[SSSScreenshotsViewController isShowingDeleteConfirmation](self, "isShowingDeleteConfirmation"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController presentedViewController](self, "presentedViewController"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController presentedViewController](self, "presentedViewController"));
      v3 = objc_msgSend(v5, "isBeingDismissed") ^ 1;

    }
    else
    {
      LOBYTE(v3) = 0;
    }

  }
  return v3;
}

- (void)_exportVellumPDF
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  SSSActivityViewController *v10;
  void *v11;
  SSSActivityViewController *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController visibleScreenshots](self, "visibleScreenshots", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v8), "itemProviderPDF"));
        objc_msgSend(v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v10 = [SSSActivityViewController alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _currentScreenshotView](self, "_currentScreenshotView"));
  v12 = -[SSSActivityViewController initWithActivityItems:applicationActivities:editMode:](v10, "initWithActivityItems:applicationActivities:editMode:", v3, 0, objc_msgSend(v11, "editMode"));

  -[SSSActivityViewController setActivityItemProviders:](v12, "setActivityItemProviders:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController popoverPresentationController](v12, "popoverPresentationController"));
  objc_msgSend(v13, "setBarButtonItem:", self->_shareItem);

  -[SSSScreenshotsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
}

- (void)_updatePropertiesOnManagedSubviews
{
  if ((id)-[SSSScreenshotsViewController state](self, "state") == (id)1)
    -[SSSScreenshotsViewController _configureBarsIfNecessary](self, "_configureBarsIfNecessary");
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController parentViewController](self, "parentViewController"));
  v3 = objc_msgSend(v2, "supportedInterfaceOrientations");

  return (unint64_t)v3;
}

- (CGRect)screenshotsExtentRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v2, "screenshotsExtentRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (UICoordinateSpace)screenshotsParentCoordinateSpace
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "screenshotsParentCoordinateSpace"));

  return (UICoordinateSpace *)v3;
}

- (void)_prepareActivityViewController
{
  -[SSSScreenshotsViewController _prepareActivityViewControllerNeedsActivityUpdate:](self, "_prepareActivityViewControllerNeedsActivityUpdate:", 0);
}

- (void)_prepareActivityViewControllerNeedsActivityUpdate:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  SSSActivityViewController **p_activityViewController;
  SSSActivityViewController *activityViewController;
  SSSActivityViewController *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  SSSActivityViewController *v16;
  void *v17;
  uint64_t v18;
  double v19;
  id v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id location;
  _QWORD v31[4];

  v24 = a3;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _betaAppActivityItemIfAvailble](self, "_betaAppActivityItemIfAvailble"));
  if (v4)
    objc_msgSend(v27, "addObject:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _visionKitActivityItemIfAvailble](self, "_visionKitActivityItemIfAvailble"));
  if (v25)
    objc_msgSend(v27, "addObject:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activityItems"));

  if (objc_msgSend(v26, "count"))
  {
    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController includedActivityTypes](self->_activityViewController, "includedActivityTypes"));
      v7 = objc_msgSend(v6, "containsObject:", CFSTR("com.apple.screenshotservicesservice.betafeedback")) ^ 1;

    }
    else
    {
      v7 = 0;
    }
    p_activityViewController = &self->_activityViewController;
    activityViewController = self->_activityViewController;
    self->_activityViewController = 0;

    v10 = self->_activityViewController;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController traitCollection](self, "traitCollection"));
    v12 = -[SSSScreenshotsViewController state](self, "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _currentScreenshotView](self, "_currentScreenshotView"));
    v14 = objc_msgSend(v13, "editMode");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController visibleScreenshots](self, "visibleScreenshots"));
    v16 = sub_10002FBC0(v10, (uint64_t)v11, v12, (uint64_t)v14, (uint64_t)objc_msgSend(v15, "count"), v24 | v7, v27, v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    objc_storeStrong((id *)&self->_activityViewController, v17);
    if (v4)
    {
      *(_QWORD *)&v19 = objc_opt_class(self, v18).n128_u64[0];
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "activityTypeOrder", v19));
      -[SSSActivityViewController setActivityTypeOrder:](*p_activityViewController, "setActivityTypeOrder:", v21);

    }
    else
    {
      -[SSSActivityViewController setActivityTypeOrder:](*p_activityViewController, "setActivityTypeOrder:", 0);
    }
    objc_initWeak(&location, self);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100045A68;
    v28[3] = &unk_100092C00;
    objc_copyWeak(&v29, &location);
    v22 = objc_retainBlock(v28);
    objc_msgSend(v17, "setCompletionWithItemsHandler:", v22);
    v31[0] = UIActivityTypeSaveToCameraRoll;
    v31[1] = UIActivityTypeMarkupAsPDF;
    v31[2] = UIActivityTypeOpenInIBooks;
    v31[3] = UIActivityTypeAddToReadingList;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 4));
    objc_msgSend(v17, "setExcludedActivityTypes:", v23);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
}

+ (id)activityTypeOrder
{
  _QWORD v3[5];

  v3[0] = CFSTR("com.apple.screenshotservicesservice.betafeedback");
  v3[1] = UIActivityTypeAssignToContact;
  v3[2] = UIActivityTypeCopyToPasteboard;
  v3[3] = UIActivityTypePrint;
  v3[4] = UIActivityTypeCloudSharing;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 5));
}

- (void)_updateActivityViewController
{
  -[SSSScreenshotsViewController _prepareActivityViewControllerNeedsActivityUpdate:](self, "_prepareActivityViewControllerNeedsActivityUpdate:", 0);
}

- (void)_updateActivityViewControllerNeedsActivityUpdate:(BOOL)a3
{
  -[SSSScreenshotsViewController _prepareActivityViewControllerNeedsActivityUpdate:](self, "_prepareActivityViewControllerNeedsActivityUpdate:", a3);
}

- (void)cropDidChangeForScreenshotView:(id)a3
{
  UIBarButtonItem *resetCropItem;
  void *v5;
  void *v6;
  id v7;
  id v8;

  resetCropItem = self->_resetCropItem;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView", a3));
  -[UIBarButtonItem setEnabled:](resetCropItem, "setEnabled:", objc_msgSend(v5, "isCropped"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v7 = objc_msgSend(v6, "editMode");

  if (v7 == (id)2)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
    objc_msgSend(v8, "didCropInFullPageMode");
  }
  else
  {
    if (v7)
      return;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
    objc_msgSend(v8, "didCropInNormalMode");
  }

}

- (void)removeChildViewControllers
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v3, "dismissOverlayManagedViewControllers");

  if (!-[SSSScreenshotsViewController state](self, "state"))
    -[SSSScreenshotsViewController _cancelSharing:completion:](self, "_cancelSharing:completion:", 1, 0);
}

- (void)_dismissInflightActivity:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController activityViewController](self->_activityViewController, "activityViewController"));
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", v4, 0);
  sub_100026DDC((uint64_t)v8);

}

- (void)_cancelSharing:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  _QWORD v9[4];
  _QWORD *v10;
  _QWORD *v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v4 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100045EB8;
  v13[3] = &unk_100091920;
  v13[4] = self;
  v6 = objc_retainBlock(v13);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100045F10;
  v12[3] = &unk_100091920;
  v12[4] = self;
  v7 = objc_retainBlock(v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController presentingViewController](self->_activityViewController, "presentingViewController"));

  if (v8)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100045F8C;
    v9[3] = &unk_100092C28;
    v10 = v6;
    v11 = v7;
    -[SSSScreenshotsViewController _dismissActivityViewController:completion:](self, "_dismissActivityViewController:completion:", v4, v9);

  }
  else
  {
    ((void (*)(_QWORD *))v6[2])(v6);
    ((void (*)(_QWORD *))v7[2])(v7);
  }

}

- (void)_dismissActivityViewController:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (self->_activityViewController)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100046068;
    v8[3] = &unk_100092C50;
    v8[4] = self;
    v10 = v4;
    v9 = v6;
    -[SSSScreenshotsViewController _dismissInflightActivity:completion:](self, "_dismissInflightActivity:completion:", v4, v8);

  }
  else
  {
    sub_100026DCC((uint64_t)v6);
  }

}

- (void)screenshotsView:(id)a3 didHitTestView:(id)a4 point:(CGPoint)a5 withEvent:(id)a6
{
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  y = a5.y;
  x = a5.x;
  v19 = a3;
  v11 = a4;
  v12 = a6;
  v13 = v12;
  if (v12 && objc_msgSend(v12, "type") != (id)11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController view](self, "view"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "windowScene"));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[PKPencilSqueezeInteraction _existingInteractionForWindowScene:](PKPencilSqueezeInteraction, "_existingInteractionForWindowScene:", v16));
      v18 = v17;
      if (v17
        && objc_msgSend(v17, "_paletteViewVisible")
        && (objc_msgSend(v18, "_isPointInsidePaletteView:fromView:withEvent:", v11, v13, x, y) & 1) == 0)
      {
        objc_msgSend(v18, "_setMiniPaletteVisible:hoverLocation:inView:", 0, v11, CGPointZero.x, CGPointZero.y);
      }

    }
  }

}

- (void)presentActivityViewController
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  v6 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v6, "screenshotsViewControllerShouldAllowSharing:") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController delegate](self, "delegate"));
    v4 = objc_msgSend(v3, "screenshotsViewControllerShouldAllowSharing:", self);

    if (v4)
    {
      -[SSSScreenshotsViewController _updateActivityViewControllerNeedsActivityUpdate:](self, "_updateActivityViewControllerNeedsActivityUpdate:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController delegate](self, "delegate"));
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1000462E8;
      v7[3] = &unk_1000919B0;
      v7[4] = self;
      objc_msgSend(v5, "screenshotsViewController:requestsPresentingActivityViewControllerWithBlock:", self, v7);

    }
  }
  else
  {

  }
}

- (void)dismissActivityViewController
{
  -[SSSActivityViewController _cancel](self->_activityViewController, "_cancel");
}

- (id)_bundleIDForBetaApp
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visibleScreenshots"));
  v5 = (uint64_t)objc_msgSend(v4, "count");

  while (v5-- >= 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "visibleScreenshots"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v5));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "environmentDescription"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "betaApplicationBundleID"));

    if (v11)
      return v11;
  }
  v11 = 0;
  return v11;
}

- (id)_betaApplicationName
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visibleScreenshots"));
  v5 = (uint64_t)objc_msgSend(v4, "count");

  while (v5-- >= 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "visibleScreenshots"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v5));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "environmentDescription"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "betaApplicationName"));

    if (v11)
      return v11;
  }
  v11 = 0;
  return v11;
}

- (BOOL)_shouldSendToDeveloper
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _bundleIDForBetaApp](self, "_bundleIDForBetaApp"));
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _bundleIDForBetaApp](self, "_bundleIDForBetaApp"));
    v4 = v5 != 0;

  }
  return v4;
}

- (id)_betaAppActivityItemIfAvailble
{
  _QWORD v4[5];

  if (!-[SSSScreenshotsViewController _shouldSendToDeveloper](self, "_shouldSendToDeveloper"))
    return 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100046758;
  v4[3] = &unk_100091920;
  v4[4] = self;
  return -[SSSBetaFeedbackActivity initWithBlock:]([SSSBetaFeedbackActivity alloc], "initWithBlock:", v4);
}

- (id)_visionKitActivityItemIfAvailble
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _currentScreenshotView](self, "_currentScreenshotView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "visionKitFeedbackActivity"));

  return v3;
}

- (void)_sendToDeveloper
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageItems"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
    objc_msgSend(v6, "didTapBetaFeedbackButton");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageItems"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _bundleIDForBetaApp](self, "_bundleIDForBetaApp"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController delegate](self, "delegate"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000468BC;
    v13[3] = &unk_100091FB0;
    v13[4] = self;
    v14 = v9;
    v15 = v8;
    v11 = v8;
    v12 = v9;
    objc_msgSend(v10, "screenshotsViewController:requestsPresentingTestFlightFeedbackControllerWithBlock:", self, v13);

  }
}

- (void)dismissTFViewController
{
  UIViewController *testFlightViewController;
  _QWORD v3[5];

  testFlightViewController = self->_testFlightViewController;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100046B50;
  v3[3] = &unk_100091920;
  v3[4] = self;
  -[UIViewController dismissViewControllerAnimated:completion:](testFlightViewController, "dismissViewControllerAnimated:completion:", 1, v3);
}

- (void)sessionDidSubmitFeedback:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIViewController *testFlightViewController;
  _QWORD v9[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _currentScreenshotView](self, "_currentScreenshotView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "modelModificationInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "annotations"));
  objc_msgSend(v4, "didSubmitFeedbackWithAnnotationCount:", objc_msgSend(v7, "count"));

  testFlightViewController = self->_testFlightViewController;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100046C80;
  v9[3] = &unk_100091920;
  v9[4] = self;
  -[UIViewController dismissViewControllerAnimated:completion:](testFlightViewController, "dismissViewControllerAnimated:completion:", 1, v9);
}

- (void)setState:(unint64_t)a3
{
  unint64_t v5;
  BOOL v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SSSActivityViewController *v18;
  SSSActivityViewController *v19;
  void *v20;
  void *v21;
  SSSActivityViewController *v22;
  SSSActivityViewController *activityViewController;
  id *v24;
  id v25;
  SSSActivityViewController *v26;
  id v27;
  _QWORD v28[4];
  void *v29;
  _QWORD v30[4];
  void *v31;

  v5 = -[SSSScreenshotsViewController state](self, "state");
  v6 = a3 == 1 && v5 == 0;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
    objc_msgSend(v8, "setIsSharing:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController delegate](self, "delegate"));
    v10 = objc_opt_respondsToSelector(v9, "screenshotsViewControllerShouldAllowSharing:");

    v11 = 0;
    if ((v10 & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController delegate](self, "delegate"));
      self->_shouldShowSharrow = objc_msgSend(v12, "screenshotsViewControllerShouldAllowSharing:", self);

      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
    self->_shouldShowSharrow = 0;
    if (!a3)
    {
      if (-[SSSScreenshotsViewController analysisModeEnabled](self, "analysisModeEnabled"))
        -[SSSScreenshotsViewController setAnalysisModeEnabled:](self, "setAnalysisModeEnabled:", 0);
      v11 = 1;
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v13, "setState:", a3);

  -[SSSScreenshotsViewController _updatePropertiesOnManagedSubviews](self, "_updatePropertiesOnManagedSubviews");
  if ((v7 & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
    objc_msgSend(v14, "layoutIfNeeded");

  }
  -[SSSScreenshotsViewController _updateBarButtonItemPositionsAnimated:](self, "_updateBarButtonItemPositionsAnimated:", 0);
  if (v11)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController presentedViewController](self, "presentedViewController"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController presentedViewController](self, "presentedViewController"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "popoverPresentationController"));

      v18 = (SSSActivityViewController *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController presentedViewController](self, "presentedViewController"));
      v19 = v18;
      if (v17)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[SSSActivityViewController popoverPresentationController](v18, "popoverPresentationController"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "presentedView"));

        objc_msgSend(v21, "setHidden:", 1);
        v22 = (SSSActivityViewController *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController presentedViewController](self, "presentedViewController"));
        activityViewController = self->_activityViewController;

        if (v22 == activityViewController)
        {
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_100046FAC;
          v30[3] = &unk_100091920;
          v24 = &v31;
          v31 = v21;
          v27 = v21;
          -[SSSScreenshotsViewController _cancelSharing:completion:](self, "_cancelSharing:completion:", 0, v30);
        }
        else
        {
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_100046FB8;
          v28[3] = &unk_100091920;
          v24 = &v29;
          v29 = v21;
          v25 = v21;
          -[SSSScreenshotsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v28);
        }

      }
      else
      {
        v26 = self->_activityViewController;

        if (v19 == v26)
          -[SSSScreenshotsViewController _cancelSharing:completion:](self, "_cancelSharing:completion:", 1, 0);
        else
          -[SSSScreenshotsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
      }
    }
  }
}

- (unint64_t)state
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v3 = objc_msgSend(v2, "state");

  return (unint64_t)v3;
}

- (BOOL)inStateTransition
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v3 = objc_msgSend(v2, "inStateTransition");

  return v3;
}

- (void)stateTransitionFinished
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v2, "stateTransitionFinished");

}

- (void)commitInflightEditsIfNecessary
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v2, "commitInflightEdits");

}

- (void)setScreenshotsUseTrilinearMinificationFilter:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v4, "setScreenshotViewsUseTrilinearMinificationFilter:", v3);

}

- (BOOL)screenshotsUseTrilinearMinificationFilter
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v3 = objc_msgSend(v2, "screenshotViewsUseTrilinearMinificationFilter");

  return v3;
}

- (void)setShowsShadow:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  _QWORD v6[5];
  BOOL v7;

  v4 = a3;
  if (a4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100047194;
    v6[3] = &unk_100092C78;
    v6[4] = self;
    v7 = a3;
    +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 6, v6, 0);
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
    objc_msgSend(v5, "setShowsShadow:", v4);

  }
}

- (BOOL)showsShadow
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v3 = objc_msgSend(v2, "showsShadow");

  return v3;
}

- (void)setBorderViewStyleOverride:(int64_t)a3 withAnimator:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v7, "setBorderViewStyleOverride:withAnimator:", a3, v6);

}

- (void)setSnapshotScreenshotEdits:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v4, "setSnapshotScreenshotEdits:", v3);

}

- (BOOL)snapshotScreenshotEdits
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v3 = objc_msgSend(v2, "snapshotScreenshotEdits");

  return v3;
}

- (void)_enterCrop
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v3, "setEditMode:", 2);

  -[SSSScreenshotsViewController _updateBarButtonItemPositionsAnimated:](self, "_updateBarButtonItemPositionsAnimated:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v4, "enterCrop");

  -[SSSScreenshotsViewController becomeFirstResponder](self, "becomeFirstResponder");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v5, "setNeedsLayout");

}

- (void)_exitCrop
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _currentScreenshotView](self, "_currentScreenshotView"));
  objc_msgSend(v3, "commitInflightEdits");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v4, "doneCrop");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v5, "setEditMode:", 1);

  -[SSSScreenshotsViewController _updateBarButtonItemPositionsAnimated:](self, "_updateBarButtonItemPositionsAnimated:", 0);
  -[SSSScreenshotsViewController becomeFirstResponder](self, "becomeFirstResponder");
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v6, "setNeedsLayout");

}

- (void)_resetCrop
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v3, "resetCrop");

  -[SSSScreenshotsViewController _updateBarButtonItemPositionsAnimated:](self, "_updateBarButtonItemPositionsAnimated:", 1);
}

- (void)_cancelCrop
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v3, "cancelCrop");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v4, "setEditMode:", 1);

  -[SSSScreenshotsViewController _updateBarButtonItemPositionsAnimated:](self, "_updateBarButtonItemPositionsAnimated:", 1);
  -[SSSScreenshotsViewController becomeFirstResponder](self, "becomeFirstResponder");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v5, "setNeedsLayout");

}

- (void)_selectScreenshotOrFull:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = objc_msgSend(a3, "selectedSegmentIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v5, "commitInflightEdits");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v6, "setEditMode:", v4 != 0);

  -[SSSScreenshotsViewController _updateBarButtonItemPositionsAnimated:](self, "_updateBarButtonItemPositionsAnimated:", 0);
  -[SSSScreenshotsViewController _updateTopBarProperties](self, "_updateTopBarProperties");
  if (v4)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
    objc_msgSend(v7, "didTapFullPageSegment");

  }
}

- (void)setAaModeEnabled:(BOOL)a3
{
  self->_aaModeEnabled = a3;
  if (a3)
  {
    self->_annotationModeEnabled = 0;
    self->_analysisModeEnabled = 0;
  }
  -[SSSScreenshotsViewController updateScreenshotsInteractionModeIfNecessary](self, "updateScreenshotsInteractionModeIfNecessary");
}

- (void)setAnalysisModeEnabled:(BOOL)a3
{
  void *v4;

  self->_analysisModeEnabled = a3;
  if (a3)
  {
    self->_annotationModeEnabled = 0;
    self->_aaModeEnabled = 0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController analysisButtonImageForCurrentState](self, "analysisButtonImageForCurrentState"));
  -[UIBarButtonItem setImage:](self->_visualSearchBarButtonItem, "setImage:", v4);

  -[SSSScreenshotsViewController updateScreenshotsInteractionModeIfNecessary](self, "updateScreenshotsInteractionModeIfNecessary");
}

- (id)analysisButtonImageForCurrentState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _currentScreenshotView](self, "_currentScreenshotView"));
  v4 = v3;
  if (self->_analysisModeEnabled)
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "vsGlyphFilled"));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "vsGlyph"));
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", v5));

  return v7;
}

- (void)setAnnotationModeEnabled:(BOOL)a3
{
  self->_annotationModeEnabled = a3;
  if (a3)
  {
    self->_analysisModeEnabled = 0;
    self->_aaModeEnabled = 0;
  }
  -[SSSScreenshotsViewController updateAnnotationButtonForCurrentState](self, "updateAnnotationButtonForCurrentState");
  -[SSSScreenshotsViewController updateScreenshotsInteractionModeIfNecessary](self, "updateScreenshotsInteractionModeIfNecessary");
}

- (void)updateAnnotationButtonForCurrentState
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController analysisButtonImageForCurrentState](self, "analysisButtonImageForCurrentState"));
  -[UIBarButtonItem setImage:](self->_visualSearchBarButtonItem, "setImage:", v3);

}

- (void)updateScreenshotsInteractionModeToMode:(unint64_t)a3
{
  _BOOL8 v5;
  BOOL v6;
  BOOL v7;
  void *v8;
  id v9;

  v5 = a3 <= 3 && (a3 & 0xF) == 0;
  v6 = a3 <= 3 && (a3 & 0xF) == 3;
  v7 = a3 <= 3 && (a3 & 0xF) == 2;
  -[VKSelectableBarButtonItem setSelected:](self->_annotationEnabledButton, "setSelected:", v5);
  self->_annotationModeEnabled = v5;
  self->_aaModeEnabled = v6;
  self->_analysisModeEnabled = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController analysisButtonImageForCurrentState](self, "analysisButtonImageForCurrentState"));
  -[UIBarButtonItem setImage:](self->_visualSearchBarButtonItem, "setImage:", v8);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v9, "setInteractionMode:", a3);

}

- (void)updateScreenshotsInteractionModeIfNecessary
{
  if (self->_annotationModeEnabled)
  {
    -[SSSScreenshotsViewController updateScreenshotsInteractionModeToMode:](self, "updateScreenshotsInteractionModeToMode:", 0);
  }
  else if (self->_analysisModeEnabled)
  {
    -[SSSScreenshotsViewController updateScreenshotsInteractionModeToMode:](self, "updateScreenshotsInteractionModeToMode:", 2);
  }
  else if (self->_aaModeEnabled)
  {
    -[SSSScreenshotsViewController updateScreenshotsInteractionModeToMode:](self, "updateScreenshotsInteractionModeToMode:", 3);
  }
  else
  {
    -[SSSScreenshotsViewController updateScreenshotsInteractionModeToMode:](self, "updateScreenshotsInteractionModeToMode:", 1);
  }
}

- (void)_opacityControlChanged
{
  void *v3;
  id v4;

  self->_isChangingOpacity = 1;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _currentScreenshotView](self, "_currentScreenshotView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModificationInfo"));
  -[SSVellumOpacityControl value](self->_opacityControl, "value");
  objc_msgSend(v3, "setVellumOpacity:");

}

- (void)_opacityControlLifted
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _currentScreenshotView](self, "_currentScreenshotView"));
  objc_msgSend(v3, "promoteViewValueToModelValueForKey:", 3);

  self->_isChangingOpacity = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v5 = objc_msgSend(v4, "editMode");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
  v7 = v6;
  if (v5 == (id)1)
    objc_msgSend(v6, "didChangeOpacityOnFullPage");
  else
    objc_msgSend(v6, "didChangeOpacityOnNormalScreenshot");

}

- (id)_currentScreenshotView
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController currentScreenshot](self, "currentScreenshot"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "screenshotViewForScreenshot:", v4));

  return v5;
}

- (void)didTapOpacityOptionWithAttributeView:(id)a3
{
  id v4;
  UIView *v5;
  UIView *opacityView;
  UIView *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
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
  double v23;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[5];
  _QWORD v56[4];
  _QWORD v57[4];

  v4 = a3;
  v5 = (UIView *)objc_alloc_init((Class)UIView);
  opacityView = self->_opacityView;
  self->_opacityView = v5;

  -[UIView addSubview:](self->_opacityView, "addSubview:", self->_opacityControl);
  objc_msgSend(v4, "addSubview:", self->_opacityView);
  v7 = self->_opacityView;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UIView setTintColor:](v7, "setTintColor:", v8);

  v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("xmark.circle")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  objc_msgSend(v9, "setImage:forState:", v54, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithScale:](UIImageSymbolConfiguration, "configurationWithScale:", 3));
  objc_msgSend(v9, "setPreferredSymbolConfiguration:forImageInState:", v10, 0);

  objc_msgSend(v9, "addTarget:action:forEvents:", self, "endOpacityEditing", 64);
  -[UIView addSubview:](self->_opacityView, "addSubview:", v9);
  v11 = objc_alloc_init((Class)UILargeContentViewerInteraction);
  objc_msgSend(v4, "addInteraction:", v11);

  v53 = v9;
  objc_msgSend(v9, "setShowsLargeContentViewer:", 1);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_opacityView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SSVellumOpacityControl setTranslatesAutoresizingMaskIntoConstraints:](self->_opacityControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_opacityView, "bottomAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v47));
  v57[0] = v44;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](self->_opacityView, "leftAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leftAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v40, 10.0));
  v57[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](self->_opacityView, "rightAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rightAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -10.0));
  v57[2] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_opacityView, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
  v57[3] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v57, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SSVellumOpacityControl centerXAnchor](self->_opacityControl, "centerXAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_opacityView, "centerXAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));

  LODWORD(v23) = 1144750080;
  v52 = v22;
  objc_msgSend(v22, "setPriority:", v23);
  v56[0] = v22;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[SSVellumOpacityControl leadingAnchor](self->_opacityControl, "leadingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_opacityView, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintGreaterThanOrEqualToAnchor:", v45));
  v56[1] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SSVellumOpacityControl centerYAnchor](self->_opacityControl, "centerYAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_opacityView, "centerYAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
  v56[2] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SSVellumOpacityControl widthAnchor](self->_opacityControl, "widthAnchor"));
  +[SSVellumOpacityControl preferredWidth](SSVellumOpacityControl, "preferredWidth");
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToConstant:"));
  v56[3] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "centerYAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[SSVellumOpacityControl centerYAnchor](self->_opacityControl, "centerYAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v46));
  v55[0] = v43;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "leadingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[SSVellumOpacityControl trailingAnchor](self->_opacityControl, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:constant:", v50, 12.0));
  v55[1] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_opacityView, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintLessThanOrEqualToAnchor:", v33));
  v55[2] = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "widthAnchor"));
  +[SSChromeHelper defaultBarButtonWidth](SSChromeHelper, "defaultBarButtonWidth");
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToConstant:"));
  v55[3] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "heightAnchor"));
  +[SSChromeHelper defaultBarButtonWidth](SSChromeHelper, "defaultBarButtonWidth");
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToConstant:"));
  v55[4] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v55, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v39);

}

- (void)endOpacityEditing
{
  id v3;

  -[UIView removeFromSuperview](self->_opacityView, "removeFromSuperview");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v3, "endOpacityEditing");

}

- (void)_undoManagerDidUndoRedoChange:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController undoManager](self, "undoManager"));

  if (v4 == v5)
    -[SSSScreenshotsViewController _updateUndoRedoEnabledState](self, "_updateUndoRedoEnabledState");
}

- (id)undoManager
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _currentScreenshotView](self, "_currentScreenshotView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "undoManager"));

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SSSScreenshotsViewController;
    v6 = -[SSSScreenshotsViewController undoManager](&v9, "undoManager");
    v5 = (id)objc_claimAutoreleasedReturnValue(v6);
  }
  v7 = v5;

  return v7;
}

- (void)_undoPushed
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _currentScreenshotView](self, "_currentScreenshotView"));
  objc_msgSend(v2, "undo");

}

- (void)_redoPushed
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _currentScreenshotView](self, "_currentScreenshotView"));
  objc_msgSend(v2, "redo");

}

- (void)_updateUndoRedoEnabledState
{
  id v3;
  id v4;
  SSVellumOpacityControl *opacityControl;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _currentScreenshotView](self, "_currentScreenshotView"));
  v3 = objc_msgSend(v7, "canUndo");
  v4 = objc_msgSend(v7, "canRedo");
  -[UIBarButtonItem setEnabled:](self->_undoItem, "setEnabled:", v3);
  -[UIBarButtonItem setEnabled:](self->_redoItem, "setEnabled:", v4);
  opacityControl = self->_opacityControl;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewModificationInfo"));
  objc_msgSend(v6, "vellumOpacity");
  -[SSVellumOpacityControl setValue:](opacityControl, "setValue:");

  -[UIView setHidden:](self->_contentSwitcherView, "setHidden:", -[SSSScreenshotsViewController _layoutShouldShowContentSwitcher](self, "_layoutShouldShowContentSwitcher") ^ 1);
}

- (void)_updateTopBarProperties
{
  void *v3;
  _BOOL8 v4;

  -[SSSScreenshotsViewController _updateUndoRedoEnabledState](self, "_updateUndoRedoEnabledState");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  v4 = objc_msgSend(v3, "editMode") != 0;

  if (-[UISegmentedControl selectedSegmentIndex](self->_contentSwitcher, "selectedSegmentIndex") != v4)
    -[UISegmentedControl setSelectedSegmentIndex:](self->_contentSwitcher, "setSelectedSegmentIndex:", v4);
  if (!self->_isChangingOpacity)
    -[SSSScreenshotsViewController _updateBarButtonItemPositionsAnimated:](self, "_updateBarButtonItemPositionsAnimated:", 0);
}

- (void)_revertPushed
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _currentScreenshotView](self, "_currentScreenshotView"));
  objc_msgSend(v3, "revert");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)screenshotsView:(id)a3 requestsUpdateToInteractionMode:(unint64_t)a4
{
  -[SSSScreenshotsViewController updateScreenshotsInteractionModeToMode:](self, "updateScreenshotsInteractionModeToMode:", a4);
}

- (void)aaButtonPressed:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _currentScreenshotView](self, "_currentScreenshotView"));

  if (v5 == v4)
    -[SSSScreenshotsViewController setAaModeEnabled:](self, "setAaModeEnabled:", -[SSSScreenshotsViewController aaModeEnabled](self, "aaModeEnabled") ^ 1);
}

- (void)viButtonPressed:(id)a3
{
  -[SSSScreenshotsViewController setAnalysisModeEnabled:](self, "setAnalysisModeEnabled:", -[SSSScreenshotsViewController analysisModeEnabled](self, "analysisModeEnabled", a3) ^ 1);
}

- (void)analysisButtonPressed:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _currentScreenshotView](self, "_currentScreenshotView"));

  if (v5 == v4)
  {
    -[SSSScreenshotsViewController setAnalysisModeEnabled:](self, "setAnalysisModeEnabled:", -[SSSScreenshotsViewController analysisModeEnabled](self, "analysisModeEnabled") ^ 1);
    -[SSSScreenshotsViewController updateScreenshotsInteractionModeIfNecessary](self, "updateScreenshotsInteractionModeIfNecessary");
    if (-[SSSScreenshotsViewController analysisModeEnabled](self, "analysisModeEnabled"))
      _SSSetAnnotationModePreference(0);
  }
}

- (void)updateAnalysisButtonStateToVisible:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (a3)
    -[SSSScreenshotsViewController updateAnnotationButtonForCurrentState](self, "updateAnnotationButtonForCurrentState");
  -[UIBarButtonItem _setHidden:](self->_visualSearchBarButtonItem, "_setHidden:", !v3);
}

- (void)activeScreenshotViewDidChangeToView:(id)a3 fromView:(id)a4
{
  -[SSSScreenshotsViewController updateForScreenshotViewChangeAnimated:oldView:](self, "updateForScreenshotViewChangeAnimated:oldView:", 0, a4);
}

- (void)screenshotsViewEditModeDidChange:(id)a3
{
  -[SSSScreenshotsViewController updateForScreenshotViewChangeAnimated:oldView:](self, "updateForScreenshotViewChangeAnimated:oldView:", 1, 0);
}

- (void)updateForScreenshotViewChangeAnimated:(BOOL)a3 oldView:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  int v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v10 = a4;
  self->_aaModeEnabled = 0;
  self->_analysisModeEnabled = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _currentScreenshotView](self, "_currentScreenshotView"));
  v7 = objc_msgSend(v6, "editMode");

  if (!v10)
  {
    v8 = _SSGetAnnotationModePreference();
    if (v7)
      goto LABEL_3;
LABEL_5:
    v9 = -[SSSScreenshotsViewController initialAnnotationMode](self, "initialAnnotationMode") | v8;
    goto LABEL_6;
  }
  v8 = objc_msgSend(v10, "interactionMode") == 0;
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v9 = 1;
LABEL_6:
  -[SSSScreenshotsViewController setAnnotationModeEnabled:](self, "setAnnotationModeEnabled:", v9);
  -[SSSScreenshotsViewController setInitialAnnotationMode:](self, "setInitialAnnotationMode:", 0);
  -[SSSScreenshotsViewController _updateBarButtonItemPositionsAnimated:](self, "_updateBarButtonItemPositionsAnimated:", v4);

}

- (void)_recapPushed
{
  SSSRecapViewController *v3;
  void *v4;
  SSSRecapViewController *v5;

  v3 = [SSSRecapViewController alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController currentScreenshot](self, "currentScreenshot"));
  v5 = -[SSSRecapViewController initWithScreenshot:](v3, "initWithScreenshot:", v4);

  -[SSSScreenshotsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSSScreenshotsViewController;
  -[SSSScreenshotsViewController traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[SSSScreenshotsViewController _updatePropertiesOnManagedSubviews](self, "_updatePropertiesOnManagedSubviews");
  -[SSSScreenshotsViewController _updateBarButtonItemPositionsAnimated:](self, "_updateBarButtonItemPositionsAnimated:", 0);
}

- (void)_screenshotManagerDidProcessMetadataUpdate:(id)a3
{
  -[SSSScreenshotsViewController _updateBarButtonItemPositionsAnimated:](self, "_updateBarButtonItemPositionsAnimated:", 1);
}

- (void)_screenshotManagerDidProcessDocumentUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("screenshot")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v5, "didProcessDocumentUpdateForScreenshot:", v7);

  -[SSSScreenshotsViewController _updateBarButtonItemPositionsAnimated:](self, "_updateBarButtonItemPositionsAnimated:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _screenshotsView](self, "_screenshotsView"));
  objc_msgSend(v6, "_updateThumbnailViewVisibilityIfNeededAnimated:", 1);

}

- (BOOL)_cropPDFEnabled
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController _currentScreenshotView](self, "_currentScreenshotView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_internalPDFView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "document"));
  v5 = objc_msgSend(v4, "pageCount") == (id)1;

  return v5;
}

- (CGRect)getVisibleBoundsForOverlay
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController view](self, "view"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setInStateTransition:(BOOL)a3
{
  self->_inStateTransition = a3;
}

- (SSSScreenshotsViewControllerDelegate)delegate
{
  return (SSSScreenshotsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)contentSwitcherAlpha
{
  return self->_contentSwitcherAlpha;
}

- (BOOL)initialAnnotationMode
{
  return self->_initialAnnotationMode;
}

- (void)setInitialAnnotationMode:(BOOL)a3
{
  self->_initialAnnotationMode = a3;
}

- (BOOL)annotationModeEnabled
{
  return self->_annotationModeEnabled;
}

- (BOOL)aaModeEnabled
{
  return self->_aaModeEnabled;
}

- (BOOL)analysisModeEnabled
{
  return self->_analysisModeEnabled;
}

- (VKCImageAnalyzer)imageAnalyzer
{
  return self->_imageAnalyzer;
}

- (void)setImageAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_imageAnalyzer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAnalyzer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayLinkObserver, 0);
  objc_storeStrong((id *)&self->_presentationControllerDismissalObserver, 0);
  objc_storeStrong((id *)&self->_deleteActionSheet, 0);
  objc_storeStrong((id *)&self->_quickNoteImages, 0);
  objc_storeStrong((id *)&self->_temporaryURLs, 0);
  objc_storeStrong((id *)&self->_securityScopedResourceURLs, 0);
  objc_storeStrong((id *)&self->_testFlightSession, 0);
  objc_storeStrong((id *)&self->_testFlightViewController, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_visualSearchBarButtonItem, 0);
  objc_storeStrong((id *)&self->_annotationEnabledButton, 0);
  objc_storeStrong((id *)&self->_contentSwitcherView, 0);
  objc_storeStrong((id *)&self->_contentSwitcher, 0);
  objc_storeStrong((id *)&self->_cancelCropItem, 0);
  objc_storeStrong((id *)&self->_resetCropItem, 0);
  objc_storeStrong((id *)&self->_cropItem, 0);
  objc_storeStrong((id *)&self->_opacityView, 0);
  objc_storeStrong((id *)&self->_opacityControl, 0);
  objc_storeStrong((id *)&self->_opacityItem, 0);
  objc_storeStrong((id *)&self->_undoRedoSpacerItem, 0);
  objc_storeStrong((id *)&self->_redoItem, 0);
  objc_storeStrong((id *)&self->_undoItem, 0);
  objc_storeStrong((id *)&self->_recapItem, 0);
  objc_storeStrong((id *)&self->_deleteItem, 0);
  objc_storeStrong((id *)&self->_doneItem, 0);
  objc_storeStrong((id *)&self->_shareItem, 0);
  objc_storeStrong((id *)&self->_managedNavigationItem, 0);
}

@end
