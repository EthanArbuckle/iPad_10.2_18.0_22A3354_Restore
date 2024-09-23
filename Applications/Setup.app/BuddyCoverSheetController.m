@implementation BuddyCoverSheetController

- (void)viewDidLoad
{
  id v2;
  UIView *v3;
  id v4;
  UIView *v5;
  UIView *v6;
  NSLayoutYAxisAnchor *v7;
  id v8;
  id v9;
  id v10;
  UIView *v11;
  NSLayoutXAxisAnchor *v12;
  id v13;
  NSArray *v14;
  id v15;
  id v16;
  UIScreenEdgePanGestureRecognizer *v17;
  id v18;
  UIScreenEdgePanGestureRecognizer *v19;
  id v20;
  NSArray *v21;
  id v22;
  id v23;
  id v24;
  NSLayoutXAxisAnchor *v25;
  UIView *v26;
  id v27;
  id v28;
  id v29;
  NSLayoutYAxisAnchor *v30;
  UIView *v31;
  id v32;
  id v33;
  void **v34;
  int v35;
  int v36;
  void (*v37)(id *);
  void *v38;
  id v39;
  void **v40;
  int v41;
  int v42;
  void (*v43)(id *);
  void *v44;
  id v45[3];
  id location;
  objc_super v47;
  SEL v48;
  BuddyCoverSheetController *v49;
  UIViewFloatAnimatableProperty *progressProperty;
  _QWORD v51[4];

  v49 = self;
  v48 = a2;
  v47.receiver = self;
  v47.super_class = (Class)BuddyCoverSheetController;
  -[BuddyCoverSheetController viewDidLoad](&v47, "viewDidLoad");
  v2 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[BuddyCoverSheetController setDimmingView:](v49, "setDimmingView:", v2);

  v3 = -[BuddyCoverSheetController dimmingView](v49, "dimmingView");
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = -[BuddyCoverSheetController view](v49, "view");
  v5 = -[BuddyCoverSheetController dimmingView](v49, "dimmingView");
  objc_msgSend(v4, "addSubview:", v5);

  v6 = -[BuddyCoverSheetController dimmingView](v49, "dimmingView");
  v7 = -[UIView topAnchor](v6, "topAnchor");
  v8 = -[BuddyCoverSheetController view](v49, "view");
  v9 = objc_msgSend(v8, "topAnchor");
  v10 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v7, "constraintEqualToAnchor:", v9);
  v51[0] = v10;
  v11 = -[BuddyCoverSheetController dimmingView](v49, "dimmingView");
  v12 = -[UIView rightAnchor](v11, "rightAnchor");
  v13 = -[BuddyCoverSheetController view](v49, "view");
  v33 = objc_msgSend(v13, "rightAnchor");
  v32 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v12, "constraintEqualToAnchor:");
  v51[1] = v32;
  v31 = -[BuddyCoverSheetController dimmingView](v49, "dimmingView");
  v30 = -[UIView bottomAnchor](v31, "bottomAnchor");
  v29 = -[BuddyCoverSheetController view](v49, "view");
  v28 = objc_msgSend(v29, "bottomAnchor");
  v27 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v30, "constraintEqualToAnchor:");
  v51[2] = v27;
  v26 = -[BuddyCoverSheetController dimmingView](v49, "dimmingView");
  v25 = -[UIView leftAnchor](v26, "leftAnchor");
  v24 = -[BuddyCoverSheetController view](v49, "view");
  v23 = objc_msgSend(v24, "leftAnchor");
  v22 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v25, "constraintEqualToAnchor:");
  v51[3] = v22;
  v14 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 4);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

  v15 = objc_alloc((Class)UIScreenEdgePanGestureRecognizer);
  v16 = objc_msgSend(v15, "initWithTarget:action:", v49, "_handleGesture:");
  -[BuddyCoverSheetController setGestureRecognizer:](v49, "setGestureRecognizer:", v16);

  v17 = -[BuddyCoverSheetController gestureRecognizer](v49, "gestureRecognizer");
  -[UIScreenEdgePanGestureRecognizer setEdges:](v17, "setEdges:", 4);

  v18 = -[BuddyCoverSheetController view](v49, "view");
  v19 = -[BuddyCoverSheetController gestureRecognizer](v49, "gestureRecognizer");
  objc_msgSend(v18, "addGestureRecognizer:", v19);

  v20 = objc_alloc_init((Class)UIViewFloatAnimatableProperty);
  -[BuddyCoverSheetController setProgressProperty:](v49, "setProgressProperty:", v20);

  objc_initWeak(&location, v49);
  progressProperty = v49->_progressProperty;
  v21 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &progressProperty, 1);
  v40 = _NSConcreteStackBlock;
  v41 = -1073741824;
  v42 = 0;
  v43 = sub_1000CFFE0;
  v44 = &unk_1002806B8;
  objc_copyWeak(v45, &location);
  v34 = _NSConcreteStackBlock;
  v35 = -1073741824;
  v36 = 0;
  v37 = sub_1000D0024;
  v38 = &unk_1002806B8;
  objc_copyWeak(&v39, &location);
  +[UIView _createTransformerWithInputAnimatableProperties:modelValueSetter:presentationValueSetter:](UIView, "_createTransformerWithInputAnimatableProperties:modelValueSetter:presentationValueSetter:", v21, &v40, &v34);

  -[BuddyCoverSheetController _updateDimmingViewForProgress:](v49, "_updateDimmingViewForProgress:", 0.0);
  objc_destroyWeak(&v39);
  objc_destroyWeak(v45);
  objc_destroyWeak(&location);
}

