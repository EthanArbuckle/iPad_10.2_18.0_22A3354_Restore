@implementation MUImageContentViewController

- (MUImageContentViewController)initWithSourceContent:(id)a3 archivedDataModel:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  MUImageContentViewController *v11;
  MUImageContentViewController *v12;
  void *v13;
  MUImageReader *v14;
  void *v15;
  BOOL v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MUImageContentViewController;
  v11 = -[MUContentViewController initWithNibName:bundle:delegate:](&v18, sel_initWithNibName_bundle_delegate_, 0, 0, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_sourceContent, a3);
    v12->_downsampledImageScale = 1.0;
    v12->_maxImageDimension = 1.79769313e308;
    v12->_usePlaceholderAsDisplayImageIfPossible = v10 == 0;
    objc_msgSend(MEMORY[0x24BE03A30], "controllerWithDelegate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUContentViewController setAnnotationController:](v12, "setAnnotationController:", v13);

    -[MUImageContentViewController setInkStyle:](v12, "setInkStyle:", 0);
    if (v10)
    {
      v14 = objc_alloc_init(MUImageReader);
      -[MUContentViewController annotationController](v12, "annotationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[MUImageReader readAnnotationsFromArchivedModelData:toController:](v14, "readAnnotationsFromArchivedModelData:toController:", v10, v15);

      if (!v16)
      {
        NSLog(CFSTR("%s: Failed to read annotations."), "-[MUImageContentViewController initWithSourceContent:archivedDataModel:delegate:]");
        v12->_usePlaceholderAsDisplayImageIfPossible = 1;
      }

    }
  }

  return v12;
}

- (void)setInkStyle:(unint64_t)a3
{
  _BOOL8 v3;
  id v4;

  self->_inkStyle = a3;
  v3 = a3 == 0;
  -[MUContentViewController annotationController](self, "annotationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseHighVisibilityDefaultInks:", v3);

}

