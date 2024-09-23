@implementation ICDocCamZoomablePageContentViewController

- (ICDocCamZoomablePageContentViewController)init
{
  void *v3;
  ICDocCamZoomablePageContentViewController *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)ICDocCamZoomablePageContentViewController;
  v4 = -[ICDocCamZoomablePageContentViewController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, CFSTR("ICDocCamZoomablePageContentViewController"), v3);

  return v4;
}

- (void)analyzeCurrentImageIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (+[DCImageAnalyzerManager isImageAnalysisEnabled](DCImageAnalyzerManager, "isImageAnalysisEnabled"))
  {
    -[ICDocCamZoomablePageContentViewController image](self, "image");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_initWeak(&location, self);
      +[DCImageAnalyzerManager sharedInstance](DCImageAnalyzerManager, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamZoomablePageContentViewController image](self, "image");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __75__ICDocCamZoomablePageContentViewController_analyzeCurrentImageIfNecessary__block_invoke;
      v6[3] = &unk_24C5B8408;
      objc_copyWeak(&v7, &location);
      objc_msgSend(v4, "analysisForImage:completionHandler:", v5, v6);

      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

void __75__ICDocCamZoomablePageContentViewController_analyzeCurrentImageIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __75__ICDocCamZoomablePageContentViewController_analyzeCurrentImageIfNecessary__block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v15 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "analysisInteraction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAnalysis:", v5);

    objc_msgSend(v15, "analysisInteraction");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActiveInteractionTypes:", 3);

  }
}

