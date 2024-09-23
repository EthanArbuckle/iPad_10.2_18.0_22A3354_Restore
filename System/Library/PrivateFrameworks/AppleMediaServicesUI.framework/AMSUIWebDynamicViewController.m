@implementation AMSUIWebDynamicViewController

- (AMSUIWebDynamicViewController)initWithContext:(id)a3 URL:(id)a4
{
  id v7;
  id v8;
  void *v9;
  AMSUIWebDynamicViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "bag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebDynamicViewController;
  v10 = -[AMSUIDynamicViewController initWithBag:URL:](&v12, sel_initWithBag_URL_, v9, v8);

  if (v10)
    objc_storeStrong((id *)&v10->_context, a3);

  return v10;
}

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v7 = a5;
  if (v13)
  {
    -[AMSUIWebDynamicViewController context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "postEvent:options:", CFSTR("BuyConfirmed"), MEMORY[0x24BDBD1B8]);

  }
  -[AMSUIWebDynamicViewController context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionDidFinishPurchaseWithResult:error:", v13, v7);

}

- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5
{
  void *v5;
  id v6;

  -[UIViewController ams_parentContainer](self, "ams_parentContainer", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modalPresentationDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v6, "handleModalDismissal");

}

- (AMSUIWebClientContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