- (void)setForegroundViewController:(id)a3
{
  id v3;
  id v4;
  UIView *v5;
  id location[2];
  BuddyCoverSheetController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v7->_foregroundViewController, location[0]);
  -[BuddyCoverSheetController addChildViewController:](v7, "addChildViewController:", location[0]);
  v3 = -[BuddyCoverSheetController view](v7, "view");
  v4 = objc_msgSend(location[0], "view");
  v5 = -[BuddyCoverSheetController dimmingView](v7, "dimmingView");
  objc_msgSend(v3, "insertSubview:above:", v4, v5);

  objc_msgSend(location[0], "didMoveToParentViewController:", v7);
  objc_storeStrong(location, 0);
}

- (void)setBackgroundViewController:(id)a3
{
  id v3;
  id v4;
  UIView *v5;
  id location[2];
  BuddyCoverSheetController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v7->_backgroundViewController, location[0]);
  -[BuddyCoverSheetController addChildViewController:](v7, "addChildViewController:", location[0]);
  v3 = -[BuddyCoverSheetController view](v7, "view");
  v4 = objc_msgSend(location[0], "view");
  v5 = -[BuddyCoverSheetController dimmingView](v7, "dimmingView");
  objc_msgSend(v3, "insertSubview:below:", v4, v5);

  objc_msgSend(location[0], "didMoveToParentViewController:", v7);
  objc_storeStrong(location, 0);
}

