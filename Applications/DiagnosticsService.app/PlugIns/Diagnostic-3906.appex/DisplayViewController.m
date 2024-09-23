@implementation DisplayViewController

- (void)setupView
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSMutableArray *v26;
  NSMutableArray *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v3 = objc_alloc((Class)UIScrollView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController view](self, "view"));
  objc_msgSend(v4, "frame");
  v5 = objc_msgSend(v3, "initWithFrame:");
  -[DisplayViewController setScrollView:](self, "setScrollView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
  objc_msgSend(v6, "setPagingEnabled:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
  objc_msgSend(v7, "setShowsHorizontalScrollIndicator:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
  objc_msgSend(v8, "setShowsVerticalScrollIndicator:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
  objc_msgSend(v9, "setScrollsToTop:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
  objc_msgSend(v10, "setDelegate:", self);

  v11 = objc_alloc((Class)_UIContentUnavailableView);
  -[DisplayViewController frameForConfirmation](self, "frameForConfirmation");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController labelForConfirmation](self, "labelForConfirmation"));
  v21 = objc_msgSend(v11, "initWithFrame:title:style:", v20, 1, v13, v15, v17, v19);
  -[DisplayViewController setConfirmPageView:](self, "setConfirmPageView:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController confirmPageView](self, "confirmPageView"));
  objc_msgSend(v23, "setBackgroundColor:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController confirmPageView](self, "confirmPageView"));
  objc_msgSend(v24, "addSubview:", v25);

  v26 = objc_opt_new(NSMutableArray);
  -[DisplayViewController setLeadingImageViews:](self, "setLeadingImageViews:", v26);

  v27 = objc_opt_new(NSMutableArray);
  -[DisplayViewController setTrailingImageViews:](self, "setTrailingImageViews:", v27);

  if (-[DisplayViewController maxNumPages](self, "maxNumPages") >= 1)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController imageViewForPage:](self, "imageViewForPage:", 0));
    -[DisplayViewController setCurrentImageView:](self, "setCurrentImageView:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController currentImageView](self, "currentImageView"));
    objc_msgSend(v29, "addSubview:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController currentImageView](self, "currentImageView"));
    -[DisplayViewController didUpdateCurrentImageView:](self, "didUpdateCurrentImageView:", v31);

  }
  if (-[DisplayViewController maxNumPages](self, "maxNumPages") > 1)
    -[DisplayViewController loadTrailing](self, "loadTrailing");
  v33 = (id)objc_claimAutoreleasedReturnValue(-[DisplayViewController view](self, "view"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
  objc_msgSend(v33, "addSubview:", v32);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[DisplayViewController animatedScrollingQueue](self, "animatedScrollingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000023B8;
  block[3] = &unk_10000C300;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  -[DisplayViewController handleViewDidEndDecelerating:](self, "handleViewDidEndDecelerating:", v4);
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[DisplayViewController animatedScrollingQueue](self, "animatedScrollingQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100002704;
  v6[3] = &unk_10000C328;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)moveTrailing
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  signed int v10;
  void *v11;
  id v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController currentImageView](self, "currentImageView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController leadingImageViews](self, "leadingImageViews"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController currentImageView](self, "currentImageView"));
    objc_msgSend(v4, "addObject:", v5);

  }
  if (-[DisplayViewController page](self, "page") < 0
    || (v6 = -[DisplayViewController page](self, "page"), v6 >= -[DisplayViewController maxNumPages](self, "maxNumPages")))
  {
    -[DisplayViewController setCurrentImageView:](self, "setCurrentImageView:", 0);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController trailingImageViews](self, "trailingImageViews"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));
    -[DisplayViewController setCurrentImageView:](self, "setCurrentImageView:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController trailingImageViews](self, "trailingImageViews"));
    objc_msgSend(v9, "removeObjectAtIndex:", 0);

  }
  v10 = -[DisplayViewController page](self, "page");
  if (v10 < -[DisplayViewController maxNumPages](self, "maxNumPages") - 1)
    -[DisplayViewController loadTrailing](self, "loadTrailing");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController leadingImageViews](self, "leadingImageViews"));
  v12 = objc_msgSend(v11, "count");

  if ((unint64_t)v12 >= 2)
    -[DisplayViewController unloadLeading](self, "unloadLeading");
  v13 = (id)objc_claimAutoreleasedReturnValue(-[DisplayViewController currentImageView](self, "currentImageView"));
  -[DisplayViewController didUpdateCurrentImageView:](self, "didUpdateCurrentImageView:", v13);

}

- (void)loadTrailing
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[DisplayViewController imageViewForPage:](self, "imageViewForPage:", -[DisplayViewController page](self, "page") + 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController trailingImageViews](self, "trailingImageViews"));
  objc_msgSend(v3, "addObject:", v5);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
  objc_msgSend(v4, "addSubview:", v5);

}

- (void)unloadTrailing
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController trailingImageViews](self, "trailingImageViews"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController trailingImageViews](self, "trailingImageViews"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v6, "removeFromSuperview");

    v7 = (id)objc_claimAutoreleasedReturnValue(-[DisplayViewController trailingImageViews](self, "trailingImageViews"));
    objc_msgSend(v7, "removeObjectAtIndex:", 0);

  }
}