- (void)viewDidLoad
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
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
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v29.receiver = self;
  v29.super_class = (Class)ICDocCamZoomablePageContentViewController;
  -[ICDocCamZoomablePageContentViewController viewDidLoad](&v29, sel_viewDidLoad);
  if (+[DCImageAnalyzerManager isImageAnalysisEnabled](DCImageAnalyzerManager, "isImageAnalysisEnabled"))
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x2050000000;
    v3 = (void *)getVKCImageAnalysisInteractionClass_softClass;
    v34 = getVKCImageAnalysisInteractionClass_softClass;
    if (!getVKCImageAnalysisInteractionClass_softClass)
    {
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __getVKCImageAnalysisInteractionClass_block_invoke;
      v30[3] = &unk_24C5B8008;
      v30[4] = &v31;
      __getVKCImageAnalysisInteractionClass_block_invoke((uint64_t)v30);
      v3 = (void *)v32[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v31, 8);
    v5 = objc_alloc_init(v4);
    -[ICDocCamZoomablePageContentViewController setAnalysisInteraction:](self, "setAnalysisInteraction:", v5);

    -[ICDocCamZoomablePageContentViewController analysisInteraction](self, "analysisInteraction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActiveInteractionTypes:", 0);

    -[ICDocCamZoomablePageContentViewController imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamZoomablePageContentViewController analysisInteraction](self, "analysisInteraction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addInteraction:", v8);

  }
  -[ICDocCamZoomablePageContentViewController image](self, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamZoomablePageContentViewController imageView](self, "imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v9);

  -[ICDocCamZoomablePageContentViewController imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityIgnoresInvertColors:", 1);

  v12 = objc_opt_class();
  -[ICDocCamZoomablePageContentViewController imageView](self, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  DCCheckedDynamicCast(v12, (uint64_t)v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPageContentViewDelegate:", self);

  -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", self);

  -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMinimumZoomScale:", 1.0);

  -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMaximumZoomScale:", 0.5);

  v18 = *MEMORY[0x24BDF7D78];
  -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDecelerationRate:", v18);

  -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  -[ICDocCamZoomablePageContentViewController setPrevScrollViewSize:](self, "setPrevScrollViewSize:", v21, v22);

  -[ICDocCamZoomablePageContentViewController setShouldSetupScalesInViewDidLayoutSubviews:](self, "setShouldSetupScalesInViewDidLayoutSubviews:", 1);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_singleTap);
  objc_msgSend(v23, "setNumberOfTapsRequired:", 1);
  objc_msgSend(v23, "setAllowedTouchTypes:", &unk_24C5D8518);
  -[ICDocCamZoomablePageContentViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addGestureRecognizer:", v23);

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_doubleTap_);
  objc_msgSend(v25, "setNumberOfTapsRequired:", 2);
  objc_msgSend(v25, "setAllowedTouchTypes:", &unk_24C5D8530);
  -[ICDocCamZoomablePageContentViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addGestureRecognizer:", v25);

  objc_msgSend(v23, "requireGestureRecognizerToFail:", v25);
  -[ICDocCamZoomablePageContentViewController imageView](self, "imageView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setUserInteractionEnabled:", 1);

  -[ICDocCamZoomablePageContentViewController analyzeCurrentImageIfNecessary](self, "analyzeCurrentImageIfNecessary");
  -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setContentInsetAdjustmentBehavior:", 2);

}

- (void)resetZoom
{
  void *v3;
  id v4;

  -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minimumZoomScale");
  objc_msgSend(v4, "setZoomScale:animated:", 0);

}

- (void)resetImageCentering
{
  void *v3;
  double MidX;
  void *v5;
  double MidY;
  id v7;
  CGRect v8;
  CGRect v9;

  -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  MidX = CGRectGetMidX(v8);
  -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  MidY = CGRectGetMidY(v9);

  -[ICDocCamZoomablePageContentViewController imageView](self, "imageView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamZoomablePageContentViewController view:setCenter:](self, "view:setCenter:", v7, MidX, MidY);

}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICDocCamZoomablePageContentViewController;
  -[ICDocCamZoomablePageContentViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[ICDocCamZoomablePageContentViewController setupAccessibility](self, "setupAccessibility");
}

- (void)setImage:(id)a3
{
  _BOOL8 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (-[ICDocCamZoomablePageContentViewController shouldSetupScalesInViewDidLayoutSubviews](self, "shouldSetupScalesInViewDidLayoutSubviews"))
  {
    v5 = 1;
  }
  else
  {
    -[UIImage size](self->_image, "size");
    v7 = v6;
    v9 = v8;
    objc_msgSend(v15, "size");
    v5 = v9 != v11 || v7 != v10;
  }
  -[ICDocCamZoomablePageContentViewController setShouldSetupScalesInViewDidLayoutSubviews:](self, "setShouldSetupScalesInViewDidLayoutSubviews:", v5);
  objc_storeStrong((id *)&self->_image, a3);
  -[ICDocCamZoomablePageContentViewController viewIfLoaded](self, "viewIfLoaded");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[ICDocCamZoomablePageContentViewController imageView](self, "imageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setImage:", v15);

    -[ICDocCamZoomablePageContentViewController analyzeCurrentImageIfNecessary](self, "analyzeCurrentImageIfNecessary");
    if (-[ICDocCamZoomablePageContentViewController shouldSetupScalesInViewDidLayoutSubviews](self, "shouldSetupScalesInViewDidLayoutSubviews"))
    {
      -[ICDocCamZoomablePageContentViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setNeedsLayout");

    }
  }

}

- (double)zoomScale
{
  void *v2;
  double v3;
  double v4;

  -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoomScale");
  v4 = v3;

  return v4;
}

- (void)view:(id)a3 setCenter:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
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
  id v23;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentOffset");
  v14 = v13;
  v16 = v15;

  v17 = x - v9 * 0.5;
  v18 = y - v11 * 0.5;
  if (v17 >= 0.0)
    v19 = v14;
  else
    v19 = -v17;
  if (v17 >= 0.0)
    v20 = x - v9 * 0.5;
  else
    v20 = 0.0;
  if (v18 >= 0.0)
    v21 = v16;
  else
    v21 = -v18;
  if (v18 >= 0.0)
    v22 = v18;
  else
    v22 = 0.0;
  objc_msgSend(v7, "setFrame:", v20, v22, v9, v11);

  -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setContentOffset:", v19, v21);

}

- (CGRect)zoomRectForScale:(float)a3 withCenter:(CGPoint)a4
{
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  y = a4.y;
  x = a4.x;
  -[ICDocCamZoomablePageContentViewController imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v9 = a3;
  v11 = v10 / a3;

  -[ICDocCamZoomablePageContentViewController imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13 / v9;

  -[ICDocCamZoomablePageContentViewController imageView](self, "imageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamZoomablePageContentViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "convertPoint:fromView:", v16, x, y);
  v18 = v17;
  v20 = v19;

  v21 = v18 - v14 * 0.5;
  v22 = v20 - v11 * 0.5;
  v23 = v14;
  v24 = v11;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  id v5;

  -[ICDocCamZoomablePageContentViewController pageContentDelegate](self, "pageContentDelegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hideBarsForZoomablePageContentViewController:", self);

}

- (void)scrollViewDidZoom:(id)a3
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
  id v15;

  v15 = a3;
  objc_msgSend(v15, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewForZoomingInScrollView:", v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v15, "bounds");
  v9 = 0.0;
  v10 = 0.0;
  if (v6 < v11)
  {
    objc_msgSend(v15, "bounds");
    v10 = (v12 - v6) * 0.5;
  }
  objc_msgSend(v15, "bounds");
  if (v8 < v13)
  {
    objc_msgSend(v15, "bounds");
    v9 = (v14 - v8) * 0.5;
  }
  objc_msgSend(v4, "setFrame:", v10, v9, v6, v8);

}

- (void)setupScales
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;

  -[ICDocCamZoomablePageContentViewController image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;
  -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentSize:", v5, v7);

  -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;

  -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentSize");
  v16 = v11 / v15;

  -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentSize");
  v19 = v13 / v18;

  if (v16 >= v19)
    v16 = v19;
  -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMinimumZoomScale:", v16);

  -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setMaximumZoomScale:", 1.0);

  -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setZoomScale:", v16);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double MidX;
  void *v49;
  double MidY;
  void *v51;
  objc_super v52;
  CGRect v53;
  CGRect v54;

  v52.receiver = self;
  v52.super_class = (Class)ICDocCamZoomablePageContentViewController;
  -[ICDocCamZoomablePageContentViewController viewDidLayoutSubviews](&v52, sel_viewDidLayoutSubviews);
  -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  if (-[ICDocCamZoomablePageContentViewController shouldSetupScalesInViewDidLayoutSubviews](self, "shouldSetupScalesInViewDidLayoutSubviews"))
  {
    -[ICDocCamZoomablePageContentViewController setShouldSetupScalesInViewDidLayoutSubviews:](self, "setShouldSetupScalesInViewDidLayoutSubviews:", 0);
    -[ICDocCamZoomablePageContentViewController image](self, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "size");
    v10 = v9;
    v12 = v11;
    -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentSize:", v10, v12);

    -[ICDocCamZoomablePageContentViewController imageView](self, "imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sizeToFit");

    -[ICDocCamZoomablePageContentViewController setupScales](self, "setupScales");
LABEL_15:
    -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "bounds");
    MidX = CGRectGetMidX(v53);
    -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "bounds");
    MidY = CGRectGetMidY(v54);

    -[ICDocCamZoomablePageContentViewController imageView](self, "imageView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamZoomablePageContentViewController view:setCenter:](self, "view:setCenter:", v51, MidX, MidY);

    goto LABEL_16;
  }
  -[ICDocCamZoomablePageContentViewController prevScrollViewSize](self, "prevScrollViewSize");
  if (v5 != v16 || v7 != v15)
  {
    -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "zoomScale");
    v20 = v19;

    -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "minimumZoomScale");
    v23 = v22;

    -[ICDocCamZoomablePageContentViewController image](self, "image");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "size");
    v26 = v25;
    v28 = v27;
    -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setContentSize:", v26, v28);

    -[ICDocCamZoomablePageContentViewController setupScales](self, "setupScales");
    if (v20 != v23)
    {
      -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "minimumZoomScale");
      v32 = v31;

      if (v20 >= v32)
        v32 = v20;
      -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "maximumZoomScale");
      v35 = v34;

      if (v32 < v35)
        v35 = v32;
      -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "zoomScale");
      v38 = v37;

      if (v35 != v38)
      {
        -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setZoomScale:", v35);

        -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICDocCamZoomablePageContentViewController scrollViewDidZoom:](self, "scrollViewDidZoom:", v40);

      }
    }
    -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "zoomScale");
    v43 = v42;
    -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "minimumZoomScale");
    v46 = v45;

    if (v43 == v46)
      goto LABEL_15;
  }
