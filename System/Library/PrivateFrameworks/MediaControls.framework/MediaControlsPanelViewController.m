@implementation MediaControlsPanelViewController

+ (id)panelViewControllerForCoverSheet
{
  return +[MRPlatterViewController coverSheetPlatterViewController](MRPlatterViewController, "coverSheetPlatterViewController");
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (MPAVRoutingViewController)routingViewController
{
  return self->_routingViewController;
}

- (void)setRoutingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_routingViewController, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_routingViewController, 0);
  objc_destroyWeak(&self->_delegate);
}

@end
