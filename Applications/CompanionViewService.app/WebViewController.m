@implementation WebViewController

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WebViewController;
  -[WebViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BaseViewController viewServiceHost](self, "viewServiceHost"));
  objc_msgSend(v4, "setAllowsAlertStacking:", 1);

  -[WebViewController _presentWebsite](self, "_presentWebsite");
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)_presentWebsite
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)SFSafariViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WebViewController _url](self, "_url"));
  v5 = objc_msgSend(v3, "initWithURL:", v4);

  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setModalPresentationStyle:", 5);
  -[WebViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)cancel
{
  if (!self->_didDismissSafari)
    -[WebViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)safariViewControllerDidFinish:(id)a3
{
  id v3;

  self->_didDismissSafari = 1;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[BaseViewController viewServiceHost](self, "viewServiceHost", a3));
  objc_msgSend(v3, "invalidate");

}

- (id)_url
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BaseViewController presentationContext](self, "presentationContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvProviderRequest"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BaseViewController presentationContext](self, "presentationContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tvProviderRequest"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "providerURL"));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)didDismissSafari
{
  return self->_didDismissSafari;
}

- (void)setDidDismissSafari:(BOOL)a3
{
  self->_didDismissSafari = a3;
}

@end