- (UIImage)imageForAnalysis
{
  void *v2;
  void *v3;

  -[MUImageContentViewController imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)dealloc
{
  objc_super v3;

  -[MUImageContentViewController teardown](self, "teardown");
  v3.receiver = self;
  v3.super_class = (Class)MUImageContentViewController;
  -[MUImageContentViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  MUImageScrollView *v5;
  void *v6;
  MUImageScrollView *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
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
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)MUImageContentViewController;
  -[MUImageContentViewController viewDidLoad](&v46, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "darkGrayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUImageContentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = [MUImageScrollView alloc];
  -[MUImageContentViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v7 = -[MUImageScrollView initWithFrame:](v5, "initWithFrame:");
  -[MUImageContentViewController setScrollView:](self, "setScrollView:", v7);

  -[MUImageContentViewController scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreservesCenterDuringRotation:", 1);

  -[MUImageContentViewController scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[MUImageContentViewController scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  -[MUImageContentViewController edgeInsets](self, "edgeInsets");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[MUImageContentViewController scrollView](self, "scrollView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setContentInset:", v12, v14, v16, v18);

  v20 = *MEMORY[0x24BDF7D78];
  -[MUImageContentViewController scrollView](self, "scrollView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDecelerationRate:", v20);

  -[MUImageContentViewController scrollView](self, "scrollView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setMaximumZoomScale:", 1.3);

  -[MUImageContentViewController scrollView](self, "scrollView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setMinimumZoomScale:", 0.1);

  -[MUImageContentViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUImageContentViewController scrollView](self, "scrollView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", v25);

  _NSDictionaryOfVariableBindings(CFSTR("_scrollView"), self->_scrollView, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_scrollView]|"), 0, 0, v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v28);

  v29 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_scrollView]|"), 0, 0, v26);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "activateConstraints:", v30);

  v31 = objc_alloc(MEMORY[0x24BDF6F90]);
  -[MUImageContentViewController scrollView](self, "scrollView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bounds");
  v33 = (void *)objc_msgSend(v31, "initWithFrame:");
  -[MUImageContentViewController setCombinedContentView:](self, "setCombinedContentView:", v33);

  -[MUImageContentViewController scrollView](self, "scrollView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUImageContentViewController combinedContentView](self, "combinedContentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addSubview:", v35);

  v36 = objc_alloc(MEMORY[0x24BDF6AE8]);
  -[MUImageContentViewController combinedContentView](self, "combinedContentView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bounds");
  v38 = (void *)objc_msgSend(v36, "initWithFrame:");
  -[MUImageContentViewController setImageView:](self, "setImageView:", v38);

  -[MUImageContentViewController imageView](self, "imageView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setUserInteractionEnabled:", 1);

  -[MUImageContentViewController combinedContentView](self, "combinedContentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUImageContentViewController imageView](self, "imageView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addSubview:", v41);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObserver:selector:name:object:", self, sel__annotationWillBeginEditing_, *MEMORY[0x24BE03A08], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addObserver:selector:name:object:", self, sel__annotationDidEndEditing_, *MEMORY[0x24BE039E0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addObserver:selector:name:object:", self, sel__keyboardWillShow_, *MEMORY[0x24BDF7B80], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addObserver:selector:name:object:", self, sel__keyboardWillHide_, *MEMORY[0x24BDF7B78], 0);

  -[MUImageContentViewController setFirstLoadZoomToFit:](self, "setFirstLoadZoomToFit:", 1);
  -[MUImageContentViewController setZoomToFitRestoreValue:](self, "setZoomToFitRestoreValue:", 1);

}

- (CGRect)visibleContentRect
{
  void *v3;
  void *v4;
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
  double v15;
  double v16;
  CGRect result;

  -[MUImageContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUImageContentViewController visibleContentRectInCoordinateSpace:](self, "visibleContentRectInCoordinateSpace:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)visibleContentRectInCoordinateSpace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v4 = a3;
  -[MUImageContentViewController imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUImageContentViewController imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v5, "convertRect:toCoordinateSpace:", v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)contentSnapshot
{
  void *v2;
  void *v3;

  -[MUImageContentViewController combinedContentView](self, "combinedContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshotViewAfterScreenUpdates:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MUImageContentViewController;
  -[MUImageContentViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MUImageContentViewController;
  -[MUImageContentViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (void)setup
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  NSLog(CFSTR("%s"), a2, "-[MUImageContentViewController setup]");
  -[MUImageContentViewController setDidSetup:](self, "setDidSetup:", 1);
  -[MUContentViewController annotationController](self, "annotationController");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__doubleTap_);
  objc_msgSend(v3, "setNumberOfTapsRequired:", 2);
  -[MUImageContentViewController setLocalDoubleTapRecognizer:](self, "setLocalDoubleTapRecognizer:", v3);
  -[MUImageContentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v3);

  -[MUImageContentViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "tapGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addGestureRecognizer:", v6);

  -[MUImageContentViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "doubleTapGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addGestureRecognizer:", v8);

  -[MUImageContentViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "pressGestureRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addGestureRecognizer:", v10);

  -[MUImageContentViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "panGestureRecognizer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addGestureRecognizer:", v12);

  -[MUImageContentViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rotationGestureRecognizer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addGestureRecognizer:", v14);

  objc_msgSend(v36, "tapGestureRecognizer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "requireGestureRecognizerToFail:", v3);

  objc_msgSend(v36, "doubleTapGestureRecognizer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requireGestureRecognizerToFail:", v16);

  objc_msgSend(v36, "panGestureRecognizer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requireGestureRecognizerToFail:", v17);

  -[MUImageContentViewController scrollView](self, "scrollView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "panGestureRecognizer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "panGestureRecognizer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "requireGestureRecognizerToFail:", v20);

  -[MUImageContentViewController scrollView](self, "scrollView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "panGestureRecognizer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rotationGestureRecognizer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "requireGestureRecognizerToFail:", v23);

  -[MUImageContentViewController scrollView](self, "scrollView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "pinchGestureRecognizer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "panGestureRecognizer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "requireGestureRecognizerToFail:", v26);

  -[MUImageContentViewController scrollView](self, "scrollView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "pinchGestureRecognizer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rotationGestureRecognizer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "requireGestureRecognizerToFail:", v29);

  objc_msgSend(v36, "modelController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "pageModelControllers");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (!v32)
  {
    v33 = (void *)objc_opt_new();
    objc_msgSend(v36, "modelController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "mutableArrayValueForKey:", CFSTR("pageModelControllers"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v33);

  }
  objc_msgSend(v36, "setCurrentPageIndex:", 0);

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

  NSLog(CFSTR("%s"), a2, "-[MUImageContentViewController teardown]");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  if (-[MUImageContentViewController didSetup](self, "didSetup"))
  {
    -[MUImageContentViewController setDidSetup:](self, "setDidSetup:", 0);
    if (-[MUImageContentViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[MUImageContentViewController view](self, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUImageContentViewController localDoubleTapRecognizer](self, "localDoubleTapRecognizer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeGestureRecognizer:", v5);

      -[MUContentViewController annotationController](self, "annotationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[MUImageContentViewController view](self, "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "tapGestureRecognizer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeGestureRecognizer:", v8);

        -[MUImageContentViewController view](self, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "doubleTapGestureRecognizer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeGestureRecognizer:", v10);

        -[MUImageContentViewController view](self, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "pressGestureRecognizer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeGestureRecognizer:", v12);

        -[MUImageContentViewController view](self, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "panGestureRecognizer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeGestureRecognizer:", v14);

        -[MUImageContentViewController view](self, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "rotationGestureRecognizer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeGestureRecognizer:", v16);

        objc_msgSend(v6, "teardown");
        -[MUContentViewController setAnnotationController:](self, "setAnnotationController:", 0);
      }

    }
    -[MUImageContentViewController setLocalDoubleTapRecognizer:](self, "setLocalDoubleTapRecognizer:", 0);
  }
  if (-[MUImageContentViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[MUImageContentViewController scrollView](self, "scrollView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDelegate:", 0);

    -[MUImageContentViewController scrollView](self, "scrollView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeFromSuperview");

    -[MUImageContentViewController setScrollView:](self, "setScrollView:", 0);
  }
}

- (void)loadContentWithCompletionBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MUImageContentViewController sourceContent](self, "sourceContent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MUImageContentViewController _setImage:withCompletionHandler:](self, "_setImage:withCompletionHandler:", v5, v4);

}

- (CGSize)idealContentSizeForScreenSize:(CGSize)a3 windowDecorationSize:(CGSize)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  double v11;
  double v12;
  CGSize result;

  v4 = a3.width - a4.width;
  v5 = a3.height - a4.height;
  -[MUImageContentViewController contentSize](self, "contentSize");
  v8 = v7 * (v4 / v6);
  v9 = v6 * (v5 / v7);
  if (v6 / v7 < v4 / v5)
    v8 = v5;
  else
    v9 = v4;
  v10 = v9 > v6;
  if (v8 > v7)
    v10 = 1;
  if (!v10)
  {
    v6 = v9;
    v7 = v8;
  }
  v11 = fmax(v6, 32.0);
  v12 = fmax(v7, 32.0);
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  UIEdgeInsets *p_edgeInsets;
  double v9;
  void *v12;
  void *v13;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_edgeInsets = &self->_edgeInsets;
  v9 = self->_edgeInsets.top;
  if (self->_edgeInsets.left != a3.left || v9 != top || self->_edgeInsets.right != a3.right)
  {
    p_edgeInsets->top = top;
    self->_edgeInsets.left = a3.left;
    self->_edgeInsets.bottom = a3.bottom;
    self->_edgeInsets.right = a3.right;
LABEL_10:
    -[MUImageContentViewController scrollView](self, "scrollView", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentInset:", top, left, bottom, right);

    -[MUImageContentViewController scrollView](self, "scrollView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setScrollIndicatorInsets:", top, left, bottom, right);

    goto LABEL_11;
  }
  v9 = self->_edgeInsets.bottom;
  p_edgeInsets->top = top;
  self->_edgeInsets.left = a3.left;
  self->_edgeInsets.bottom = a3.bottom;
  self->_edgeInsets.right = a3.right;
  if (v9 != a3.bottom)
    goto LABEL_10;
LABEL_11:
  -[MUImageContentViewController _updateMinMaxZoomFactor](self, "_updateMinMaxZoomFactor");
}

- (void)_installOverlayOfController:(id)a3 forPageAtIndex:(unint64_t)a4
{
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
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CGAffineTransform v22;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v25;

  v6 = a3;
  objc_msgSend(v6, "setOverlayShouldPixelate:", 1);
  if ((objc_msgSend(v6, "isOverlayViewLoadedAtIndex:", a4) & 1) == 0)
    objc_msgSend(v6, "prepareOverlayAtIndex:", a4);
  objc_msgSend(v6, "overlayViewAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUImageContentViewController combinedContentView](self, "combinedContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v8)
  {
    -[UIImageView bounds](self->_imageView, "bounds");
    -[UIImageView convertRect:toView:](self->_imageView, "convertRect:toView:", v8);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v21 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v25.a = *MEMORY[0x24BDBD8B8];
    v20 = *(_OWORD *)&v25.a;
    *(_OWORD *)&v25.c = v21;
    *(_OWORD *)&v25.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    v19 = *(_OWORD *)&v25.tx;
    CGAffineTransformMakeScale(&t2, 1.0, -1.0);
    *(_OWORD *)&t1.a = v20;
    *(_OWORD *)&t1.c = v21;
    *(_OWORD *)&t1.tx = v19;
    CGAffineTransformConcat(&v25, &t1, &t2);
    objc_msgSend(v7, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAnchorPoint:", 0.5, 0.5);

    v22 = v25;
    objc_msgSend(v7, "setTransform:", &v22);
    objc_msgSend(v7, "setFrame:", v11, v13, v15, v17);
    objc_msgSend(v8, "addSubview:", v7);
  }

}

- (void)_uninstallOverlayOfController:(id)a3 forPageAtIndex:(unint64_t)a4
{
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "isOverlayViewLoadedAtIndex:", a4))
  {
    objc_msgSend(v6, "overlayViewAtIndex:", a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "relinquishOverlayAtIndex:", a4);
    objc_msgSend(v5, "removeFromSuperview");

  }
}

- (void)uninstallAllAnnotationControllerOverlays
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  id v7;

  -[MUContentViewController annotationController](self, "annotationController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modelController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pageModelControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  if (v5)
  {
    for (i = 0; i != v5; ++i)
      -[MUImageContentViewController _uninstallOverlayOfController:forPageAtIndex:](self, "_uninstallOverlayOfController:forPageAtIndex:", v7, i);
  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

}

- (BOOL)canEditContent
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[MUImageContentViewController didSetup](self, "didSetup"))
    return 0;
  -[MUImageContentViewController imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)acceptSingleTouch:(id)a3
{
  return 0;
}

- (int64_t)defaultToolTag
{
  return 764017;
}

- (void)_setImage:(id)a3 withCompletionHandler:(id)a4
{
  const __CFData *v6;
  id v7;
  CGImageSource *v8;
  CGImageRef ImageAtIndex;
  CGImage *v10;
  size_t Width;
  size_t Height;
  CGImageSource *v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  const void *v16;
  const __CFNumber *Value;
  size_t v18;
  uint64_t v19;
  uint64_t v20;
  const void *v21;
  uint64_t v22;
  CGImage *v23;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  int valuePtr;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v6 = (const __CFData *)a3;
  v7 = a4;
  if (!v6)
  {
    NSLog(CFSTR("%s could not set image: %@"), "-[MUImageContentViewController _setImage:withCompletionHandler:]", 0);
    goto LABEL_29;
  }
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = CGImageSourceCreateWithData(v6, 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = (CGImage *)-[__CFData CGImage](objc_retainAutorelease(v6), "CGImage");
        v34[3] = (uint64_t)v23;
        CGImageRetain(v23);
      }
      goto LABEL_8;
    }
    v8 = CGImageSourceCreateWithURL(v6, 0);
  }
  v30[3] = (uint64_t)v8;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v8, 0, 0);
  v34[3] = (uint64_t)ImageAtIndex;
LABEL_8:
  v10 = (CGImage *)v34[3];
  if (v10)
  {
    Width = CGImageGetWidth(v10);
    Height = CGImageGetHeight((CGImageRef)v34[3]);
    v13 = (CGImageSource *)v30[3];
    if (v13)
    {
      v14 = CGImageSourceCopyPropertiesAtIndex(v13, 0, 0);
      v15 = v14;
      if (v14)
      {
        v16 = (const void *)*MEMORY[0x24BDD9698];
        if (CFDictionaryContainsKey(v14, (const void *)*MEMORY[0x24BDD9698]))
        {
          Value = (const __CFNumber *)CFDictionaryGetValue(v15, v16);
          valuePtr = 0;
          if (Value)
          {
            if (CFNumberGetValue(Value, kCFNumberIntType, &valuePtr))
            {
              if ((valuePtr - 5) >= 4)
                v18 = Height;
              else
                v18 = Width;
              if ((valuePtr - 5) < 4)
                Width = Height;
              Height = v18;
            }
          }
        }
        CFRelease(v15);
      }
    }
    -[MUImageContentViewController setSourceImagePixelSize:](self, "setSourceImagePixelSize:", (double)Width, (double)Height);
    v19 = v34[3];
    v20 = v30[3];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __64__MUImageContentViewController__setImage_withCompletionHandler___block_invoke;
    v24[3] = &unk_24E5D45E0;
    v27 = &v29;
    v26 = &v33;
    v24[4] = self;
    v25 = v7;
    -[MUImageContentViewController _downsampleImageForDisplay:fromImageSource:withCompletionHandler:](self, "_downsampleImageForDisplay:fromImageSource:withCompletionHandler:", v19, v20, v24);

  }
  else
  {
    v21 = (const void *)v30[3];
    if (v21)
    {
      CFRelease(v21);
      v22 = v34[3];
    }
    else
    {
      v22 = 0;
    }
    NSLog(CFSTR("%s: Failed to get a CGImageRef from originalImage: %@"), "-[MUImageContentViewController _setImage:withCompletionHandler:]", v22);
  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
LABEL_29:

}

void __64__MUImageContentViewController__setImage_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  dispatch_time_t v17;
  uint64_t v18;
  _QWORD block[5];

  v5 = a2;
  v6 = a3;
  CGImageRelease(*(CGImageRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  v7 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v7)
  {
    CFRelease(v7);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v5);

    objc_msgSend(*(id *)(a1 + 32), "annotationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_installOverlayOfController:forPageAtIndex:", v9, 0);
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceIdiom");

    if (v11 != 1)
    {
      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(objc_msgSend(v12, "orientation") - 1) >= 2)
      {

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "parentViewController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "safeAreaInsets");
        v16 = v15;

        if (v16 <= 0.0)
        {
          objc_msgSend(*(id *)(a1 + 32), "setLoadCompletionBlock:", *(_QWORD *)(a1 + 40));
          v17 = dispatch_time(0, 200000000);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __64__MUImageContentViewController__setImage_withCompletionHandler___block_invoke_2;
          block[3] = &unk_24E5D4068;
          block[4] = *(_QWORD *)(a1 + 32);
          dispatch_after(v17, MEMORY[0x24BDAC9B8], block);
LABEL_12:

          goto LABEL_13;
        }
      }
    }
    v18 = *(_QWORD *)(a1 + 40);
    if (v18)
      (*(void (**)(void))(v18 + 16))();
    goto LABEL_12;
  }
  NSLog(CFSTR("%@"), v6);
LABEL_13:

}

void __64__MUImageContentViewController__setImage_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "loadCompletionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "loadCompletionBlock");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

    objc_msgSend(*(id *)(a1 + 32), "setLoadCompletionBlock:", 0);
  }
}

- (void)viewDidLayoutSubviews
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  dispatch_time_t v10;
  id v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  MUImageContentViewController *v22;
  id v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)MUImageContentViewController;
  -[MUImageContentViewController viewDidLayoutSubviews](&v24, sel_viewDidLayoutSubviews);
  -[MUImageContentViewController loadCompletionBlock](self, "loadCompletionBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[MUImageContentViewController parentViewController](self, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeAreaInsets");
    v8 = v7;

    if (v8 != 0.0)
    {
      -[MUImageContentViewController loadCompletionBlock](self, "loadCompletionBlock");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUImageContentViewController setLoadCompletionBlock:](self, "setLoadCompletionBlock:", 0);
      v10 = dispatch_time(0, 0);
      v18 = MEMORY[0x24BDAC760];
      v19 = 3221225472;
      v20 = __53__MUImageContentViewController_viewDidLayoutSubviews__block_invoke;
      v21 = &unk_24E5D4608;
      v22 = self;
      v23 = v9;
      v11 = v9;
      dispatch_after(v10, MEMORY[0x24BDAC9B8], &v18);

    }
  }
  -[MUImageContentViewController _updateMinMaxZoomFactor](self, "_updateMinMaxZoomFactor", v18, v19, v20, v21, v22);
  if (-[MUImageContentViewController firstLoadZoomToFit](self, "firstLoadZoomToFit"))
  {
    v12 = -[MUImageContentViewController _imageIsSmallerThanView](self, "_imageIsSmallerThanView");
    v13 = 1.0;
    if (!v12)
      -[MUImageContentViewController _zoomToFitZoomFactor](self, "_zoomToFitZoomFactor", 1.0);
    -[UIScrollView setZoomScale:](self->_scrollView, "setZoomScale:", v13);
  }
  -[UIScrollView zoomScale](self->_scrollView, "zoomScale");
  v15 = v14;
  -[UIScrollView minimumZoomScale](self->_scrollView, "minimumZoomScale");
  if (v15 < v16)
    v15 = v16;
  -[UIScrollView maximumZoomScale](self->_scrollView, "maximumZoomScale");
  if (v15 < v17)
    v17 = v15;
  -[UIScrollView setZoomScale:](self->_scrollView, "setZoomScale:", v17);
}

uint64_t __53__MUImageContentViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  char v2;
  double v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_updateMinMaxZoomFactor");
  v2 = objc_msgSend(*(id *)(a1 + 32), "_imageIsSmallerThanView");
  v3 = 1.0;
  if ((v2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_zoomToFitZoomFactor", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "setZoomScale:", v3);
}

- (void)_setupScrollViewForImageOfScaledSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  id v13;

  height = a3.height;
  width = a3.width;
  -[MUImageContentViewController imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", 0.0, 0.0, width, height);

  -[MUImageContentViewController combinedContentView](self, "combinedContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, width, height);

  -[MUImageContentViewController scrollView](self, "scrollView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[MUImageContentViewController combinedContentView](self, "combinedContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  objc_msgSend(v13, "setContentSize:", v9, v10);

  -[MUImageContentViewController _updateMinMaxZoomFactor](self, "_updateMinMaxZoomFactor");
  v11 = -[MUImageContentViewController _imageIsSmallerThanView](self, "_imageIsSmallerThanView");
  v12 = 1.0;
  if (!v11)
    -[MUImageContentViewController _zoomToFitZoomFactor](self, "_zoomToFitZoomFactor", 1.0);
  objc_msgSend(v13, "setZoomScale:", v12);
  -[MUImageContentViewController setFirstLoadZoomToFit:](self, "setFirstLoadZoomToFit:", 1);

}

- (void)_downsampleImageForDisplay:(CGImage *)a3 fromImageSource:(CGImageSource *)a4 withCompletionHandler:(id)a5
{
  void (**v8)(id, uint64_t, _QWORD);
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  char v24;
  double v25;
  double v26;
  double v27;
  BOOL v28;
  CFDictionaryRef v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  _QWORD block[4];
  void (**v36)(id, uint64_t, _QWORD);
  uint64_t *v37;
  CGImageSource *v38;
  double v39;
  double v40;
  double v41;
  CGImage *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  -[MUImageContentViewController sourceImagePixelSize](self, "sourceImagePixelSize");
  v11 = v9;
  v12 = v10;
  if (v9 >= v10)
    v13 = v9;
  else
    v13 = v10;
  v14 = -[MUImageContentViewController _placeholderCanBeUsedForBaseImageOfSize:](self, "_placeholderCanBeUsedForBaseImageOfSize:");
  v15 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__0;
  v47 = __Block_byref_object_dispose__0;
  if (v14)
  {
    -[MUImageContentViewController tentativePlaceholderImage](self, "tentativePlaceholderImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v48 = v15;
  -[MUImageContentViewController setTentativePlaceholderImage:](self, "setTentativePlaceholderImage:", 0);
  if (v14)
  {
    objc_msgSend((id)v44[5], "size");
    v17 = v16;
    objc_msgSend((id)v44[5], "size");
    if (v17 >= v18)
      v19 = v17;
    else
      v19 = v18;
  }
  else
  {
    -[MUImageContentViewController maxImageDimension](self, "maxImageDimension");
    if (v13 <= v20)
    {
      v21 = 1.0;
      v22 = v11;
      goto LABEL_14;
    }
    -[MUImageContentViewController maxImageDimension](self, "maxImageDimension");
  }
  v21 = v19 / v13;
  v22 = v11 * v21;
  v12 = v12 * v21;
LABEL_14:
  -[MUContentViewController delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_opt_respondsToSelector();
  v26 = v21;
  if ((v24 & 1) != 0)
  {
    objc_msgSend(v23, "adjustedSourceImageSize", v21);
    v25 = v27;
    v28 = v27 == 0.0;
    v26 = v21;
    if (!v28)
      v26 = v11 / v25;
  }
  -[MUImageContentViewController setDownsampledImageScale:](self, "setDownsampledImageScale:", v26, v25);
  -[MUImageContentViewController _setupScrollViewForImageOfScaledSize:](self, "_setupScrollViewForImageOfScaledSize:", v22, v12);
  if (v8)
  {
    if (v14)
    {
      v8[2](v8, v44[5], 0);
    }
    else
    {
      v29 = CGImageSourceCopyPropertiesAtIndex(a4, 0, 0);
      -[__CFDictionary valueForKey:](v29, "valueForKey:", *MEMORY[0x24BDD9698]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v21 >= 1.0 && objc_msgSend(v30, "longLongValue") < 2)
      {
        objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", a3);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)v44[5];
        v44[5] = v33;

        v8[2](v8, v44[5], 0);
      }
      else
      {
        dispatch_get_global_queue(33, 0);
        v32 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __97__MUImageContentViewController__downsampleImageForDisplay_fromImageSource_withCompletionHandler___block_invoke;
        block[3] = &unk_24E5D4658;
        v39 = v22;
        v40 = v12;
        v41 = v21;
        v37 = &v43;
        v38 = a4;
        v42 = a3;
        v36 = v8;
        dispatch_async(v32, block);

      }
    }
  }

  _Block_object_dispose(&v43, 8);
}

void __97__MUImageContentViewController__downsampleImageForDisplay_fromImageSource_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFDictionary *v12;
  CGImageRef ThumbnailAtIndex;
  CGImage *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  _QWORD v33[8];
  _QWORD v34[9];

  v34[8] = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x24BDAC760];
  if (*(_QWORD *)(a1 + 48))
  {
    v3 = *MEMORY[0x24BDD9788];
    v4 = MEMORY[0x24BDBD1C8];
    v34[0] = MEMORY[0x24BDBD1C8];
    v5 = *MEMORY[0x24BDD9808];
    v33[0] = v3;
    v33[1] = v5;
    v6 = *(double *)(a1 + 56);
    if (v6 < *(double *)(a1 + 64))
      v6 = *(double *)(a1 + 64);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v7;
    v33[2] = *MEMORY[0x24BDD97F8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", vcvtpd_s64_f64(1.0 / *(double *)(a1 + 72)));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BDD9820];
    v34[2] = v8;
    v34[3] = v4;
    v10 = *MEMORY[0x24BDD9778];
    v33[3] = v9;
    v33[4] = v10;
    v34[4] = v4;
    v34[5] = &unk_24E5E0630;
    v11 = *MEMORY[0x24BDD97F0];
    v33[5] = *MEMORY[0x24BDD97B8];
    v33[6] = v11;
    v33[7] = *MEMORY[0x24BDD97C8];
    v34[6] = v4;
    v34[7] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 8);
    v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(*(CGImageSourceRef *)(a1 + 48), 0, v12);
    if (ThumbnailAtIndex)
    {
      v14 = ThumbnailAtIndex;
      objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", ThumbnailAtIndex);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

      CGImageRelease(v14);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", *(_QWORD *)(a1 + 80));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AA0], "defaultFormat");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setScale:", 1.0);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:format:", v19, *(double *)(a1 + 56), *(double *)(a1 + 64));
    v30[0] = v2;
    v30[1] = 3221225472;
    v30[2] = __97__MUImageContentViewController__downsampleImageForDisplay_fromImageSource_withCompletionHandler___block_invoke_60;
    v30[3] = &unk_24E5D4588;
    v31 = v18;
    v32 = *(_OWORD *)(a1 + 56);
    v21 = v18;
    objc_msgSend(v20, "imageWithActions:", v30);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

  }
  v27[0] = v2;
  v27[1] = 3221225472;
  v27[2] = __97__MUImageContentViewController__downsampleImageForDisplay_fromImageSource_withCompletionHandler___block_invoke_2;
  v27[3] = &unk_24E5D4630;
  v25 = *(id *)(a1 + 32);
  v26 = *(_QWORD *)(a1 + 40);
  v28 = v25;
  v29 = v26;
  dispatch_async(MEMORY[0x24BDAC9B8], v27);

}

uint64_t __97__MUImageContentViewController__downsampleImageForDisplay_fromImageSource_withCompletionHandler___block_invoke_60(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __97__MUImageContentViewController__downsampleImageForDisplay_fromImageSource_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
}

- (BOOL)_placeholderCanBeUsedForBaseImageOfSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL usePlaceholderAsDisplayImageIfPossible;
  double v13;

  height = a3.height;
  width = a3.width;
  -[MUImageContentViewController tentativePlaceholderImage](self, "tentativePlaceholderImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v8 = v7;
  v10 = v9;
  -[MUImageContentViewController maxImageDimension](self, "maxImageDimension");
  usePlaceholderAsDisplayImageIfPossible = 0;
  if (v6)
  {
    if (v8 >= v10)
      v13 = v8;
    else
      v13 = v10;
    if (v13 >= v11 && v8 <= width && v10 <= height && vabdd_f64(v8 / v10, width / height) < 0.0005)
      usePlaceholderAsDisplayImageIfPossible = self->_usePlaceholderAsDisplayImageIfPossible;
  }

  return usePlaceholderAsDisplayImageIfPossible;
}

- (double)_zoomToFitZoomFactorIncludingScrollViewEdgeInsets
{
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
  double result;

  -[UIScrollView bounds](self->_scrollView, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIScrollView contentInset](self->_scrollView, "contentInset");
  -[MUImageContentViewController _zoomToFitZoomFactorInBounds:](self, "_zoomToFitZoomFactorInBounds:", v4 + v14, v6 + v11, v8 - (v14 + v12), v10 - (v11 + v13));
  return result;
}

- (double)_zoomToFitZoomFactorInBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double result;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = CGRectGetWidth(a3);
  -[UIImageView bounds](self->_imageView, "bounds");
  v9 = v8 / CGRectGetWidth(v12);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v10 = CGRectGetHeight(v13);
  -[UIImageView bounds](self->_imageView, "bounds");
  result = v10 / CGRectGetHeight(v14);
  if (v9 < result)
    result = v9;
  if (result == 0.0)
    return 0.0001;
  return result;
}

- (void)_doubleTap:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v14 = a3;
  -[MUImageContentViewController scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoomScale");
  v6 = v5;
  objc_msgSend(v4, "maximumZoomScale");
  v8 = v7;
  -[MUImageContentViewController _zoomToFitZoomFactor](self, "_zoomToFitZoomFactor");
  v10 = v9;
  if (-[MUImageContentViewController _imageIsSmallerThanView](self, "_imageIsSmallerThanView"))
  {
    v11 = 1.0;
    if (v6 == 1.0)
      v11 = v10;
  }
  else
  {
    objc_msgSend(v4, "setScrollEnabled:", 1);
    if (vabdd_f64(v6, v10) >= 0.0005)
      v11 = v10;
    else
      v11 = v8;
  }
  if (v11 < v8)
    v8 = v11;
  if (vabdd_f64(v8, v6) >= 0.0005)
  {
    objc_msgSend(v14, "locationInView:", self->_imageView);
    -[MUImageContentViewController _zoomRectForScale:withCenter:](self, "_zoomRectForScale:withCenter:", v8, v12, v13);
    self->_inDoubleTapZoom = 1;
    objc_msgSend(v4, "zoomToRect:animated:", 1);
    self->_inDoubleTapZoom = 0;
  }

}

- (CGRect)_zoomRectForScale:(double)a3 withCenter:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  y = a4.y;
  x = a4.x;
  -[MUImageContentViewController scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8 / a3;
  objc_msgSend(v7, "frame");
  v11 = v10 / a3;

  v12 = x - v11 * 0.5;
  v13 = y - v9 * 0.5;
  v14 = v11;
  v15 = v9;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)_imageIsSmallerThanView
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[UIImageView bounds](self->_imageView, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIScrollView bounds](self->_scrollView, "bounds");
  return -[MUImageContentViewController _imageIsSize:isSmallerThanSize:](self, "_imageIsSize:isSmallerThanSize:", v4, v6);
}

- (BOOL)_imageIsSize:(CGSize)a3 isSmallerThanSize:(CGSize)a4
{
  return a3.height < a4.height && a3.width < a4.width;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;
  _QWORD v9[7];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[MUImageContentViewController _prepareToRotate](self, "_prepareToRotate");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __83__MUImageContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_24E5D4680;
  *(double *)&v9[5] = width;
  *(double *)&v9[6] = height;
  v9[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, 0);
  v8.receiver = self;
  v8.super_class = (Class)MUImageContentViewController;
  -[MUImageContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

void __83__MUImageContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v7 = *(double *)(a1 + 40);
  v8 = *(double *)(a1 + 48);

  if (v7 == v4 && v8 == v6)
    objc_msgSend(*(id *)(a1 + 32), "_recoverFromRotation");
}

- (void)_prepareToRotate
{
  double MidX;
  CGFloat v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  id v9;
  CGRect v10;
  CGRect v11;

  -[UIScrollView bounds](self->_scrollView, "bounds");
  MidX = CGRectGetMidX(v10);
  -[UIScrollView bounds](self->_scrollView, "bounds");
  -[UIScrollView convertPoint:toView:](self->_scrollView, "convertPoint:toView:", self->_combinedContentView, MidX, CGRectGetMidY(v11));
  self->_pointToCenterAfterRotation.x = v4;
  self->_pointToCenterAfterRotation.y = v5;
  -[MUImageContentViewController _zoomToFitZoomFactor](self, "_zoomToFitZoomFactor");
  v7 = v6;
  -[MUImageContentViewController scrollView](self, "scrollView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "zoomScale");
  self->_wasZoomToFit = vabdd_f64(v7, v8) < 0.0005;

}

- (void)_recoverFromRotation
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIImageView *imageView;
  double v10;
  double v11;
  BOOL v12;
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;

  v3 = 1.0;
  if (!-[MUImageContentViewController _imageIsSmallerThanView](self, "_imageIsSmallerThanView"))
  {
    -[MUImageContentViewController _zoomToFitZoomFactor](self, "_zoomToFitZoomFactor");
    v3 = v4;
  }
  -[UIScrollView bounds](self->_scrollView, "bounds");
  v6 = v5;
  v8 = v7;
  imageView = self->_imageView;
  -[UIImageView bounds](imageView, "bounds");
  -[UIImageView convertRect:toView:](imageView, "convertRect:toView:", self->_scrollView);
  if (!self->_wasZoomToFit && (v6 >= v10 ? (v12 = v8 < v11) : (v12 = 1), v12))
  {
    -[UIScrollView convertPoint:fromView:](self->_scrollView, "convertPoint:fromView:", self->_combinedContentView, self->_pointToCenterAfterRotation.x, self->_pointToCenterAfterRotation.y);
    v14 = v13;
    v16 = v15;
    -[UIScrollView bounds](self->_scrollView, "bounds");
    v18 = v14 - v17 * 0.5;
    -[UIScrollView bounds](self->_scrollView, "bounds");
    v20 = v16 - v19 * 0.5;
    -[MUImageContentViewController _maximumContentOffset](self, "_maximumContentOffset");
    v22 = v21;
    v24 = v23;
    -[MUImageContentViewController _minimumContentOffset](self, "_minimumContentOffset");
    if (v22 >= v18)
      v27 = v18;
    else
      v27 = v22;
    if (v25 < v27)
      v25 = v27;
    if (v24 >= v20)
      v28 = v20;
    else
      v28 = v24;
    if (v26 < v28)
      v26 = v28;
    -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v25, v26);
  }
  else
  {
    -[UIScrollView setZoomScale:animated:](self->_scrollView, "setZoomScale:animated:", 1, v3);
  }
  -[MUImageContentViewController _updateMinMaxZoomFactor](self, "_updateMinMaxZoomFactor");
}

- (CGPoint)_maximumContentOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[UIScrollView contentSize](self->_scrollView, "contentSize");
  v4 = v3;
  v6 = v5;
  -[UIScrollView bounds](self->_scrollView, "bounds");
  v8 = v4 - v7;
  v10 = v6 - v9;
  result.y = v10;
  result.x = v8;
  return result;
}

- (void)_updateMinMaxZoomFactor
{
  double v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[MUImageContentViewController _zoomToFitZoomFactor](self, "_zoomToFitZoomFactor");
  v4 = v3;
  -[MUImageContentViewController _zoomToFitZoomFactorIncludingScrollViewEdgeInsets](self, "_zoomToFitZoomFactorIncludingScrollViewEdgeInsets");
  v6 = v5;
  v7 = -[MUImageContentViewController _imageIsSmallerThanView](self, "_imageIsSmallerThanView");
  v8 = fmax(v4, 1.0);
  v9 = fmin(v6, 1.3);
  if (v7)
    v10 = v8;
  else
    v10 = 1.3;
  if (v7)
    v11 = 1.0;
  else
    v11 = v9;
  -[UIScrollView setMinimumZoomScale:](self->_scrollView, "setMinimumZoomScale:", v11);
  -[UIScrollView setMaximumZoomScale:](self->_scrollView, "setMaximumZoomScale:", v10);
  -[UIScrollView zoomScale](self->_scrollView, "zoomScale");
  if (v12 < v11)
    -[UIScrollView setZoomScale:](self->_scrollView, "setZoomScale:", v11);
}

- (CGPoint)_minimumContentOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x24BDBEFB0];
  v3 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGRect)_annotationRectInOverlay:(id)a3 pageIndex:(unint64_t)a4
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  objc_msgSend(a3, "rectangle");
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  MinX = CGRectGetMinX(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MinY = CGRectGetMinY(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  MaxX = CGRectGetMaxX(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MaxY = CGRectGetMaxY(v27);
  -[MUContentViewController annotationController](self, "annotationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUImageContentViewController convertPoint:fromModelToOverlayWithPageIndex:forAnnotationController:](self, "convertPoint:fromModelToOverlayWithPageIndex:forAnnotationController:", a4, v14, MinX, MinY);
  v16 = v15;
  v18 = v17;

  -[MUContentViewController annotationController](self, "annotationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUImageContentViewController convertPoint:fromModelToOverlayWithPageIndex:forAnnotationController:](self, "convertPoint:fromModelToOverlayWithPageIndex:forAnnotationController:", a4, v19, MaxX, MaxY);
  v21 = v20;
  v23 = v22;

  v28.size.width = v21 - v16;
  v28.size.height = v23 - v18;
  v28.origin.x = v16;
  v28.origin.y = v18;
  return CGRectStandardize(v28);
}

- (void)_annotationWillBeginEditing:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE039E8]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[MUImageContentViewController setEditingAnnotaiton:](self, "setEditingAnnotaiton:", v5);
}

- (void)_annotationDidEndEditing:(id)a3
{
  -[MUImageContentViewController setEditingAnnotaiton:](self, "setEditingAnnotaiton:", 0);
}

- (unint64_t)_pageIndexForAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v4 = a3;
  -[MUContentViewController annotationController](self, "annotationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modelController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pageModelControllerForAnnotation:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "modelController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pageModelControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfObject:", v7);

  return v10;
}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;

  -[MUImageContentViewController _adjustScrollViewForKeyboardNotification:](self, "_adjustScrollViewForKeyboardNotification:", a3);
  -[MUImageContentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  -[MUImageContentViewController setZoomToFitRestoreValue:](self, "setZoomToFitRestoreValue:", -[MUImageContentViewController firstLoadZoomToFit](self, "firstLoadZoomToFit"));
  -[MUImageContentViewController setFirstLoadZoomToFit:](self, "setFirstLoadZoomToFit:", 0);
}

- (void)_keyboardWillHide:(id)a3
{
  void *v4;

  -[MUImageContentViewController _adjustScrollViewForKeyboardNotification:](self, "_adjustScrollViewForKeyboardNotification:", a3);
  -[MUImageContentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  -[MUImageContentViewController setFirstLoadZoomToFit:](self, "setFirstLoadZoomToFit:", -[MUImageContentViewController zoomToFitRestoreValue](self, "zoomToFitRestoreValue"));
}

- (void)_adjustScrollViewForKeyboardNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
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
  void *v24;
  void *v25;
  float v26;
  float v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  id v39;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", *MEMORY[0x24BDF7A18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGRectValue");
  v38 = v7;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v4, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valueForKey:", *MEMORY[0x24BDF7A20]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "CGRectValue");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  objc_msgSend(v4, "userInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "valueForKey:", *MEMORY[0x24BDF79C0]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "floatValue");
  v27 = v26;

  objc_msgSend(v4, "userInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "valueForKey:", *MEMORY[0x24BDF79B8]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "unsignedIntegerValue");

  -[MUImageContentViewController editingAnnotaiton](self, "editingAnnotaiton");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  v31 = -[MUImageContentViewController _pageIndexForAnnotation:](self, "_pageIndexForAnnotation:", v39);
  if (v39 && v31 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[MUContentViewController annotationController](self, "annotationController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "overlayViewAtIndex:", v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    -[MUImageContentViewController _annotationRectInOverlay:pageIndex:](self, "_annotationRectInOverlay:pageIndex:", v39, v31);
    objc_msgSend(v33, "convertRect:toView:", 0);
    -[MUImageContentViewController adjustScrollViewToAccomodateKeyboardStartingFrame:endingFrame:annotationFrame:inOverlayView:withAnimationDuration:curve:](self, "adjustScrollViewToAccomodateKeyboardStartingFrame:endingFrame:annotationFrame:inOverlayView:withAnimationDuration:curve:", v33, v30, v38, v9, v11, v13, v17, v19, v21, v23, v34, v35, v36, v37, v27);

  }
}

- (void)adjustScrollViewToAccomodateKeyboardStartingFrame:(double)a3 endingFrame:(double)a4 annotationFrame:(double)a5 inOverlayView:(CGFloat)a6 withAnimationDuration:(CGFloat)a7 curve:(CGFloat)a8
{
  void *v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double x;
  double y;
  CGFloat width;
  double height;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  BOOL v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  dispatch_time_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  CGFloat v64;
  double v65;
  double v66;
  double v67;
  double rect2a;
  double v70;
  CGRect rect;
  void *v72;
  id v73;
  double v74;
  double v75;
  double v76;
  double v77;
  _QWORD v78[4];
  id v79;
  double v80;
  double v81;
  double v82;
  double v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;

  objc_msgSend(a1, "scrollView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "superview");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  objc_msgSend(v26, "convertRect:toView:", 0);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  v88.origin.x = v28;
  v88.origin.y = v30;
  v88.size.width = v32;
  v88.size.height = v34;
  v70 = -(a7 - CGRectGetMaxY(v88));
  rect.origin.x = *(CGFloat *)MEMORY[0x24BDBF070];
  v67 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v66 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v65 = *(double *)(MEMORY[0x24BDBF070] + 24);
  objc_msgSend(v25, "bounds");
  objc_msgSend(v25, "convertRect:toView:", 0);
  x = v89.origin.x;
  y = v89.origin.y;
  width = v89.size.width;
  height = v89.size.height;
  v94.origin.x = a6;
  v94.origin.y = a7;
  v94.size.width = a8;
  v94.size.height = a9;
  if (CGRectIntersectsRect(v89, v94))
  {
    v90.origin.x = x;
    v90.origin.y = y;
    v90.size.width = width;
    v90.size.height = height;
    v95.origin.x = a6;
    v95.origin.y = a7;
    v95.size.width = a8;
    v95.size.height = a9;
    v91 = CGRectIntersection(v90, v95);
    v64 = height - (CGRectGetHeight(v91) + 0.0);
    objc_msgSend(v25, "convertRect:fromView:", 0, a13, a14, a15, a16);
    rect2a = v39;
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v92.origin.x = x + 0.0;
    v92.size.height = v64;
    v92.origin.y = y + 0.0;
    v92.size.width = width;
    v96.origin.x = a13;
    v96.origin.y = a14;
    v96.size.width = a15;
    v96.size.height = a16;
    v46 = CGRectContainsRect(v92, v96);
    v47 = v65;
    v48 = v66;
    if (!v46)
    {
      v47 = v45;
      v48 = v43;
    }
    v49 = v67;
    if (!v46)
      v49 = v41;
    v50 = rect.origin.x;
    if (!v46)
      v50 = rect2a;
    rect.origin.x = v50;
  }
  else
  {
    v47 = v65;
    v48 = v66;
    v49 = v67;
  }
  objc_msgSend(v25, "contentInset");
  v52 = v51;
  objc_msgSend(v25, "_contentScrollInset");
  v54 = v53;
  v56 = v55;
  v58 = v57;
  if (v52 >= v70)
    v59 = 0.0;
  else
    v59 = v70 - v52;
  v93.origin.x = rect.origin.x;
  v93.origin.y = v49;
  v93.size.width = v48;
  v93.size.height = v47;
  if (CGRectIsNull(v93))
  {
    if (v59 <= 0.0)
    {
      objc_msgSend(v25, "_setContentScrollInset:", v54, v56, v59, v58);
      goto LABEL_22;
    }
    v60 = dispatch_time(0, (uint64_t)(a17 * 1000000000.0));
    *(_QWORD *)&rect.origin.y = MEMORY[0x24BDAC760];
    *(_QWORD *)&rect.size.width = 3221225472;
    *(_QWORD *)&rect.size.height = __152__MUImageContentViewController_adjustScrollViewToAccomodateKeyboardStartingFrame_endingFrame_annotationFrame_inOverlayView_withAnimationDuration_curve___block_invoke_2;
    v72 = &unk_24E5D46D0;
    v73 = v25;
    v74 = v54;
    v75 = v56;
    v76 = v59;
    v77 = v58;
    dispatch_after(v60, MEMORY[0x24BDAC9B8], &rect.origin.y);
    v61 = v73;
  }
  else
  {
    if ((unint64_t)(a12 - 1) >= 3)
      v62 = 4;
    else
      v62 = ((a12 - 1) << 16) + 65540;
    v63 = (void *)MEMORY[0x24BDF6F90];
    v78[0] = MEMORY[0x24BDAC760];
    v78[1] = 3221225472;
    v78[2] = __152__MUImageContentViewController_adjustScrollViewToAccomodateKeyboardStartingFrame_endingFrame_annotationFrame_inOverlayView_withAnimationDuration_curve___block_invoke;
    v78[3] = &unk_24E5D46A8;
    v79 = v25;
    v80 = v54;
    v81 = v56;
    v82 = v59;
    v83 = v58;
    v84 = rect.origin.x;
    v85 = v49;
    v86 = v48;
    v87 = v47;
    objc_msgSend(v63, "animateWithDuration:delay:options:animations:completion:", v62, v78, 0, a17, 0.0);
    v61 = v79;
  }

LABEL_22:
}

uint64_t __152__MUImageContentViewController_adjustScrollViewToAccomodateKeyboardStartingFrame_endingFrame_annotationFrame_inOverlayView_withAnimationDuration_curve___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setContentScrollInset:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "scrollRectToVisible:animated:", 0, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

uint64_t __152__MUImageContentViewController_adjustScrollViewToAccomodateKeyboardStartingFrame_endingFrame_annotationFrame_inOverlayView_withAnimationDuration_curve___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setContentScrollInset:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MUImageContentViewController scrollView](self, "scrollView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4 == v7)
  {
    -[MUImageContentViewController setFirstLoadZoomToFit:](self, "setFirstLoadZoomToFit:", 0);
    -[MUImageContentViewController setCentersIgnoringContentInsets:](self, "setCentersIgnoringContentInsets:", 0);
    -[MUImageContentViewController scrollViewDelegate](self, "scrollViewDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "scrollViewWillBeginDragging:", v7);

    v5 = v7;
  }

}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[MUImageContentViewController scrollView](self, "scrollView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v9)
  {
    -[MUImageContentViewController setFirstLoadZoomToFit:](self, "setFirstLoadZoomToFit:", 0);
    -[MUImageContentViewController setCentersIgnoringContentInsets:](self, "setCentersIgnoringContentInsets:", 0);
    if (!self->_inDoubleTapZoom)
      objc_msgSend(v9, "setScrollEnabled:", 1);
    -[MUImageContentViewController scrollViewDelegate](self, "scrollViewDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "scrollViewWillBeginZooming:withView:", v9, v6);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  id v5;
  char v6;
  id v7;

  v7 = a3;
  -[MUImageContentViewController scrollViewDelegate](self, "scrollViewDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUImageContentViewController scrollView](self, "scrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v7 && v4)
  {
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
      objc_msgSend(v4, "scrollViewDidScroll:", v7);
  }
  else
  {

  }
}

- (void)scrollViewDidZoom:(id)a3
{
  void *v4;
  id v5;
  char v6;
  id v7;

  v7 = a3;
  -[MUImageContentViewController scrollViewDelegate](self, "scrollViewDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUImageContentViewController scrollView](self, "scrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v7 && v4)
  {
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
      objc_msgSend(v4, "scrollViewDidZoom:", v7);
  }
  else
  {

  }
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4;
  id v5;
  char v6;
  void *v7;

  v4 = a3;
  -[MUImageContentViewController scrollView](self, "scrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[MUImageContentViewController setCentersIgnoringContentInsets:](self, "setCentersIgnoringContentInsets:", 0);
    -[MUImageContentViewController scrollViewDelegate](self, "scrollViewDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
      v6 = objc_msgSend(v7, "scrollViewShouldScrollToTop:", v4);
    else
      v6 = 1;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromOverlayToModelWithPageIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGPoint result;
  CGRect v21;

  y = a3.y;
  x = a3.x;
  objc_msgSend(a5, "overlayViewAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:toView:", self->_imageView, x, y);
  v10 = v9;
  v12 = v11;
  -[UIImageView bounds](self->_imageView, "bounds");
  v13 = CGRectGetHeight(v21) - v12;
  -[MUImageContentViewController downsampledImageScale](self, "downsampledImageScale");
  v15 = v10 / v14;
  -[MUImageContentViewController downsampledImageScale](self, "downsampledImageScale");
  v17 = v13 / v16;

  v18 = v15;
  v19 = v17;
  result.y = v19;
  result.x = v18;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromModelToOverlayWithPageIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPoint result;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  objc_msgSend(a5, "overlayViewAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUImageContentViewController downsampledImageScale](self, "downsampledImageScale");
  v10 = x * v9;
  -[MUImageContentViewController downsampledImageScale](self, "downsampledImageScale");
  v12 = y * v11;
  -[UIImageView bounds](self->_imageView, "bounds");
  objc_msgSend(v8, "convertPoint:fromView:", self->_imageView, v10, CGRectGetHeight(v20) - v12);
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.y = v18;
  result.x = v17;
  return result;
}

- (CGRect)maxPageRectWithPageIndex:(unint64_t)a3 forAnnotationController:(id)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
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
  CGRect result;

  -[MUImageContentViewController imageView](self, "imageView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[MUImageContentViewController downsampledImageScale](self, "downsampledImageScale");
  v15 = v11 / v14;
  -[MUImageContentViewController downsampledImageScale](self, "downsampledImageScale");
  v17 = v13 / v16;
  v18 = v7;
  v19 = v9;
  v20 = v15;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (id)newContentSnapshotPDFDataIncludingAdornments:(BOOL)a3 atScale:(double)a4 inRect:(CGRect)a5 onOverlayAtPageIndex:(unint64_t)a6 forAnnotationController:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  void *v15;
  id v16;
  CGImage *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double MaxY;
  double v29;
  size_t v30;
  size_t v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
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
  CGFloat v54;
  double v55;
  double v56;
  CGRect mediaBox;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a7;
  -[MUImageContentViewController imageView](self, "imageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "image");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = (CGImage *)objc_msgSend(v16, "CGImage");

  objc_msgSend(v14, "overlayViewAtIndex:", a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUImageContentViewController imageView](self, "imageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "convertRect:fromView:", v18, x, y, width, height);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  -[UIImageView bounds](self->_imageView, "bounds");
  MaxY = CGRectGetMaxY(v58);
  v59.origin.x = v21;
  v59.origin.y = v23;
  v59.size.width = v25;
  v59.size.height = v27;
  v29 = MaxY - CGRectGetMaxY(v59);
  mediaBox.origin = (CGPoint)*MEMORY[0x24BDBEFB0];
  mediaBox.size.width = v25 * a4;
  mediaBox.size.height = v27 * a4;
  v30 = CGImageGetWidth(v17);
  v31 = CGImageGetHeight(v17);
  v60.origin.x = v21;
  v60.origin.y = v29;
  v60.size.width = v25;
  v60.size.height = v27;
  v61 = CGRectIntegral(v60);
  v32 = v61.origin.y;
  v33 = v61.size.width;
  v34 = v61.size.height;
  v55 = v61.origin.x;
  v56 = CGRectGetWidth(v61);
  v62.origin.x = v55;
  v62.origin.y = v32;
  v62.size.width = v33;
  v54 = v34;
  v62.size.height = v34;
  v35 = CGRectGetHeight(v62);
  v63.origin.x = v21;
  v63.origin.y = v29;
  v63.size.width = v25;
  v63.size.height = v27;
  if (CGRectIsEmpty(v63))
    goto LABEL_16;
  v36 = vcvtad_u64_f64(v56);
  v37 = vcvtad_u64_f64(v35);
  ColorSpace = CGImageGetColorSpace(v17);
  if (!ColorSpace || (v39 = ColorSpace, CGColorSpaceUsesExtendedRange(ColorSpace)) || CGColorSpaceIsWideGamutRGB(v39))
  {
    v40 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
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
    v44 = (double)v30;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(v43, (CGColorRef)objc_msgSend(v45, "CGColor"));

    v64.size.height = v54;
    v64.origin.x = v55;
    v64.origin.y = v32;
    v64.size.width = v33;
    CGContextFillRect(v43, v64);
    CGContextTranslateCTM(v43, -v55, -v32);
    CGContextSetInterpolationQuality(v43, kCGInterpolationNone);
    v65.origin.x = 0.0;
    v65.origin.y = 0.0;
    v65.size.width = v44;
    v65.size.height = (double)v31;
    CGContextDrawImage(v43, v65, v17);
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
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
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
        CGContextScaleCTM(v52, a4, a4);
        CGContextTranslateCTM(v52, -(v21 - v55), -(v29 - v32));
        CGContextSetInterpolationQuality(v52, kCGInterpolationNone);
        v66.origin.x = 0.0;
        v66.origin.y = 0.0;
        v66.size.width = (double)(unint64_t)round(v56);
        v66.size.height = (double)(unint64_t)round(v35);
        CGContextDrawImage(v52, v66, Image);
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

- (id)undoManagerForAnnotationController:(id)a3
{
  void *v4;
  void *v5;

  -[MUContentViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "undoManagerForContentViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)popoverPresentingViewControllerForAnnotationController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MUContentViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "popoverPresentingViewControllerForAnnotationController:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)installDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  id v6;
  id v7;

  v6 = a3;
  -[MUImageContentViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addGestureRecognizer:", v6);

}

- (void)uninstallDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(v5, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeGestureRecognizer:", v5);

}

- (void)updateDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 withPriority:(BOOL)a5 forAnnotationController:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
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
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _QWORD v55[6];

  v7 = a5;
  v55[4] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a6;
  objc_msgSend(v10, "tapGestureRecognizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v11;
  objc_msgSend(v10, "pressGestureRecognizer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v12;
  objc_msgSend(v10, "panGestureRecognizer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v13;
  v39 = v10;
  objc_msgSend(v10, "rotationGestureRecognizer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUImageContentViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "gestureRecognizers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObjectsFromArray:", v18);

  -[MUImageContentViewController scrollView](self, "scrollView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "gestureRecognizers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObjectsFromArray:", v20);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "minusSet:", v21);

  objc_msgSend(v16, "removeObject:", v9);
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v22 = v15;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v49 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(v9, "requireGestureRecognizerToFail:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v24);
  }

  if (v7)
  {
    v46 = 0uLL;
    v47 = 0uLL;
    v44 = 0uLL;
    v45 = 0uLL;
    v27 = v16;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v45 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
          objc_msgSend(v9, "removeFailureRequirement:", v32);
          if ((objc_opt_respondsToSelector() & 1) == 0
            || objc_msgSend(v32, "_acceptsFailureRequirements"))
          {
            objc_msgSend(v32, "requireGestureRecognizerToFail:", v9);
          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      }
      while (v29);
    }
  }
  else
  {
    v42 = 0uLL;
    v43 = 0uLL;
    v40 = 0uLL;
    v41 = 0uLL;
    v33 = v16;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v41;
      do
      {
        for (k = 0; k != v35; ++k)
        {
          if (*(_QWORD *)v41 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * k);
          objc_msgSend(v38, "removeFailureRequirement:", v9);
          if ((objc_opt_respondsToSelector() & 1) == 0
            || objc_msgSend(v38, "_acceptsFailureRequirements"))
          {
            objc_msgSend(v9, "requireGestureRecognizerToFail:", v38);
          }
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
      }
      while (v35);
    }
  }

}

- (double)modelBaseScaleFactorOfPageAtIndex:(unint64_t)a3 forAnnotationController:(id)a4
{
  void *v6;
  double v7;
  double v8;

  -[MUContentViewController delegate](self, "delegate", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modelBaseScaleFactorOfPageAtIndex:forContentViewController:", a3, self);
  v8 = v7;

  return v8;
}

- (id)controller:(id)a3 willSetToolbarItems:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[MUContentViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "annotationControllerOfContentViewController:willSetToolbarItems:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)positionSketchOverlay:(id)a3 forAnnotationController:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[MUContentViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "positionSketchOverlay:forContentViewController:", v5, self);

}

- (BOOL)controllerShouldDetectFormElements:(id)a3
{
  return 0;
}

- (id)layerContainingQuickBackgroundForLoupeOnOverlayAtPageIndex:(unint64_t)a3 forAnnotationController:(id)a4
{
  void *v4;
  void *v5;

  -[MUImageContentViewController imageView](self, "imageView", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)shouldPlaceFormElementAtPoint:(CGPoint)a3 onOverlayAtPageIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  return 0;
}

- (BOOL)shouldPlaceProposedFormElementAtRect:(CGRect)a3 onOverlayAtPageIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  return 0;
}

- (void)controllerDidEnterToolMode:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[MUImageContentViewController scrollView](self, "scrollView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "panGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumNumberOfTouches:", 2);

  -[MUImageContentViewController localDoubleTapRecognizer](self, "localDoubleTapRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 0);

}

- (void)controllerDidExitToolMode:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[MUImageContentViewController scrollView](self, "scrollView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "panGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumNumberOfTouches:", 1);

  -[MUImageContentViewController localDoubleTapRecognizer](self, "localDoubleTapRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 1);

}

- (void)editDetectedForAnnotationController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MUContentViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editDetectedForAnnotationController:", v4);

}

- (void)editCheckpointReachedForAnnotationController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MUContentViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editCheckpointReachedForAnnotationController:", v4);

}

- (void)penStrokeCompletedForAnnotationController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MUContentViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "penStrokeCompletedForAnnotationController:", v4);

}

- (void)controllerWillShowSignatureCaptureView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MUContentViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controllerWillShowSignatureCaptureView:", v4);

}

- (void)controllerWillDismissSignatureCaptureView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MUContentViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controllerWillDismissSignatureCaptureView:", v4);

}

- (void)controllerWillShowSignatureManagerView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MUContentViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controllerWillShowSignatureManagerView:", v4);

}

- (void)controllerWillDismissSignatureManagerView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MUContentViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controllerWillDismissSignatureManagerView:", v4);

}

- (BOOL)supportsImageDescriptionEditing
{
  return 1;
}

- (NSString)originalImageDescription
{
  void *v2;
  void *v3;

  -[MUContentViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "originalImageDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)centersIgnoringContentInsets
{
  return self->_centersIgnoringContentInsets;
}

- (void)setCentersIgnoringContentInsets:(BOOL)a3
{
  self->_centersIgnoringContentInsets = a3;
}

- (UIImage)tentativePlaceholderImage
{
  return self->_tentativePlaceholderImage;
}

- (void)setTentativePlaceholderImage:(id)a3
{
  objc_storeStrong((id *)&self->_tentativePlaceholderImage, a3);
}

- (double)maxImageDimension
{
  return self->_maxImageDimension;
}

- (void)setMaxImageDimension:(double)a3
{
  self->_maxImageDimension = a3;
}

- (UIView)combinedContentView
{
  return self->_combinedContentView;
}

- (void)setCombinedContentView:(id)a3
{
  objc_storeStrong((id *)&self->_combinedContentView, a3);
}

- (unint64_t)inkStyle
{
  return self->_inkStyle;
}

- (UIScrollViewDelegate)scrollViewDelegate
{
  return (UIScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_scrollViewDelegate);
}

- (void)setScrollViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_scrollViewDelegate, a3);
}

- (id)sourceContent
{
  return objc_getProperty(self, a2, 1048, 1);
}

- (void)setSourceContent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1048);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (CGSize)sourceImagePixelSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_sourceImagePixelSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSourceImagePixelSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_sourceImagePixelSize, &v3, 16, 1, 0);
}

- (double)downsampledImageScale
{
  return self->_downsampledImageScale;
}

- (void)setDownsampledImageScale:(double)a3
{
  self->_downsampledImageScale = a3;
}

- (BOOL)usePlaceholderAsDisplayImageIfPossible
{
  return self->_usePlaceholderAsDisplayImageIfPossible;
}

- (void)setUsePlaceholderAsDisplayImageIfPossible:(BOOL)a3
{
  self->_usePlaceholderAsDisplayImageIfPossible = a3;
}

- (BOOL)inDoubleTapZoom
{
  return self->_inDoubleTapZoom;
}

- (void)setInDoubleTapZoom:(BOOL)a3
{
  self->_inDoubleTapZoom = a3;
}

- (id)loadCompletionBlock
{
  return objc_getProperty(self, a2, 1080, 1);
}

- (void)setLoadCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1080);
}

- (UITapGestureRecognizer)localDoubleTapRecognizer
{
  return (UITapGestureRecognizer *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setLocalDoubleTapRecognizer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1088);
}

- (BOOL)didSetup
{
  return self->_didSetup;
}

- (void)setDidSetup:(BOOL)a3
{
  self->_didSetup = a3;
}

- (AKRectAnnotation)editingAnnotaiton
{
  return (AKRectAnnotation *)objc_loadWeakRetained((id *)&self->_editingAnnotaiton);
}

- (void)setEditingAnnotaiton:(id)a3
{
  objc_storeWeak((id *)&self->_editingAnnotaiton, a3);
}

- (AKPageController)pageController
{
  return (AKPageController *)objc_loadWeakRetained((id *)&self->_pageController);
}

- (void)setPageController:(id)a3
{
  objc_storeWeak((id *)&self->_pageController, a3);
}

- (BOOL)firstLoadZoomToFit
{
  return self->_firstLoadZoomToFit;
}

- (void)setFirstLoadZoomToFit:(BOOL)a3
{
  self->_firstLoadZoomToFit = a3;
}

- (BOOL)zoomToFitRestoreValue
{
  return self->_zoomToFitRestoreValue;
}

- (void)setZoomToFitRestoreValue:(BOOL)a3
{
  self->_zoomToFitRestoreValue = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pageController);
  objc_destroyWeak((id *)&self->_editingAnnotaiton);
  objc_storeStrong((id *)&self->_localDoubleTapRecognizer, 0);
  objc_storeStrong(&self->_loadCompletionBlock, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong(&self->_sourceContent, 0);
  objc_destroyWeak((id *)&self->_scrollViewDelegate);
  objc_storeStrong((id *)&self->_combinedContentView, 0);
  objc_storeStrong((id *)&self->_tentativePlaceholderImage, 0);
}

@end
