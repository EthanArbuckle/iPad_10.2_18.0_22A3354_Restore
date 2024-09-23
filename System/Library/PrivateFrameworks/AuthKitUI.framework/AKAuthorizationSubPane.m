@implementation AKAuthorizationSubPane

- (AKAuthorizationSubPane)initWithViewController:(id)a3
{
  id v5;
  AKAuthorizationSubPane *v6;
  AKAuthorizationSubPane *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAuthorizationSubPane;
  v6 = -[AKAuthorizationSubPane init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewController, a3);

  return v7;
}

- (AKAuthorizationSubPane)initWithView:(id)a3
{
  id v5;
  AKAuthorizationSubPane *v6;
  AKAuthorizationSubPane *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAuthorizationSubPane;
  v6 = -[AKAuthorizationSubPane init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_internalView, a3);

  return v7;
}

- (UIView)view
{
  void *v3;
  void *v4;
  void *v5;

  -[AKAuthorizationSubPane viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AKAuthorizationSubPane viewController](self, "viewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[AKAuthorizationSubPane internalView](self, "internalView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (UIView *)v5;
}

- (void)addToStackView:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v6 = a3;
  -[AKAuthorizationSubPane viewController](self, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v12, "paneViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationSubPane viewController](self, "viewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addChildViewController:", v9);

    -[AKAuthorizationSubPane view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addArrangedSubview:", v10);

    -[AKAuthorizationSubPane viewController](self, "viewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "paneViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didMoveToParentViewController:", v6);
  }
  else
  {
    -[AKAuthorizationSubPane view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addArrangedSubview:", v11);
  }

}

- (void)setCustomSpacingAfter:(double)a3
{
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  id v10;

  -[AKAuthorizationSubPane setInternalCustomSpacingAfter:](self, "setInternalCustomSpacingAfter:");
  -[AKAuthorizationSubPane view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[AKAuthorizationSubPane view](self, "view");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationSubPane view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCustomSpacing:afterView:", v9, a3);

  }
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (UIView)internalView
{
  return self->_internalView;
}

- (double)internalCustomSpacingAfter
{
  return self->_internalCustomSpacingAfter;
}

- (void)setInternalCustomSpacingAfter:(double)a3
{
  self->_internalCustomSpacingAfter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalView, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
