@implementation HUViewControllerDismissalRequest

+ (id)requestWithViewController:(id)a3
{
  id v3;
  HUViewControllerDismissalRequest *v4;

  v3 = a3;
  v4 = -[HUViewControllerDismissalRequest initWithViewController:]([HUViewControllerDismissalRequest alloc], "initWithViewController:", v3);

  return v4;
}

- (HUViewControllerDismissalRequest)initWithViewController:(id)a3
{
  id v5;
  HUViewControllerDismissalRequest *v6;
  HUViewControllerDismissalRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUViewControllerDismissalRequest;
  v6 = -[HUViewControllerDismissalRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewController, a3);
    v7->_animated = 1;
  }

  return v7;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
