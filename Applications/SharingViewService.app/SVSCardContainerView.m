@implementation SVSCardContainerView

- (SVSCardContainerView)initWithFrame:(CGRect)a3
{
  SVSCardContainerView *v3;
  void *v4;
  SVSCardContainerView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SVSCardContainerView;
  v3 = -[SVSCardContainerView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[SVSCardContainerView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[SVSCardContainerView _updateCornerRadius](v3, "_updateCornerRadius");
    -[SVSCardContainerView _updateWidthConstraints](v3, "_updateWidthConstraints");
    v5 = v3;
  }

  return v3;
}

- (void)setJustBeAContainer:(BOOL)a3
{
  if (self->_justBeAContainer != a3)
  {
    self->_justBeAContainer = a3;
    -[SVSCardContainerView _updateCornerRadius](self, "_updateCornerRadius");
  }
}

- (void)_updateCornerRadius
{
  unsigned __int8 v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  v3 = -[SVSCardContainerView justBeAContainer](self, "justBeAContainer");
  v4 = 0.0;
  if ((v3 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SVSCardContainerView traitCollection](self, "traitCollection", 0.0));
    objc_msgSend(v5, "displayCornerRadius");
    v7 = v6 + -6.0;

    v4 = fmax(v7, 13.0);
  }
  -[SVSCardContainerView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", v4);
}

- (void)_updateWidthConstraints
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SVSCardContainerView traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithHorizontalSizeClass:](UITraitCollection, "traitCollectionWithHorizontalSizeClass:", 1));
  v5 = objc_msgSend(v3, "containsTraitsInCollection:", v4);

  if (v5)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[SVSCardContainerView constraints](self, "constraints"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("firstAttribute = %d AND firstItem = %@ AND constant = 400"), 7, self));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:", v6));
    if ((unint64_t)objc_msgSend(v7, "count") >= 2
      && dword_1001A8B18 <= 90
      && (dword_1001A8B18 != -1 || _LogCategory_Initialize(&dword_1001A8B18, 90)))
    {
      LogPrintF(&dword_1001A8B18, "-[SVSCardContainerView _updateWidthConstraints]", 90, "Asked to remove more than 1 constraint, please file a bug against Proximity Setup | all: %@", v7);
    }
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v7);

  }
}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SVSCardContainerView;
  -[SVSCardContainerView awakeFromNib](&v3, "awakeFromNib");
  -[SVSCardContainerView _updateCornerRadius](self, "_updateCornerRadius");
  -[SVSCardContainerView _updateWidthConstraints](self, "_updateWidthConstraints");
}

- (void)setSwipeDismissible:(BOOL)a3
{
  self->_swipeDismissible = a3;
  -[SVSCardContainerView updateScrollViewTopInset](self, "updateScrollViewTopInset");
}

- (void)updateScrollViewTopInset
{
  double top;
  double left;
  double bottom;
  double right;
  double v7;

  if (-[SVSCardContainerView swipeDismissible](self, "swipeDismissible"))
  {
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
  }
  else
  {
    -[SVSCardContainerScrollView size](self->_flickScrollview, "size");
    top = -v7;
    left = 0.0;
    bottom = 0.0;
    right = 0.0;
  }
  -[SVSCardContainerScrollView setContentInset:](self->_flickScrollview, "setContentInset:", top, left, bottom, right);
}

- (void)activateWithDimmingView:(id)a3 bottomMarginConstraint:(id)a4 dismissHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  id v14;
  id dismissHandler;
  double v16;
  SVSCardContainerScrollView *v17;
  SVSCardContainerScrollView *v18;
  SVSCardContainerScrollView *flickScrollview;
  void *v20;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void **v37;
  uint64_t v38;
  id (*v39)(uint64_t, void *);
  void *v40;
  id v41;
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v13 = (unint64_t)objc_msgSend(v12, "userInterfaceIdiom");

  if (v10 && (v13 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    objc_storeStrong((id *)&self->_dimmingView, a3);
    v14 = objc_retainBlock(v11);
    dismissHandler = self->_dismissHandler;
    self->_dismissHandler = v14;

    objc_storeStrong((id *)&self->_bottomMarginConstraint, a4);
    objc_msgSend(v10, "constant");
    self->_originalBottomConstraintConstant = v16;
    location = 0;
    objc_initWeak(&location, self);
    v17 = [SVSCardContainerScrollView alloc];
    v37 = _NSConcreteStackBlock;
    v38 = 3221225472;
    v39 = sub_10010FBC0;
    v40 = &unk_10017DCF0;
    objc_copyWeak(&v41, &location);
    v18 = -[SVSCardContainerScrollView initWithGestureRecognizerEvaluator:](v17, "initWithGestureRecognizerEvaluator:", &v37);
    flickScrollview = self->_flickScrollview;
    self->_flickScrollview = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SVSCardContainerView superview](self, "superview", v37, v38, v39, v40));
    objc_msgSend(v20, "insertSubview:below:", self->_flickScrollview, self);

    -[SVSCardContainerScrollView setContentInsetAdjustmentBehavior:](self->_flickScrollview, "setContentInsetAdjustmentBehavior:", 2);
    -[SVSCardContainerView frame](self, "frame");
    v22 = v21;
    -[SVSCardContainerView frame](self, "frame");
    v24 = v23;
    -[SVSCardContainerView size](self, "size");
    v26 = v25;
    -[SVSCardContainerView size](self, "size");
    -[SVSCardContainerScrollView setFrame:](self->_flickScrollview, "setFrame:", v22, v24, v26, v27 + 20.0);
    -[SVSCardContainerScrollView setDelegate:](self->_flickScrollview, "setDelegate:", self);
    -[SVSCardContainerScrollView size](self->_flickScrollview, "size");
    v29 = v28;
    -[SVSCardContainerScrollView size](self->_flickScrollview, "size");
    -[SVSCardContainerScrollView setContentSize:](self->_flickScrollview, "setContentSize:", v29, v30 + v30);
    -[SVSCardContainerScrollView setPagingEnabled:](self->_flickScrollview, "setPagingEnabled:", 1);
    -[SVSCardContainerScrollView setClipsToBounds:](self->_flickScrollview, "setClipsToBounds:", 0);
    -[SVSCardContainerScrollView setShowsVerticalScrollIndicator:](self->_flickScrollview, "setShowsVerticalScrollIndicator:", 0);
    -[SVSCardContainerScrollView setShowsHorizontalScrollIndicator:](self->_flickScrollview, "setShowsHorizontalScrollIndicator:", 0);
    -[SVSCardContainerScrollView setUserInteractionEnabled:](self->_flickScrollview, "setUserInteractionEnabled:", 1);
    -[SVSCardContainerScrollView setAlwaysBounceVertical:](self->_flickScrollview, "setAlwaysBounceVertical:", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[SVSCardContainerScrollView panGestureRecognizer](self->_flickScrollview, "panGestureRecognizer"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "view"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SVSCardContainerScrollView panGestureRecognizer](self->_flickScrollview, "panGestureRecognizer"));
    objc_msgSend(v32, "removeGestureRecognizer:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[SVSCardContainerView superview](self, "superview"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[SVSCardContainerScrollView panGestureRecognizer](self->_flickScrollview, "panGestureRecognizer"));
    objc_msgSend(v34, "addGestureRecognizer:", v35);

    -[SVSCardContainerScrollView size](self->_flickScrollview, "size");
    self->_originalContentOffsetY = v36;
    -[SVSCardContainerScrollView setContentOffset:](self->_flickScrollview, "setContentOffset:", 0.0);
    -[SVSCardContainerView updateScrollViewTopInset](self, "updateScrollViewTopInset");
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }

}

