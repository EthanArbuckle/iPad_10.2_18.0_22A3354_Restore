@implementation SubscriptionOfferCodeViewController

- (SubscriptionOfferCodeViewController)initWithParameters:(id)a3
{
  id v5;
  SubscriptionOfferCodeViewController *v6;
  SubscriptionOfferCodeViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SubscriptionOfferCodeViewController;
  v6 = -[SubscriptionOfferCodeViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_parameters, a3);
    v7->_didShowOffer = 0;
  }

  return v7;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SubscriptionOfferCodeViewController;
  -[SubscriptionOfferCodeViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SubscriptionOfferCodeViewController _displayOfferViewIfNecessary](self, "_displayOfferViewIfNecessary");
}

- (void)_displayOfferViewIfNecessary
{
  if (!self->_didShowOffer)
  {
    self->_didShowOffer = 1;
    -[SubscriptionOfferCodeViewController showOfferUIWithParameters:](self, "showOfferUIWithParameters:", self->_parameters);
  }
}

- (void)onDismiss
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didDismissOfferSheet");

}

- (SubscriptionOfferCodeViewControllerDelegate)delegate
{
  return (SubscriptionOfferCodeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_parameters, 0);
}

- (void)showOfferUIWithParameters:(id)a3
{
  uint64_t v4;
  SubscriptionOfferCodeViewController *v5;

  if (a3)
    v4 = sub_2212F5208();
  else
    v4 = 0;
  v5 = self;
  sub_2211ACB68(v4);

  swift_bridgeObjectRelease();
}

@end
