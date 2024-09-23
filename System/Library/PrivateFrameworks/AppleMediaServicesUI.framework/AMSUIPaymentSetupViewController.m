@implementation AMSUIPaymentSetupViewController

- (AMSUIPaymentSetupViewController)initWithPaymentSetupRequest:(id)a3
{
  id v5;
  AMSUIPaymentSetupViewController *v6;
  AMSUIPaymentSetupViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIPaymentSetupViewController;
  v6 = -[AMSUIPaymentSetupViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_paymentSetupRequest, a3);
    -[AMSUIPaymentSetupViewController _setup](v7, "_setup");
  }

  return v7;
}

- (void)_setup
{
  id v3;
  UIViewController *v4;
  UIViewController *childViewController;
  id v6;

  -[AMSUIPaymentSetupViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 5);
  v3 = objc_alloc(getPKPaymentSetupViewControllerClass());
  -[AMSUIPaymentSetupViewController paymentSetupRequest](self, "paymentSetupRequest");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (UIViewController *)objc_msgSend(v3, "initWithPaymentSetupRequest:", v6);
  childViewController = self->_childViewController;
  self->_childViewController = v4;

}

- (void)loadView
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(v4, "setUserInteractionEnabled:", 0);
  -[AMSUIPaymentSetupViewController setView:](self, "setView:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUIPaymentSetupViewController;
  -[AMSUIPaymentSetupViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[AMSUIPaymentSetupViewController childViewController](self, "childViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSUIPaymentSetupViewController childViewController](self, "childViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIPaymentSetupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v6 = a4;
  -[AMSUIPaymentSetupViewController setChildViewController:](self, "setChildViewController:", 0);
  v9[1] = 3221225472;
  v9[2] = __76__AMSUIPaymentSetupViewController_dismissViewControllerAnimated_completion___block_invoke;
  v9[3] = &unk_24CB4F3C0;
  v9[4] = self;
  v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)AMSUIPaymentSetupViewController;
  v9[0] = MEMORY[0x24BDAC760];
  v7 = v6;
  -[AMSUIPaymentSetupViewController dismissViewControllerAnimated:completion:](&v8, sel_dismissViewControllerAnimated_completion_, v4, v9);

}

uint64_t __76__AMSUIPaymentSetupViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentSetupViewControllerDidDismiss");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (AMSUIPaymentSetupViewControllerDelegate)delegate
{
  return (AMSUIPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPaymentSetupRequest)paymentSetupRequest
{
  return self->_paymentSetupRequest;
}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (void)setChildViewController:(id)a3
{
  objc_storeStrong((id *)&self->_childViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_paymentSetupRequest, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