- (void)moveLeading
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController currentImageView](self, "currentImageView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController trailingImageViews](self, "trailingImageViews"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController currentImageView](self, "currentImageView"));
    objc_msgSend(v4, "addObject:", v5);

  }
  if (-[DisplayViewController page](self, "page") < 0
    || (v6 = -[DisplayViewController page](self, "page"), v6 >= -[DisplayViewController maxNumPages](self, "maxNumPages")))
  {
    -[DisplayViewController setCurrentImageView:](self, "setCurrentImageView:", 0);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController leadingImageViews](self, "leadingImageViews"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));
    -[DisplayViewController setCurrentImageView:](self, "setCurrentImageView:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController leadingImageViews](self, "leadingImageViews"));
    objc_msgSend(v9, "removeObjectAtIndex:", 0);

  }
  if (-[DisplayViewController page](self, "page") >= 1)
  {
    v10 = -[DisplayViewController page](self, "page");
    if (v10 != -[DisplayViewController maxNumPages](self, "maxNumPages"))
      -[DisplayViewController loadLeading](self, "loadLeading");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController trailingImageViews](self, "trailingImageViews"));
  v12 = objc_msgSend(v11, "count");

  if ((unint64_t)v12 >= 2)
    -[DisplayViewController unloadTrailing](self, "unloadTrailing");
  v13 = (id)objc_claimAutoreleasedReturnValue(-[DisplayViewController currentImageView](self, "currentImageView"));
  -[DisplayViewController didUpdateCurrentImageView:](self, "didUpdateCurrentImageView:", v13);

}

- (void)loadLeading
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[DisplayViewController imageViewForPage:](self, "imageViewForPage:", -[DisplayViewController page](self, "page") - 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController leadingImageViews](self, "leadingImageViews"));
  objc_msgSend(v3, "addObject:", v5);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController scrollView](self, "scrollView"));
  objc_msgSend(v4, "addSubview:", v5);

}

- (void)unloadLeading
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController leadingImageViews](self, "leadingImageViews"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayViewController leadingImageViews](self, "leadingImageViews"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v6, "removeFromSuperview");

    v7 = (id)objc_claimAutoreleasedReturnValue(-[DisplayViewController leadingImageViews](self, "leadingImageViews"));
    objc_msgSend(v7, "removeObjectAtIndex:", 0);

  }
}

- (CGRect)frameForConfirmation
{
  NSString *v2;
  void *v3;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("You must override %@ in a subclass"), v3);

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)labelForConfirmation
{
  return CFSTR("n/a");
}

- (id)imageViewForPage:(int)a3
{
  NSString *v3;
  void *v4;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("You must override %@ in a subclass"), v4);

  return 0;
}

- (int)maxNumPages
{
  NSString *v2;
  void *v3;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("You must override %@ in a subclass"), v3);

  return 0;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (int)page
{
  return self->_page;
}

- (void)setPage:(int)a3
{
  self->_page = a3;
}

- (NSMutableArray)leadingImageViews
{
  return self->_leadingImageViews;
}

- (void)setLeadingImageViews:(id)a3
{
  objc_storeStrong((id *)&self->_leadingImageViews, a3);
}

- (UIImageView)currentImageView
{
  return self->_currentImageView;
}

- (void)setCurrentImageView:(id)a3
{
  objc_storeStrong((id *)&self->_currentImageView, a3);
}

- (NSMutableArray)trailingImageViews
{
  return self->_trailingImageViews;
}

- (void)setTrailingImageViews:(id)a3
{
  objc_storeStrong((id *)&self->_trailingImageViews, a3);
}

- (UIColor)drawColor
{
  return self->_drawColor;
}

- (void)setDrawColor:(id)a3
{
  objc_storeStrong((id *)&self->_drawColor, a3);
}

- (BOOL)isAnimatedScrolling
{
  return self->_isAnimatedScrolling;
}

- (void)setIsAnimatedScrolling:(BOOL)a3
{
  self->_isAnimatedScrolling = a3;
}

- (OS_dispatch_queue)animatedScrollingQueue
{
  return self->_animatedScrollingQueue;
}

- (void)setAnimatedScrollingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_animatedScrollingQueue, a3);
}

- (_UIContentUnavailableView)confirmPageView
{
  return self->_confirmPageView;
}

- (void)setConfirmPageView:(id)a3
{
  objc_storeStrong((id *)&self->_confirmPageView, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (DKResponder)diagnosticResponder
{
  return (DKResponder *)objc_loadWeakRetained((id *)&self->_diagnosticResponder);
}

- (void)setDiagnosticResponder:(id)a3
{
  objc_storeWeak((id *)&self->_diagnosticResponder, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_diagnosticResponder);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_confirmPageView, 0);
  objc_storeStrong((id *)&self->_animatedScrollingQueue, 0);
  objc_storeStrong((id *)&self->_drawColor, 0);
  objc_storeStrong((id *)&self->_trailingImageViews, 0);
  objc_storeStrong((id *)&self->_currentImageView, 0);
  objc_storeStrong((id *)&self->_leadingImageViews, 0);
}

@end
