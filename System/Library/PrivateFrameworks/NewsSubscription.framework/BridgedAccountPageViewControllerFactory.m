@implementation BridgedAccountPageViewControllerFactory

- (id)createAccountPageViewControllerFor:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0CD8000];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithAccountURL:", v5);

  -[BridgedAccountPageViewControllerFactory delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v7);

  return v6;
}

- (SKAccountPageViewControllerDelegate)delegate
{
  return (SKAccountPageViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
