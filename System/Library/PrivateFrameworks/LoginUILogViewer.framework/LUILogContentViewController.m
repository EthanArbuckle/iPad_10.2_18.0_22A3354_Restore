@implementation LUILogContentViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LUILogContentViewController;
  -[LUILogContentViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[LUILogContentViewController _setupButtonActions](self, "_setupButtonActions");
  -[LUILogContentViewController showLogOptionsView](self, "showLogOptionsView");
  -[LUILogContentViewController enableTimeConsumingOptions:](self, "enableTimeConsumingOptions:", 0);
  v3 = (void *)objc_opt_new();
  -[LUILogContentViewController setScreenshotItems:](self, "setScreenshotItems:", v3);

  -[LUILogContentViewController screenshotItems](self, "screenshotItems");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), "self.screenshotItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LUILogContentViewController addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, v4, 1, 0);

  -[LUILogContentViewController _setupTextViewGesture](self, "_setupTextViewGesture");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[LUILogContentViewController screenshotItems](self, "screenshotItems");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), "self.screenshotItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LUILogContentViewController removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, v3);

  v4.receiver = self;
  v4.super_class = (Class)LUILogContentViewController;
  -[LUILogContentViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  UITextView *v3;
  UITextView *textView;
  UIView *v5;
  UIView *textViewHolderView;
  LUILogOptionsView *v7;
  LUILogOptionsView *logOptionsView;
  LUILogLocatorView *v9;
  LUILogLocatorView *logLocatorView;
  void *v11;
  UIActivityIndicatorView *v12;
  UIActivityIndicatorView *spinner;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)LUILogContentViewController;
  -[LUILogContentViewController loadView](&v18, sel_loadView);
  -[LUILogContentViewController _createLogTextView](self, "_createLogTextView");
  v3 = (UITextView *)objc_claimAutoreleasedReturnValue();
  textView = self->_textView;
  self->_textView = v3;

  v5 = (UIView *)objc_opt_new();
  textViewHolderView = self->_textViewHolderView;
  self->_textViewHolderView = v5;

  -[UIView frame](self->_textViewHolderView, "frame");
  -[UITextView setFrame:](self->_textView, "setFrame:");
  -[UITextView setAutoresizingMask:](self->_textView, "setAutoresizingMask:", 18);
  -[UIView addSubview:](self->_textViewHolderView, "addSubview:", self->_textView);
  -[LUILogContentViewController _createLogOptionsView](self, "_createLogOptionsView");
  v7 = (LUILogOptionsView *)objc_claimAutoreleasedReturnValue();
  logOptionsView = self->_logOptionsView;
  self->_logOptionsView = v7;

  -[LUILogContentViewController _createLogLocatorView](self, "_createLogLocatorView");
  v9 = (LUILogLocatorView *)objc_claimAutoreleasedReturnValue();
  logLocatorView = self->_logLocatorView;
  self->_logLocatorView = v9;

  -[LUILogContentViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  -[LUILogOptionsView setFrame:](self->_logOptionsView, "setFrame:");

  -[LUILogOptionsView setAutoresizingMask:](self->_logOptionsView, "setAutoresizingMask:", 18);
  v12 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 101);
  spinner = self->_spinner;
  self->_spinner = v12;

  -[LUILogContentViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", self->_spinner);

  -[LUILogContentViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", self->_textViewHolderView);

  -[LUILogContentViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", self->_logOptionsView);

  -[LUILogContentViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", self->_logLocatorView);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double Width;
  void *v10;
  uint64_t v11;
  CGFloat v15;
  void *v16;
  void *v17;
  CGFloat v18;
  void *v19;
  CGFloat v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double Height;
  void *v28;
  CGFloat v29;
  CGFloat v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  objc_super v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v37.receiver = self;
  v37.super_class = (Class)LUILogContentViewController;
  -[LUILogContentViewController viewWillLayoutSubviews](&v37, sel_viewWillLayoutSubviews);
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "interfaceOrientation");

  -[LUILogContentViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  Width = CGRectGetWidth(v38);
  -[LUILogContentViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  if ((unint64_t)(v7 - 1) > 1)
  {
    Height = CGRectGetHeight(*(CGRect *)&v11);
    -[LUILogContentViewController textViewHolderView](self, "textViewHolderView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFrame:", 0.0, 0.0, Width + -150.0 + -10.0, Height);

    -[LUILogContentViewController textViewHolderView](self, "textViewHolderView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v29 = CGRectGetMaxX(v41) + 10.0;
    -[LUILogContentViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    v30 = CGRectGetHeight(v42);
    -[LUILogContentViewController logLocatorView](self, "logLocatorView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v26 = 150.0;
    v25 = 0.0;
    v24 = v29;
    v23 = v30;
  }
  else
  {
    v15 = CGRectGetHeight(*(CGRect *)&v11) + -150.0 + -10.0;
    -[LUILogContentViewController textViewHolderView](self, "textViewHolderView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", 0.0, 0.0, Width, v15);

    -[LUILogContentViewController textViewHolderView](self, "textViewHolderView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v18 = CGRectGetMaxY(v39) + 10.0;
    -[LUILogContentViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    v20 = CGRectGetWidth(v40);
    -[LUILogContentViewController logLocatorView](self, "logLocatorView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = 150.0;
    v24 = 0.0;
    v25 = v18;
    v26 = v20;
  }
  objc_msgSend(v21, "setFrame:", v24, v25, v26, v23);

  -[LUILogContentViewController textViewHolderView](self, "textViewHolderView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "center");
  v33 = v32;
  v35 = v34;
  -[LUILogContentViewController spinner](self, "spinner");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setCenter:", v33, v35);

}

- (void)_setupButtonActions
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
  id v18;

  -[LUILogContentViewController logOptionsView](self, "logOptionsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tenMinutesLogButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel_logOptionButtonTapped_, 64);

  -[LUILogContentViewController logOptionsView](self, "logOptionsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "halfHourButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_logOptionButtonTapped_, 64);

  -[LUILogContentViewController logOptionsView](self, "logOptionsView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hourButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel_logOptionButtonTapped_, 64);

  -[LUILogContentViewController logOptionsView](self, "logOptionsView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastDayButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel_logOptionButtonTapped_, 64);

  -[LUILogContentViewController logOptionsView](self, "logOptionsView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "streamButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel_logOptionButtonTapped_, 64);

  -[LUILogContentViewController logLocatorView](self, "logLocatorView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "screenshotButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addTarget:action:forControlEvents:", self, sel_screenshotButtonTapped_, 64);

  -[LUILogContentViewController logLocatorView](self, "logLocatorView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "upArrowButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel_upArrowButtonTapped_, 64);

  -[LUILogContentViewController logLocatorView](self, "logLocatorView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "downArrowButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addTarget:action:forControlEvents:", self, sel_downArrowButtonTapped_, 64);

}

- (void)_setupTextViewGesture
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6C38]), "initWithTarget:action:", self, sel_handlePan_);
  -[LUILogContentViewController setPanGesture:](self, "setPanGesture:", v3);

  -[LUILogContentViewController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LUILogContentViewController panGesture](self, "panGesture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v5);

  -[LUILogContentViewController panGesture](self, "panGesture");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

}

- (void)showLogOptionsView
{
  void *v3;
  void *v4;
  id v5;

  -[LUILogContentViewController logOptionsView](self, "logOptionsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

  -[LUILogContentViewController textViewHolderView](self, "textViewHolderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  -[LUILogContentViewController logLocatorView](self, "logLocatorView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

}

- (void)showLogTextView
{
  void *v3;
  void *v4;
  id v5;

  -[LUILogContentViewController logOptionsView](self, "logOptionsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  -[LUILogContentViewController textViewHolderView](self, "textViewHolderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  -[LUILogContentViewController logLocatorView](self, "logLocatorView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 1.0);

}

- (void)enableTimeConsumingOptions:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v3 = a3;
  -[LUILogContentViewController logOptionsView](self, "logOptionsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hourButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    objc_msgSend(v6, "setEnabled:", 1);

    -[LUILogContentViewController logOptionsView](self, "logOptionsView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastDayButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 1;
  }
  else
  {
    objc_msgSend(v6, "setEnabled:", 0);

    -[LUILogContentViewController logOptionsView](self, "logOptionsView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastDayButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 0;
  }
  objc_msgSend(v8, "setEnabled:", v10);

}

- (void)showSpinner:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[LUILogContentViewController spinner](self, "spinner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "startAnimating");
  else
    objc_msgSend(v4, "stopAnimating");

}

- (id)_createLogOptionsView
{
  return (id)objc_opt_new();
}

- (id)_createLogTextView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setEditable:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v3);

  objc_msgSend(v2, "setIndicatorStyle:", 2);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v4);

  objc_msgSend(v2, "layoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsNonContiguousLayout:", 1);

  return v2;
}

- (id)_createLogLocatorView
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "screenshotCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  objc_msgSend(v3, "screenshotCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataSource:", self);

  return v3;
}

- (id)_dateWithPercentage:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;

  -[LUILogContentViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logContentViewControllerLogStartDate:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[LUILogContentViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logContentViewControllerLogEndDate:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "timeIntervalSinceDate:", v6);
  *(float *)&v9 = v9 * a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", v6, roundf(*(float *)&v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (UILabel)scrollIndicatorView
{
  UILabel *scrollIndicatorView;
  UILabel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UILabel *v9;

  scrollIndicatorView = self->_scrollIndicatorView;
  if (!scrollIndicatorView)
  {
    v4 = (UILabel *)objc_opt_new();
    -[UILabel setClipsToBounds:](v4, "setClipsToBounds:", 1);
    -[UILabel layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", 5.0);

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorWithAlphaComponent:", 0.699999988);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v4, "setBackgroundColor:", v7);

    objc_msgSend(MEMORY[0x24BDF6950], "darkGrayColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4, "setTextColor:", v8);

    v9 = self->_scrollIndicatorView;
    self->_scrollIndicatorView = v4;

    scrollIndicatorView = self->_scrollIndicatorView;
  }
  return scrollIndicatorView;
}

- (void)clearScreenshots
{
  -[LUILogContentViewController setScreenshotItems:](self, "setScreenshotItems:", MEMORY[0x24BDBD1A8]);
}

- (id)_generateScreenshotItem
{
  void *v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CGSize v14;

  v3 = (void *)objc_opt_new();
  -[LUILogContentViewController textViewHolderView](self, "textViewHolderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v14.width = v5;
  v14.height = v6;
  UIGraphicsBeginImageContextWithOptions(v14, 1, 0.0);
  objc_msgSend(v4, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "renderInContext:", UIGraphicsGetCurrentContext());

  UIGraphicsGetImageFromCurrentImageContext();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v3, "setScreenshotImage:", v8);
  -[LUILogContentViewController textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[LUILogContentViewController _visibleRangeOfTextView:](self, "_visibleRangeOfTextView:", v9);
  objc_msgSend(v3, "setVisibleRange:", v10, v11);

  v12 = (void *)objc_opt_new();
  objc_msgSend(v3, "setScreenshotDate:", v12);

  return v3;
}

- (_NSRange)_visibleRangeOfTextView:(id)a3
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
  void *v13;
  double MaxX;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  _NSRange result;
  CGRect v23;
  CGRect v24;

  v3 = a3;
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "characterRangeAtPoint:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "start");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  MaxX = CGRectGetMaxX(v23);
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  objc_msgSend(v3, "characterRangeAtPoint:", MaxX, CGRectGetMaxY(v24) + -10.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "end");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "beginningOfDocument");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v3, "offsetFromPosition:toPosition:", v17, v13);
  v19 = objc_msgSend(v3, "offsetFromPosition:toPosition:", v13, v16);

  v20 = v18;
  v21 = v19;
  result.length = v21;
  result.location = v20;
  return result;
}

- (void)_applyScreenShotAnimation
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  -[LUILogContentViewController textViewHolderView](self, "textViewHolderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeScale(&v8, 1.2, 1.2);
  v7 = v8;
  objc_msgSend(v2, "setTransform:", &v7);
  v3 = (void *)MEMORY[0x24BDF6F90];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__LUILogContentViewController__applyScreenShotAnimation__block_invoke;
  v5[3] = &unk_24FEBBC70;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v5, 0, 0.5, 0.0, 0.8, 1.0);

}

uint64_t __56__LUILogContentViewController__applyScreenShotAnimation__block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v4[0] = *MEMORY[0x24BDBD8B8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

- (void)logOptionButtonTapped:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  id v15;

  v15 = a3;
  -[LUILogContentViewController logOptionsView](self, "logOptionsView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tenMinutesLogButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v15)
  {
    v13 = 600.0;
  }
  else
  {
    -[LUILogContentViewController logOptionsView](self, "logOptionsView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "halfHourButton");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v15)
    {
      v13 = 1800.0;
    }
    else
    {
      -[LUILogContentViewController logOptionsView](self, "logOptionsView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hourButton");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9 == v15)
      {
        v13 = 3600.0;
      }
      else
      {
        -[LUILogContentViewController logOptionsView](self, "logOptionsView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastDayButton");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v15)
        {
          v13 = 86400.0;
        }
        else
        {
          -[LUILogContentViewController logOptionsView](self, "logOptionsView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "streamButton");

          v13 = 0.0;
        }
      }
    }
  }
  -[LUILogContentViewController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "logContentViewController:didSelectLogOptionWithTimeInterval:", self, v13);

}

- (void)screenshotButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[LUILogContentViewController _generateScreenshotItem](self, "_generateScreenshotItem", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[LUILogContentViewController screenshotItems](self, "screenshotItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObject:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LUILogContentViewController setScreenshotItems:](self, "setScreenshotItems:", v5);

  -[LUILogContentViewController _applyScreenShotAnimation](self, "_applyScreenShotAnimation");
}

- (void)upArrowButtonTapped:(id)a3
{
  id v3;

  -[LUILogContentViewController textView](self, "textView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollRangeToVisible:", 0, 0);

}

- (void)downArrowButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[LUILogContentViewController textView](self, "textView", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[LUILogContentViewController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollRangeToVisible:", objc_msgSend(v5, "lengthOfBytesUsingEncoding:", 4) - 1, 0);

}

- (void)handlePan:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  CGFloat Height;
  void *v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CGFloat v30;
  void *v31;
  CGFloat v32;
  void *v33;
  id v34;
  CGPoint v35;
  CGPoint v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v4 = a3;
  -[LUILogContentViewController textViewHolderView](self, "textViewHolderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[LUILogContentViewController textViewHolderView](self, "textViewHolderView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v11 = CGRectGetWidth(v37) + -50.0;
  -[LUILogContentViewController textViewHolderView](self, "textViewHolderView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  Height = CGRectGetHeight(v38);

  -[LUILogContentViewController textViewHolderView](self, "textViewHolderView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v15 = (v9 + -12.0) / (CGRectGetHeight(v39) + -24.0);

  v16 = 0.0;
  if (v15 >= 0.0)
    v16 = v15;
  v17 = fmin(v16, 1.0);
  v18 = objc_msgSend(v4, "state");

  if ((unint64_t)(v18 - 3) >= 3)
  {
    if (v18 != 2)
    {
      if (v18 != 1)
        return;
      -[LUILogContentViewController textViewHolderView](self, "textViewHolderView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[LUILogContentViewController scrollIndicatorView](self, "scrollIndicatorView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addSubview:", v22);

      -[LUILogContentViewController textViewHolderView](self, "textViewHolderView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[LUILogContentViewController scrollIndicatorView](self, "scrollIndicatorView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bringSubviewToFront:", v24);

    }
    v41.size.width = 50.0;
    v41.origin.y = 0.0;
    v41.origin.x = v11;
    v41.size.height = Height;
    v36.x = v7;
    v36.y = v9;
    v25 = CGRectContainsPoint(v41, v36);
    -[LUILogContentViewController scrollIndicatorView](self, "scrollIndicatorView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v26;
    if (!v25)
    {
      objc_msgSend(v26, "setAlpha:", 0.0);
      goto LABEL_14;
    }
    objc_msgSend(v26, "setAlpha:", 1.0);

    -[LUILogContentViewController _dateWithPercentage:](self, "_dateWithPercentage:", v17);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    secondStringWithDate(v34);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[LUILogContentViewController scrollIndicatorView](self, "scrollIndicatorView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setText:", v20);

    -[LUILogContentViewController scrollIndicatorView](self, "scrollIndicatorView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "sizeToFit");

    -[LUILogContentViewController textViewHolderView](self, "textViewHolderView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "frame");
    v30 = CGRectGetWidth(v42) + -50.0;
    -[LUILogContentViewController scrollIndicatorView](self, "scrollIndicatorView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "frame");
    v32 = v30 + CGRectGetWidth(v43) * -0.5;
    -[LUILogContentViewController scrollIndicatorView](self, "scrollIndicatorView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setCenter:", v32, v9);

LABEL_11:
LABEL_14:

    return;
  }
  -[LUILogContentViewController scrollIndicatorView](self, "scrollIndicatorView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeFromSuperview");

  v40.size.width = 50.0;
  v40.origin.y = 0.0;
  v40.origin.x = v11;
  v40.size.height = Height;
  v35.x = v7;
  v35.y = v9;
  if (CGRectContainsPoint(v40, v35))
  {
    -[LUILogContentViewController delegate](self, "delegate");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    -[LUILogContentViewController _dateWithPercentage:](self, "_dateWithPercentage:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "logContentViewController:didSelectDateForLog:", self, v20);
    goto LABEL_11;
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  CGFloat v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  BOOL v17;
  CGRect v19;

  v4 = a3;
  -[LUILogContentViewController textViewHolderView](self, "textViewHolderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;

  -[LUILogContentViewController textViewHolderView](self, "textViewHolderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v9 = CGRectGetWidth(v19) - v7;

  -[LUILogContentViewController textViewHolderView](self, "textViewHolderView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "velocityInView:", v10);
  v12 = v11;
  v14 = v13;

  if (v9 >= 50.0 || fabs(v14) <= fabs(v12))
    return 0;
  -[LUILogContentViewController textView](self, "textView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 != 0;

  return v17;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v7 = a3;
  -[LUILogContentViewController screenshotItems](self, "screenshotItems");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), "self.screenshotItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    -[LUILogContentViewController logLocatorView](self, "logLocatorView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "screenshotCollectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadData");

  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[LUILogContentViewController screenshotItems](self, "screenshotItems", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
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
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("screenshotCell"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (collectionView_cellForItemAtIndexPath__onceToken != -1)
    dispatch_once(&collectionView_cellForItemAtIndexPath__onceToken, &__block_literal_global_0);
  -[LUILogContentViewController screenshotItems](self, "screenshotItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)collectionView_cellForItemAtIndexPath__formatter;
  objc_msgSend(v10, "screenshotDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringFromDate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "screenshotImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "screenshotImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setImage:", v14);

  objc_msgSend(v8, "screenshotDateLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v13);

  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __69__LUILogContentViewController_collectionView_cellForItemAtIndexPath___block_invoke_2;
  v19[3] = &unk_24FEBBF48;
  objc_copyWeak(&v21, &location);
  v17 = v10;
  v20 = v17;
  objc_msgSend(v8, "setClearButtonAction:", v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v8;
}

uint64_t __69__LUILogContentViewController_collectionView_cellForItemAtIndexPath___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)collectionView_cellForItemAtIndexPath__formatter;
  collectionView_cellForItemAtIndexPath__formatter = (uint64_t)v0;

  return objc_msgSend((id)collectionView_cellForItemAtIndexPath__formatter, "setDateFormat:", CFSTR("HH:mm:ss.SSS"));
}

void __69__LUILogContentViewController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "screenshotItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(WeakRetained, "setScreenshotItems:", v4);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[LUILogContentViewController screenshotItems](self, "screenshotItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[LUILogContentViewController textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v12, "visibleRange");
  objc_msgSend(v9, "scrollRangeToVisible:", v10, v11);

  objc_msgSend(v7, "deselectItemAtIndexPath:animated:", v6, 0);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  v5 = 130.0;
  v6 = 130.0;
  result.height = v6;
  result.width = v5;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 10.0;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v5 = 0.0;
  v6 = 10.0;
  v7 = 0.0;
  v8 = 10.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UITextView)textView
{
  return self->_textView;
}

- (LUILogContentViewControllerDelegate)delegate
{
  return (LUILogContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (LUILogOptionsView)logOptionsView
{
  return self->_logOptionsView;
}

- (void)setLogOptionsView:(id)a3
{
  objc_storeStrong((id *)&self->_logOptionsView, a3);
}

- (LUILogLocatorView)logLocatorView
{
  return self->_logLocatorView;
}

- (void)setLogLocatorView:(id)a3
{
  objc_storeStrong((id *)&self->_logLocatorView, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (NSArray)screenshotItems
{
  return self->_screenshotItems;
}

- (void)setScreenshotItems:(id)a3
{
  objc_storeStrong((id *)&self->_screenshotItems, a3);
}

- (UIView)textViewHolderView
{
  return self->_textViewHolderView;
}

- (void)setTextViewHolderView:(id)a3
{
  objc_storeStrong((id *)&self->_textViewHolderView, a3);
}

- (UIPanGestureRecognizer)panGesture
{
  return self->_panGesture;
}

- (void)setPanGesture:(id)a3
{
  objc_storeStrong((id *)&self->_panGesture, a3);
}

- (void)setScrollIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollIndicatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollIndicatorView, 0);
  objc_storeStrong((id *)&self->_panGesture, 0);
  objc_storeStrong((id *)&self->_textViewHolderView, 0);
  objc_storeStrong((id *)&self->_screenshotItems, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_logLocatorView, 0);
  objc_storeStrong((id *)&self->_logOptionsView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
