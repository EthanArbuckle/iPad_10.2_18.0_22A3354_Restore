@implementation AMUIPosterEditingSwitcherViewController

- (AMUIPosterEditingSwitcherViewController)initWithActiveConfiguration:(id)a3 transitionOverlayView:(id)a4
{
  id v7;
  id v8;
  AMUIPosterEditingSwitcherViewController *v9;
  AMUIPosterEditingSwitcherViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMUIPosterEditingSwitcherViewController;
  v9 = -[AMUIPosterEditingSwitcherViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activeConfiguration, a3);
    objc_storeStrong((id *)&v10->_transitionOverlayView, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t RenderId;
  void *v7;
  uint64_t v8;
  void *v9;
  PRUISModalRemoteViewController *v10;
  PRUISModalRemoteViewController *remoteViewController;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AMUIPosterEditingSwitcherViewController;
  -[AMUIPosterEditingSwitcherViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[AMUIPosterEditingSwitcherViewController transitionOverlayView](self, "transitionOverlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    RenderId = CALayerGetRenderId();

  }
  else
  {
    RenderId = 0;
  }
  objc_msgSend(v4, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_contextId");

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74CB0]), "initWithActiveConfiguration:transitionOverlayRenderId:transitionOverlayContextId:", self->_activeConfiguration, RenderId, v8);
  v10 = (PRUISModalRemoteViewController *)objc_msgSend(objc_alloc(MEMORY[0x24BE74CD0]), "initWithEntryPoint:", v9);
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = v10;

  -[PRUISModalRemoteViewController setModalInPresentation:](self->_remoteViewController, "setModalInPresentation:", 0);
  -[PRUISModalRemoteViewController setDelegate:](self->_remoteViewController, "setDelegate:", self);
  -[AMUIPosterEditingSwitcherViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_remoteViewController);

}

- (BOOL)_canShowWhileLocked
{
  return 0;
}

- (void)handleDismiss
{
  -[PRUISModalRemoteViewController sendRequestDismissalAction](self->_remoteViewController, "sendRequestDismissalAction");
}

- (void)modalRemoteViewController:(id)a3 didDismissWithResponse:(id)a4
{
  id v5;

  -[AMUIPosterEditingSwitcherViewController delegate](self, "delegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "posterEditingSwitcherViewControllerRequestsDismissal:", self);

}

- (AMUIPosterEditingSwitcherViewControllerDelegate)delegate
{
  return (AMUIPosterEditingSwitcherViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)transitionOverlayView
{
  return self->_transitionOverlayView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionOverlayView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeConfiguration, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

@end
