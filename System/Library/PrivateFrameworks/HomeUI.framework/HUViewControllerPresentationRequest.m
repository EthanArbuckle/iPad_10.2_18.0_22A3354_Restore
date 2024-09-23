@implementation HUViewControllerPresentationRequest

- (id)asGeneric
{
  sub_1B8F25A34();
  return HUViewControllerPresentationRequest.asGeneric()();
}

+ (id)requestWithViewController:(id)a3
{
  id v3;
  HUViewControllerPresentationRequest *v4;

  v3 = a3;
  v4 = -[HUViewControllerPresentationRequest initWithViewController:]([HUViewControllerPresentationRequest alloc], "initWithViewController:", v3);

  return v4;
}

- (HUViewControllerPresentationRequest)initWithViewController:(id)a3
{
  id v5;
  HUViewControllerPresentationRequest *v6;
  HUViewControllerPresentationRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUViewControllerPresentationRequest;
  v6 = -[HUViewControllerPresentationRequest init](&v9, sel_init);
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

- (unint64_t)preferredPresentationType
{
  return self->_preferredPresentationType;
}

- (void)setPreferredPresentationType:(unint64_t)a3
{
  self->_preferredPresentationType = a3;
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
