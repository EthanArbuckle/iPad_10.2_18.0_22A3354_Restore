@implementation SUUIRedeemWebResultsViewController

+ (BOOL)canShowResultsForRedeem:(id)a3
{
  void *v3;

  objc_msgSend(a3, "customizedThankyouURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SUUIRedeemWebResultsViewController;
  -[SUUIRedeemResultsViewController viewDidLoad](&v20, sel_viewDidLoad);
  -[SUUIRedeemResultsViewController redeem](self, "redeem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customizedThankyouURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIRedeemStepViewController clientContext](self, "clientContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8CC0]), "initWithExternalAccountURL:", v4);
  objc_msgSend(v7, "setCanMoveToOverlay:", 0);
  objc_msgSend(v7, "setClientInterface:", v6);
  -[SUUIRedeemWebResultsViewController addChildViewController:](self, "addChildViewController:", v7);
  -[SUUIRedeemWebResultsViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v7, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  -[SUUIRedeemWebResultsViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v19);

  objc_msgSend(v7, "didMoveToParentViewController:", self);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[SUUIRedeemWebResultsViewController childViewControllers](self, "childViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "willMoveToParentViewController:", 0);
        objc_msgSend(v10, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeFromSuperview");

        objc_msgSend(v10, "removeFromParentViewController");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v12.receiver = self;
  v12.super_class = (Class)SUUIRedeemWebResultsViewController;
  -[SUUIRedeemWebResultsViewController dealloc](&v12, sel_dealloc);
}

- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4
{
  SUUIRedeemNativeResultsViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SUUIRedeemNativeResultsViewController *v11;

  if (!a4)
  {
    v5 = [SUUIRedeemNativeResultsViewController alloc];
    -[SUUIRedeemResultsViewController redeem](self, "redeem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SUUIRedeemNativeResultsViewController initWithRedeem:](v5, "initWithRedeem:", v6);

    -[SUUIRedeemStepViewController clientContext](self, "clientContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRedeemStepViewController setClientContext:](v11, "setClientContext:", v7);

    -[SUUIRedeemResultsViewController setRedeemCategory:](v11, "setRedeemCategory:", -[SUUIRedeemResultsViewController redeemCategory](self, "redeemCategory"));
    -[SUUIRedeemStepViewController operationQueue](self, "operationQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRedeemNativeResultsViewController setOperationQueue:](v11, "setOperationQueue:", v8);

    -[SUUIRedeemStepViewController configuration](self, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRedeemStepViewController setConfiguration:](v11, "setConfiguration:", v9);

    -[SUUIRedeemWebResultsViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pushViewController:animated:", v11, 1);

  }
}

@end