- (void)_animationTickForPresentationValue:(BOOL)a3
{
  UIViewFloatAnimatableProperty *v3;
  double v4;
  double v5;
  UIViewFloatAnimatableProperty *v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  UIViewController *v14;
  UIView *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  UIViewController *v21;
  UIView *v22;
  NSValue *v23;
  _QWORD v24[2];
  double Center;
  double v26;
  CGRect rect;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  BOOL v35;
  SEL v36;
  BuddyCoverSheetController *v37;

  v37 = self;
  v36 = a2;
  v35 = a3;
  v3 = -[BuddyCoverSheetController progressProperty](self, "progressProperty");
  -[UIViewFloatAnimatableProperty value](v3, "value");
  v5 = v4;

  v34 = v5;
  if (v35)
  {
    v6 = -[BuddyCoverSheetController progressProperty](v37, "progressProperty");
    -[UIViewFloatAnimatableProperty presentationValue](v6, "presentationValue");
    v34 = v7;

  }
  v8 = -[BuddyCoverSheetController view](v37, "view");
  objc_msgSend(v8, "bounds");
  v30 = v9;
  v29 = v10;
  v32 = v11;
  v31 = v12;
  v13 = v11;

  v33 = v13;
  v28 = v33 - v34 * v33;
  v14 = -[BuddyCoverSheetController foregroundViewController](v37, "foregroundViewController");
  v15 = -[UIViewController view](v14, "view");
  -[UIView frame](v15, "frame");
  rect.origin.y = v16;
  rect.origin.x = v17;
  rect.size.height = v18;
  rect.size.width = v19;

  rect.origin.y = v28 - CGRectGetHeight(rect);
  Center = UIRectGetCenter(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
  v26 = v20;
  v21 = -[BuddyCoverSheetController foregroundViewController](v37, "foregroundViewController");
  v22 = -[UIViewController view](v21, "view");
  if (v35)
  {
    *(double *)v24 = Center;
    *(double *)&v24[1] = v26;
    v23 = +[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v24, "{CGPoint=dd}");
    -[UIView _setPresentationValue:forKey:](v22, "_setPresentationValue:forKey:", v23, CFSTR("position"));

  }
  else
  {
    -[UIView setCenter:](v22, "setCenter:", Center, v26);

  }
}

- (void)_updateForLocation:(CGPoint)a3 interactive:(BOOL)a4
{
  id v4;
  double v5;
  double v6;
  UIViewFloatAnimatableProperty *v7;
  double y;

  y = a3.y;
  v4 = -[BuddyCoverSheetController view](self, "view");
  objc_msgSend(v4, "bounds");
  v6 = v5;

  v7 = -[BuddyCoverSheetController progressProperty](self, "progressProperty");
  -[UIViewFloatAnimatableProperty setValue:](v7, "setValue:", 1.0 - y / v6);

  -[BuddyCoverSheetController _updateDimmingViewForProgress:](self, "_updateDimmingViewForProgress:", 1.0 - y / v6);
}

- (void)_updateDimmingViewForProgress:(double)a3
{
  UIColor *v3;
  UIView *v4;
  UIView *v5;

  v3 = +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.2);
  v4 = -[BuddyCoverSheetController dimmingView](self, "dimmingView");
  -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v3);

  v5 = -[BuddyCoverSheetController dimmingView](self, "dimmingView");
  -[UIView setAlpha:](v5, "setAlpha:", 0.5 * (1.0 - a3));

}

- (void)_dismissGestureChanged:(id)a3
{
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id location[2];
  BuddyCoverSheetController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = location[0];
  v4 = -[BuddyCoverSheetController view](v10, "view");
  objc_msgSend(v3, "locationInView:", v4);
  v7 = v5;
  v8 = v6;

  -[BuddyCoverSheetController _updateForLocation:interactive:](v10, "_updateForLocation:interactive:", 1, v7, v8);
  objc_storeStrong(location, 0);
}

