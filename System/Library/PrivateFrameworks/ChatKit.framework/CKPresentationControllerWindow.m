@implementation CKPresentationControllerWindow

- (CKPresentationControllerWindow)initWithWindowScene:(id)a3 allowsRotation:(BOOL)a4 restrictedToPortraitOrientation:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  CKPresentationControllerWindow *v7;
  CKPresentationControllerRootViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v5 = a5;
  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKPresentationControllerWindow;
  v7 = -[CKPresentationControllerWindow initWithWindowScene:](&v13, sel_initWithWindowScene_, a3);
  if (v7)
  {
    v8 = objc_alloc_init(CKPresentationControllerRootViewController);
    -[CKPresentationControllerRootViewController setAllowsRotation:](v8, "setAllowsRotation:", v6);
    -[CKPresentationControllerRootViewController setRestrictedToPortraitOrientation:](v8, "setRestrictedToPortraitOrientation:", v5);
    -[CKPresentationControllerRootViewController view](v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", 0);

    -[CKPresentationControllerWindow setRootViewController:](v7, "setRootViewController:", v8);
    -[CKPresentationControllerRootViewController view](v8, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPresentationControllerWindow addSubview:](v7, "addSubview:", v10);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentationControllerWindowLevel");
    -[CKPresentationControllerWindow setWindowLevel:](v7, "setWindowLevel:");

  }
  return v7;
}

- (CKPresentationControllerWindow)initWithFrame:(CGRect)a3 allowsRotation:(BOOL)a4 restrictedToPortraitOrientation:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  void *v12;
  void *v13;
  CKPresentationControllerWindow *v14;

  v5 = a5;
  v6 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "windowScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CKPresentationControllerWindow initWithWindowScene:frame:allowsRotation:restrictedToPortraitOrientation:](self, "initWithWindowScene:frame:allowsRotation:restrictedToPortraitOrientation:", v13, v6, v5, x, y, width, height);

  return v14;
}

- (CKPresentationControllerWindow)initWithWindowScene:(id)a3 frame:(CGRect)a4 allowsRotation:(BOOL)a5 restrictedToPortraitOrientation:(BOOL)a6
{
  double height;
  double width;
  double y;
  double x;
  CKPresentationControllerWindow *v10;
  CKPresentationControllerWindow *v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = -[CKPresentationControllerWindow initWithWindowScene:allowsRotation:restrictedToPortraitOrientation:](self, "initWithWindowScene:allowsRotation:restrictedToPortraitOrientation:", a3, a5, a6);
  v11 = v10;
  if (v10)
    -[CKPresentationControllerWindow setFrame:](v10, "setFrame:", x, y, width, height);
  return v11;
}

- (void)restrictedToPortraitOrientation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_restrictedToPortraitOrientation != a3)
  {
    v3 = a3;
    self->_restrictedToPortraitOrientation = a3;
    -[CKPresentationControllerWindow rootViewController](self, "rootViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setRestrictedToPortraitOrientation:", v3);

  }
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

- (BOOL)restrictedToPortraitOrientation
{
  return self->_restrictedToPortraitOrientation;
}

- (void)setRestrictedToPortraitOrientation:(BOOL)a3
{
  self->_restrictedToPortraitOrientation = a3;
}

@end
