@implementation CKSendAnimationWindow

- (CKSendAnimationWindow)initWithWindowScene:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CKSendAnimationWindow *v10;
  CKSendAnimationWindow *v11;
  CKGradientReferenceView *v12;
  CKGradientReferenceView *v13;
  objc_super v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKSendAnimationWindow;
  v10 = -[UIApplicationRotationFollowingWindow initWithWindowScene:](&v15, sel_initWithWindowScene_, v9);
  v11 = v10;
  if (v10)
  {
    -[CKSendAnimationWindow setFrame:](v10, "setFrame:", x, y, width, height);
    v12 = [CKGradientReferenceView alloc];
    -[CKSendAnimationWindow bounds](v11, "bounds");
    v13 = -[CKGradientReferenceView initWithFrame:](v12, "initWithFrame:");
    -[CKGradientReferenceView setAutoresizingMask:](v13, "setAutoresizingMask:", 18);
    -[CKSendAnimationWindow setGradientReferenceView:](v11, "setGradientReferenceView:", v13);
    -[CKSendAnimationWindow addSubview:](v11, "addSubview:", v13);
    -[UIAutoRotatingWindow updateForOrientation:](v11, "updateForOrientation:", objc_msgSend(v9, "interfaceOrientation"));

  }
  return v11;
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

- (CKGradientReferenceView)gradientReferenceView
{
  return self->_gradientReferenceView;
}

- (void)setGradientReferenceView:(id)a3
{
  objc_storeStrong((id *)&self->_gradientReferenceView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientReferenceView, 0);
}

@end