- (void)_dismissGestureEndedWithGestureRecognizer:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  double v12;
  id v13;
  BOOL v14;
  id v15;
  uint64_t v16;
  void **v17;
  int v18;
  int v19;
  void (*v20)(uint64_t);
  void *v21;
  BuddyCoverSheetController *v22;
  char v23;
  void **v24;
  int v25;
  int v26;
  id (*v27)(uint64_t);
  void *v28;
  id v29[3];
  CGRect rect;
  double v31;
  uint64_t v32;
  _QWORD __b[2];
  CGRect v34;
  uint64_t v35;
  double v36;
  double v37;
  uint64_t v38;
  double v39;
  double v40;
  char v41;
  id location[2];
  BuddyCoverSheetController *v43;
  CGRect v44;
  CGRect v45;

  v43 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v41 = 0;
  v3 = location[0];
  v4 = -[BuddyCoverSheetController view](v43, "view");
  objc_msgSend(v3, "locationInView:", v4);
  v38 = v5;
  v39 = v6;
  v7 = v6;

  v40 = v7;
  v8 = location[0];
  v9 = -[BuddyCoverSheetController view](v43, "view");
  objc_msgSend(v8, "velocityInView:", v9);
  v35 = v10;
  v36 = v11;
  v12 = v11;

  v37 = v12;
  v13 = -[BuddyCoverSheetController view](v43, "view");
  objc_msgSend(v13, "bounds");
  v34 = v44;
  v14 = 1;
  if (v40 + v12 * 0.15 >= CGRectGetHeight(v44) * 0.6)
    v14 = v37 < -306.0;

  if (v14)
    v41 = 1;
  memset(__b, 0, sizeof(__b));
  __b[0] = *(_QWORD *)&CGPointZero.x;
  __b[1] = *(_QWORD *)&CGPointZero.y;
  if ((v41 & 1) == 0)
  {
    v15 = -[BuddyCoverSheetController view](v43, "view");
    objc_msgSend(v15, "bounds");
    rect = v45;
    CGRectGetHeight(v45);
    v31 = sub_1000D09C0();
    v32 = v16;
    *(double *)__b = v31;
    __b[1] = v16;

  }
  v24 = _NSConcreteStackBlock;
  v25 = -1073741824;
  v26 = 0;
  v27 = sub_1000D09F4;
  v28 = &unk_100280E40;
  v29[0] = v43;
  v29[1] = (id)__b[0];
  v29[2] = (id)__b[1];
  v17 = _NSConcreteStackBlock;
  v18 = -1073741824;
  v19 = 0;
  v20 = sub_1000D0A2C;
  v21 = &unk_100282628;
  v23 = v41 & 1;
  v22 = v43;
  +[UIView _animateUsingSpringWithTension:friction:interactive:animations:completion:](UIView, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, &v24, &v17, 300.0, 34.0);
  objc_storeStrong((id *)&v22, 0);
  objc_storeStrong(v29, 0);
  objc_storeStrong(location, 0);
}

- (void)_handleGesture:(id)a3
{
  char *v3;
  id location[2];
  BuddyCoverSheetController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (char *)objc_msgSend(location[0], "state");
  if (v3)
  {
    if ((unint64_t)(v3 - 1) < 2)
    {
      -[BuddyCoverSheetController _dismissGestureChanged:](v5, "_dismissGestureChanged:", location[0]);
    }
    else if ((unint64_t)(v3 - 3) < 3)
    {
      -[BuddyCoverSheetController _dismissGestureEndedWithGestureRecognizer:](v5, "_dismissGestureEndedWithGestureRecognizer:", location[0]);
    }
  }
  objc_storeStrong(location, 0);
}

- (UIViewController)foregroundViewController
{
  return self->_foregroundViewController;
}

- (UIViewController)backgroundViewController
{
  return self->_backgroundViewController;
}

- (id)backgroundViewControllerPresented
{
  return self->_backgroundViewControllerPresented;
}

- (void)setBackgroundViewControllerPresented:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIScreenEdgePanGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_gestureRecognizer, a3);
}

- (UIViewFloatAnimatableProperty)progressProperty
{
  return self->_progressProperty;
}

- (void)setProgressProperty:(id)a3
{
  objc_storeStrong((id *)&self->_progressProperty, a3);
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_progressProperty, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong(&self->_backgroundViewControllerPresented, 0);
  objc_storeStrong((id *)&self->_backgroundViewController, 0);
  objc_storeStrong((id *)&self->_foregroundViewController, 0);
}

@end
