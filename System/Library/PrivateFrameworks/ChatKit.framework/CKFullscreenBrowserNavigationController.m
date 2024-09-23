@implementation CKFullscreenBrowserNavigationController

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  objc_super v8;

  -[CKFullscreenBrowserNavigationController childViewControllers](self, "childViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (id)objc_msgSend(v4, "supportedInterfaceOrientations");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKFullscreenBrowserNavigationController;
    v5 = -[CKFullscreenBrowserNavigationController supportedInterfaceOrientations](&v8, sel_supportedInterfaceOrientations);
  }
  v6 = (unint64_t)v5;

  return v6;
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKFullscreenBrowserNavigationController;
  -[CKFullscreenBrowserNavigationController loadView](&v4, sel_loadView);
  -[CKFullscreenBrowserNavigationController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", 0);

}

- (BOOL)wantsWindowedPresentation
{
  self->_wantsWindowedPresentation = 0;
  return 0;
}

- (BOOL)preserveModalPresentationStyle
{
  self->_preserveModalPresentationStyle = 1;
  return 1;
}

- (BOOL)constrainToPresentingVCBounds
{
  return 0;
}

- (BOOL)forceWindowedPresentation
{
  return 0;
}

- (void)setWantsWindowedPresentation:(BOOL)a3
{
  self->_wantsWindowedPresentation = a3;
}

- (void)setPreserveModalPresentationStyle:(BOOL)a3
{
  self->_preserveModalPresentationStyle = a3;
}

@end
