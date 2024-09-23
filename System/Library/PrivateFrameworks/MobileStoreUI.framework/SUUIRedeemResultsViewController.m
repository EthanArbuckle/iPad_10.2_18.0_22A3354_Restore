@implementation SUUIRedeemResultsViewController

+ (BOOL)canShowResultsForRedeem:(id)a3
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Your view controller class (%@) MUST override %@ to be considered for showing a redeem"), v7, v8);

  return 0;
}

+ (id)redeemResultsControllerForRedeem:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
      if ((objc_msgSend(v9, "canShowResultsForRedeem:", v3, (_QWORD)v12) & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }

  v10 = (void *)objc_msgSend(objc_alloc((Class)v9), "initWithRedeem:", v3);
  return v10;
}

- (SUUIRedeemResultsViewController)initWithRedeem:(id)a3
{
  id v5;
  SUUIRedeemResultsViewController *v6;
  SUUIRedeemResultsViewController *v7;
  SUUIRedeemResultsViewController *v8;
  SUUIRedeemResultsViewController *v9;
  objc_super v11;

  v5 = a3;
  if (-[SUUIRedeemResultsViewController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    +[SUUIRedeemResultsViewController redeemResultsControllerForRedeem:](SUUIRedeemResultsViewController, "redeemResultsControllerForRedeem:", v5);
    v6 = (SUUIRedeemResultsViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SUUIRedeemResultsViewController;
    v7 = -[SUUIRedeemResultsViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_redeem, a3);
    v6 = v8;
    self = v6;
  }
  v9 = v6;

  return v9;
}

- (SUUIRedeemResultsViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (SUUIRedeemResultsViewController)initWithCoder:(id)a3
{

  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIRedeemResultsViewController;
  -[SUUIRedeemResultsViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[SUUIRedeemStepViewController clientContext](self, "clientContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemResultsViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesBackButton:", 1);
  v5 = objc_alloc_init(MEMORY[0x24BEBD410]);
  objc_msgSend(v5, "setAction:", sel__doneAction_);
  objc_msgSend(v5, "setTarget:", self);
  if (v3)
    objc_msgSend(v3, "localizedStringForKey:inTable:", CFSTR("REDEEM_SUCCESS_DONE_BUTTON"), CFSTR("Redeem"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_SUCCESS_DONE_BUTTON"), 0, CFSTR("Redeem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  objc_msgSend(v5, "setStyle:", 2);
  objc_msgSend(v4, "setRightBarButtonItem:", v5);

}

- (void)_doneAction:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  SUUIITunesPassLearnMoreAlertDelegate *v7;
  void *v8;
  void *v9;
  SUUIITunesPassLearnMoreAlertDelegate *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  SUUIRedeemResultsViewController *v16;
  SUUIRedeemResultsViewController *v17;
  SUUIITunesPassLearnMoreAlertDelegate *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  SUUIITunesPassLearnMoreAlertDelegate *v22;

  if (-[SUUIRedeemStepViewController shouldShowPassbookLearnMore](self, "shouldShowPassbookLearnMore", a3)
    && (-[SUUIRedeemResultsViewController redeem](self, "redeem"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SUUIRedeemStepViewController configuration](self, "configuration"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = +[SUUIITunesPassLearnMoreAlertDelegate shouldShowAlertForRedeem:configuration:](SUUIITunesPassLearnMoreAlertDelegate, "shouldShowAlertForRedeem:configuration:", v4, v5), v5, v4, v6))
  {
    v7 = [SUUIITunesPassLearnMoreAlertDelegate alloc];
    -[SUUIRedeemStepViewController configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRedeemStepViewController clientContext](self, "clientContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SUUIITunesPassLearnMoreAlertDelegate initWithRedeemConfiguration:clientContext:](v7, "initWithRedeemConfiguration:clientContext:", v8, v9);

    -[SUUIRedeemResultsViewController presentingViewController](self, "presentingViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIITunesPassLearnMoreAlertDelegate setPresentingViewController:](v10, "setPresentingViewController:", v11);

  }
  else
  {
    v10 = 0;
  }
  -[SUUIRedeemResultsViewController redeem](self, "redeem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "redirectURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIRedeemResultsViewController parentViewController](self, "parentViewController");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (SUUIRedeemResultsViewController *)v14;
  else
    v16 = self;
  v17 = v16;

  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __47__SUUIRedeemResultsViewController__doneAction___block_invoke;
  v20[3] = &unk_2511F46D0;
  v21 = v13;
  v22 = v10;
  v18 = v10;
  v19 = v13;
  -[SUUIRedeemResultsViewController dismissViewControllerAnimated:completion:](v17, "dismissViewControllerAnimated:completion:", 1, v20);

}

void __47__SUUIRedeemResultsViewController__doneAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    SUUIMetricsOpenURL(v2);
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    if (v3)
      objc_msgSend(v3, "show");
  }
}

- (SUUIRedeem)redeem
{
  return self->_redeem;
}

- (void)setRedeem:(id)a3
{
  objc_storeStrong((id *)&self->_redeem, a3);
}

- (int64_t)redeemCategory
{
  return self->_redeemCategory;
}

- (void)setRedeemCategory:(int64_t)a3
{
  self->_redeemCategory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redeem, 0);
}

@end
