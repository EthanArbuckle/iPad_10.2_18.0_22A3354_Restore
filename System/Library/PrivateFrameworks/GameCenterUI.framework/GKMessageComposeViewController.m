@implementation GKMessageComposeViewController

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKMessageComposeViewController;
  -[GKMessageComposeViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[GKMessageComposeViewController gkComposeDelegate](self, "gkComposeDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didEndDisplaying");

}

- (GKMessageComposeViewControllerDelegate)gkComposeDelegate
{
  return (GKMessageComposeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_gkComposeDelegate);
}

- (void)setGkComposeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_gkComposeDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_gkComposeDelegate);
}

@end