- (void)reactivate
{
  -[SVSCardContainerView activateWithDimmingView:bottomMarginConstraint:dismissHandler:](self, "activateWithDimmingView:bottomMarginConstraint:dismissHandler:", self->_dimmingView, self->_bottomMarginConstraint, self->_dismissHandler);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id dragCancelHandler;
  id v5;
  void (**v6)(void);

  dragCancelHandler = self->_dragCancelHandler;
  if (dragCancelHandler)
  {
    v6 = (void (**)(void))objc_retainBlock(dragCancelHandler);
    v5 = self->_dragCancelHandler;
    self->_dragCancelHandler = 0;

    v6[2]();
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  double v6;
  double originalContentOffsetY;
  double v8;
  double v9;
  void (**dismissHandler)(id, uint64_t);
  id v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "contentOffset");
  -[NSLayoutConstraint setConstant:](self->_bottomMarginConstraint, "setConstant:", v4 - self->_originalContentOffsetY + self->_originalBottomConstraintConstant);
  objc_msgSend(v12, "contentOffset");
  v6 = v5;
  originalContentOffsetY = self->_originalContentOffsetY;
  if (-[SVSCardContainerView swipeDismissible](self, "swipeDismissible"))
  {
    v8 = v6 / originalContentOffsetY;
    if (v6 / originalContentOffsetY > 1.0)
      v8 = 1.0;
    if (v8 < 0.0)
      v8 = 0.0;
    -[UIView setAlpha:](self->_dimmingView, "setAlpha:", v8);
  }
  objc_msgSend(v12, "contentOffset");
  if (v9 == 0.0)
  {
    dismissHandler = (void (**)(id, uint64_t))self->_dismissHandler;
    if (dismissHandler)
    {
      dismissHandler[2](dismissHandler, 19);
      v11 = self->_dismissHandler;
      self->_dismissHandler = 0;

    }
  }

}

- (void)cancelProxCardDraggingWithCompletion:(id)a3
{
  id v5;
  void ***v6;
  void ***v7;
  id dragCancelHandler;
  id v9;
  double originalContentOffsetY;
  void *v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  SVSCardContainerView *v17;
  id v18;

  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_10010FB68;
  v16 = &unk_10017E100;
  v5 = a3;
  v17 = self;
  v18 = v5;
  v6 = objc_retainBlock(&v13);
  if (-[SVSCardContainerScrollView isDragging](self->_flickScrollview, "isDragging", v13, v14, v15, v16))
  {
    v7 = objc_retainBlock(v6);
    dragCancelHandler = self->_dragCancelHandler;
    self->_dragCancelHandler = v7;

    v9 = v6;
    v6 = 0;
  }
  else
  {
    v9 = self->_dragCancelHandler;
    if (v9)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVSCardContainerView.m"), 240, CFSTR("_dragCancelHandler should always be nil here."));

      v9 = self->_dragCancelHandler;
    }
    self->_dragCancelHandler = 0;
  }

  originalContentOffsetY = self->_originalContentOffsetY;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SVSCardContainerScrollView panGestureRecognizer](self->_flickScrollview, "panGestureRecognizer"));
  objc_msgSend(v11, "setEnabled:", 0);

  -[SVSCardContainerScrollView setContentOffset:animated:](self->_flickScrollview, "setContentOffset:animated:", 1, 0.0, originalContentOffsetY);
  if (v6)
    ((void (*)(void ***))v6[2])(v6);

}

- (BOOL)justBeAContainer
{
  return self->_justBeAContainer;
}

- (BOOL)swipeDismissible
{
  return self->_swipeDismissible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flickScrollview, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong(&self->_dragCancelHandler, 0);
  objc_storeStrong((id *)&self->_bottomMarginConstraint, 0);
}

@end