LABEL_16:
  -[ICDocCamZoomablePageContentViewController setPrevScrollViewSize:](self, "setPrevScrollViewSize:", v5, v7);
}

- (void)singleTap
{
  id v3;

  -[ICDocCamZoomablePageContentViewController pageContentDelegate](self, "pageContentDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switchBarVisibilityForZoomablePageContentViewController:", self);

}

- (void)doubleTap:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
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
  void *v26;
  void *v27;
  CGFloat MidX;
  void *v29;
  CGFloat MidY;
  _QWORD v31[7];
  CGRect v32;
  CGRect v33;

  v4 = a3;
  if (objc_msgSend(v4, "numberOfTouches"))
  {
    -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zoomScale");
    v7 = v6;
    -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "minimumZoomScale");
    v10 = v9;

    if (v7 == v10)
    {
      -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locationOfTouch:inView:", 0, v11);
      v13 = v12;
      v15 = v14;

      -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "maximumZoomScale");
      *(float *)&v17 = v17;
      -[ICDocCamZoomablePageContentViewController zoomRectForScale:withCenter:](self, "zoomRectForScale:withCenter:", v17, v13, v15);
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;

      -[ICDocCamZoomablePageContentViewController scrollView](self, "scrollView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "zoomToRect:animated:", 1, v19, v21, v23, v25);

    }
    else
    {
      -[ICDocCamZoomablePageContentViewController view](self, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bounds");
      MidX = CGRectGetMidX(v32);
      -[ICDocCamZoomablePageContentViewController view](self, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "bounds");
      MidY = CGRectGetMidY(v33);

      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __55__ICDocCamZoomablePageContentViewController_doubleTap___block_invoke;
      v31[3] = &unk_24C5B8430;
      v31[4] = self;
      *(CGFloat *)&v31[5] = MidX;
      *(CGFloat *)&v31[6] = MidY;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v31, 0.2);
    }
  }

}

