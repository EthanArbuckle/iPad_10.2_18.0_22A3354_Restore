@implementation AKSignaturesPresentationContext

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (UIView)sourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
}

- (void)setSourceView:(id)a3
{
  objc_storeWeak((id *)&self->_sourceView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceView);
  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end
