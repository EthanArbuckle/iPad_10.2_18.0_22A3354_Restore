@implementation SKRemoteDismissingTransition

- (SKRemoteDismissingTransition)initWithViewController:(id)a3
{
  id v4;
  SKRemoteDismissingTransition *v5;
  SKRemoteDismissingTransition *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKRemoteDismissingTransition;
  v5 = -[SKRemoteDismissingTransition init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SKRemoteDismissingTransition setViewController:](v5, "setViewController:", v4);

  return v6;
}

- (void)dismissRemoteViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SKRemoteDismissingTransition viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__SKRemoteDismissingTransition_dismissRemoteViewController___block_invoke;
  v7[3] = &unk_1E5B267D8;
  v6 = v4;
  v8 = v6;
  LOBYTE(v4) = objc_msgSend(v5, "dismissRemoteViewControllerWithCompletion:", v7);

  if ((v4 & 1) == 0)
    objc_msgSend(v6, "completeTransition:", 1);

}

uint64_t __60__SKRemoteDismissingTransition_dismissRemoteViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (SKRemoteDismissingViewController)viewController
{
  return (SKRemoteDismissingViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
}

@end