void __55__ICDocCamZoomablePageContentViewController_doubleTap___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumZoomScale");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setZoomScale:", v4);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "imageView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view:setCenter:", v7, *(double *)(a1 + 40), *(double *)(a1 + 48));

}

- (void)setupAccessibility
{
  void *v3;
  void *v4;
  id v5;

  -[ICDocCamZoomablePageContentViewController imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("image"), CFSTR("image"), CFSTR("Localizable"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamZoomablePageContentViewController imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  char v4;
  void *v5;

  -[ICDocCamZoomablePageContentViewController pageContentDelegate](self, "pageContentDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isShowingBarsForZoomablePageContentViewController:", self);

  if ((v4 & 1) == 0)
  {
    -[ICDocCamZoomablePageContentViewController pageContentDelegate](self, "pageContentDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "showBarsForZoomablePageContentViewController:", self);

  }
  return v4 ^ 1;
}

- (void)pageContentViewDidPencilDown
{
  void *v3;
  char v4;
  id v5;

  -[ICDocCamZoomablePageContentViewController pageContentDelegate](self, "pageContentDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[ICDocCamZoomablePageContentViewController pageContentDelegate](self, "pageContentDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pencilDownInZoomablePageContentViewController:", self);

  }
}

- (BOOL)isTouchingAnalyzableContentAtPoint:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  void *v6;
  char v7;

  y = a3.y;
  x = a3.x;
  -[ICDocCamZoomablePageContentViewController analysisInteraction](self, "analysisInteraction", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "hasActiveTextSelection") & 1) != 0
    || (objc_msgSend(v6, "dataDetectorExistsAtPoint:", x, y) & 1) != 0
    || (objc_msgSend(v6, "textExistsAtPoint:", x, y) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v7 = objc_msgSend(v6, "visualSearchExistsAtPoint:", x, y);
  }

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ICDocCamZoomablePageContentDelegate)pageContentDelegate
{
  return (ICDocCamZoomablePageContentDelegate *)objc_loadWeakRetained((id *)&self->_pageContentDelegate);
}

- (void)setPageContentDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pageContentDelegate, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (void)setPageIndex:(unint64_t)a3
{
  self->_pageIndex = a3;
}

- (VKCImageAnalysisInteraction)analysisInteraction
{
  return self->_analysisInteraction;
}

- (void)setAnalysisInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_analysisInteraction, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (BOOL)shouldSetupScalesInViewDidLayoutSubviews
{
  return self->_shouldSetupScalesInViewDidLayoutSubviews;
}

- (void)setShouldSetupScalesInViewDidLayoutSubviews:(BOOL)a3
{
  self->_shouldSetupScalesInViewDidLayoutSubviews = a3;
}

- (CGSize)prevScrollViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_prevScrollViewSize.width;
  height = self->_prevScrollViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPrevScrollViewSize:(CGSize)a3
{
  self->_prevScrollViewSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_analysisInteraction, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_destroyWeak((id *)&self->_pageContentDelegate);
}

void __75__ICDocCamZoomablePageContentViewController_analyzeCurrentImageIfNecessary__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CE8E000, a2, a3, "Encountered error from VKCImageAnalysis: %@", a5, a6, a7, a8, 2u);
}

@end
