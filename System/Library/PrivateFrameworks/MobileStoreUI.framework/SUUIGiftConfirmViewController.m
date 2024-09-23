@implementation SUUIGiftConfirmViewController

- (SUUIGiftConfirmViewController)initWithGift:(id)a3 configuration:(id)a4
{
  id v6;
  SUUIGiftConfirmViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIGiftConfirmViewController;
  v7 = -[SUUIGiftStepViewController initWithGift:configuration:](&v12, sel_initWithGift_configuration_, a3, v6);
  if (v7)
  {
    objc_msgSend(v6, "clientContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "localizedStringForKey:inTable:", CFSTR("GIFTING_REVIEW_TITLE"), CFSTR("Gifting"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_REVIEW_TITLE"), 0, CFSTR("Gifting"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftConfirmViewController setTitle:](v7, "setTitle:", v10);

    -[SUUIGiftConfirmViewController setEdgesForExtendedLayout:](v7, "setEdgesForExtendedLayout:", 0);
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SUUIGiftConfirmView termsButton](self->_confirmView, "termsButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[SUUIFocusedTouchGestureRecognizer removeTarget:action:](self->_touchRecognizer, "removeTarget:action:", self, 0);
  v4.receiver = self;
  v4.super_class = (Class)SUUIGiftConfirmViewController;
  -[SUUIGiftConfirmViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  SUUIGiftConfirmView *confirmView;
  SUUIGiftConfirmView *v4;
  void *v5;
  void *v6;
  SUUIGiftConfirmView *v7;
  SUUIGiftConfirmView *v8;
  SUUIGiftConfirmView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  confirmView = self->_confirmView;
  if (!confirmView)
  {
    v4 = [SUUIGiftConfirmView alloc];
    -[SUUIGiftStepViewController gift](self, "gift");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SUUIGiftConfirmView initWithGift:configuration:](v4, "initWithGift:configuration:", v5, v6);
    v8 = self->_confirmView;
    self->_confirmView = v7;

    v9 = self->_confirmView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftConfirmView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[SUUIGiftConfirmView termsButton](self->_confirmView, "termsButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__termsButtonAction_, 64);

    confirmView = self->_confirmView;
  }
  -[SUUIGiftConfirmViewController setView:](self, "setView:", confirmView);
  -[SUUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clientContext");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[SUUIGiftConfirmViewController _buyButtonTitle](self, "_buyButtonTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SUUIGiftConfirmViewController _newBuyBarButtonItemWithTitle:](self, "_newBuyBarButtonItemWithTitle:", v13);
  -[SUUIGiftConfirmViewController navigationItem](self, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRightBarButtonItem:", v14);

}

- (void)_buyButtonAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  SUUIFocusedTouchGestureRecognizer *v7;
  SUUIFocusedTouchGestureRecognizer *v8;
  SUUIFocusedTouchGestureRecognizer *touchRecognizer;
  void *v10;
  id v11;

  if (self->_isShowingConfirmation)
  {
    -[SUUIGiftConfirmViewController _purchaseGift](self, "_purchaseGift", a3);
    -[SUUIGiftConfirmViewController _setShowingConfirmation:animated:](self, "_setShowingConfirmation:animated:", 0, 1);
    -[SUUIGiftConfirmViewController _removeCancelGestureRecognizer](self, "_removeCancelGestureRecognizer");
    -[SUUIGiftConfirmViewController navigationItem](self, "navigationItem");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rightBarButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", 0);
LABEL_3:

    return;
  }
  -[SUUIGiftConfirmViewController _setShowingConfirmation:animated:](self, "_setShowingConfirmation:animated:", 1, 1);
  if (!self->_touchRecognizer)
  {
    -[SUUIGiftConfirmViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rightBarButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "customView");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v7 = [SUUIFocusedTouchGestureRecognizer alloc];
    v8 = -[SUUIFocusedTouchGestureRecognizer initWithFocusedView:touchAllowance:](v7, "initWithFocusedView:touchAllowance:", v11, *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
    touchRecognizer = self->_touchRecognizer;
    self->_touchRecognizer = v8;

    -[SUUIFocusedTouchGestureRecognizer addTarget:action:](self->_touchRecognizer, "addTarget:action:", self, sel__cancelBuyConfirmation_);
    -[SUUIGiftConfirmViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addGestureRecognizer:", self->_touchRecognizer);

    goto LABEL_3;
  }
}

- (void)_cancelBuyConfirmation:(id)a3
{
  -[SUUIGiftConfirmViewController _setShowingConfirmation:animated:](self, "_setShowingConfirmation:animated:", 0, 1);
  -[SUUIGiftConfirmViewController _removeCancelGestureRecognizer](self, "_removeCancelGestureRecognizer");
}

- (void)_termsButtonAction:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCF48], "termsAndConditionsURL", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  SUUIMetricsOpenURL(v3);

}

- (void)_finishPurchaseWithResult:(BOOL)a3 errorMessage:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SUUIGiftPurchaseRequest *purchaseRequest;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  v6 = a4;
  v18 = v6;
  if (v4)
  {
    -[SUUIGiftConfirmViewController _showSuccessPage](self, "_showSuccessPage");
  }
  else if (v6)
  {
    -[SUUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clientContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BEBD3B0];
    if (v8)
      objc_msgSend(v8, "localizedStringForKey:inTable:", CFSTR("GIFTING_UNABLE_TO_GIFT"), CFSTR("Gifting"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_UNABLE_TO_GIFT"), 0, CFSTR("Gifting"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v10, v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x24BEBD3A8];
    if (v8)
      objc_msgSend(v8, "localizedStringForKey:inTable:", CFSTR("GIFTING_OK_BUTTON"), CFSTR("Gifting"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_OK_BUTTON"), 0, CFSTR("Gifting"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v14);

    -[SUUIGiftConfirmViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
  }
  purchaseRequest = self->_purchaseRequest;
  self->_purchaseRequest = 0;

  -[SUUIGiftConfirmViewController navigationItem](self, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rightBarButtonItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setEnabled:", 1);

}

- (void)_purchaseGift
{
  SUUIGiftPurchaseRequest *v3;
  void *v4;
  void *v5;
  SUUIGiftPurchaseRequest *v6;
  SUUIGiftPurchaseRequest *purchaseRequest;
  SUUIGiftPurchaseRequest *v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (!self->_purchaseRequest)
  {
    objc_initWeak(&location, self);
    v3 = [SUUIGiftPurchaseRequest alloc];
    -[SUUIGiftStepViewController gift](self, "gift");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SUUIGiftPurchaseRequest initWithGift:configuration:](v3, "initWithGift:configuration:", v4, v5);
    purchaseRequest = self->_purchaseRequest;
    self->_purchaseRequest = v6;

    v8 = self->_purchaseRequest;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __46__SUUIGiftConfirmViewController__purchaseGift__block_invoke;
    v9[3] = &unk_2511F7B68;
    objc_copyWeak(&v10, &location);
    -[SUUIGiftPurchaseRequest purchaseWithCompletionBlock:](v8, "purchaseWithCompletionBlock:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __46__SUUIGiftConfirmViewController__purchaseGift__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SUUIGiftConfirmViewController__purchaseGift__block_invoke_2;
  block[3] = &unk_2511F7B40;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v10 = a2;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v9);
}

void __46__SUUIGiftConfirmViewController__purchaseGift__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_finishPurchaseWithResult:errorMessage:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)_removeCancelGestureRecognizer
{
  void *v3;
  SUUIFocusedTouchGestureRecognizer *touchRecognizer;

  -[SUUIFocusedTouchGestureRecognizer removeTarget:action:](self->_touchRecognizer, "removeTarget:action:", self, 0);
  -[SUUIFocusedTouchGestureRecognizer view](self->_touchRecognizer, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", self->_touchRecognizer);

  touchRecognizer = self->_touchRecognizer;
  self->_touchRecognizer = 0;

}

- (void)_setShowingConfirmation:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  id v9;

  if (self->_isShowingConfirmation != a3)
  {
    v4 = a4;
    if (a3)
      -[SUUIGiftConfirmViewController _confirmButtonTitle](self, "_confirmButtonTitle");
    else
      -[SUUIGiftConfirmViewController _buyButtonTitle](self, "_buyButtonTitle");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v7 = -[SUUIGiftConfirmViewController _newBuyBarButtonItemWithTitle:](self, "_newBuyBarButtonItemWithTitle:", v9);
    -[SUUIGiftConfirmViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItem:animated:", v7, v4);

    self->_isShowingConfirmation = a3;
  }
}

- (void)_showSuccessPage
{
  SUUIGiftResultViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SUUIGiftResultViewController *v8;

  v3 = [SUUIGiftResultViewController alloc];
  -[SUUIGiftStepViewController gift](self, "gift");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SUUIGiftResultViewController initWithGift:configuration:](v3, "initWithGift:configuration:", v4, v5);

  -[SUUIGiftStepViewController operationQueue](self, "operationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIGiftStepViewController setOperationQueue:](v8, "setOperationQueue:", v6);

  -[SUUIGiftConfirmViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v8, 1);

  -[SUUIGiftConfirmViewController _removeCancelGestureRecognizer](self, "_removeCancelGestureRecognizer");
}

- (id)_newBuyBarButtonItemWithTitle:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BEBD430];
  v5 = a3;
  objc_msgSend(v4, "buttonWithType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 17.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  objc_msgSend(v6, "addTarget:action:forEvents:", self, sel__buyButtonAction_, 64);
  objc_msgSend(v6, "setTitle:forState:", v5, 0);

  objc_msgSend(v6, "sizeToFit");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v6);

  return v9;
}

- (id)_buyButtonTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SUUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "localizedStringForKey:inTable:", CFSTR("GIFTING_BUY_GIFT_BUTTON"), CFSTR("Gifting"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_BUY_GIFT_BUTTON"), 0, CFSTR("Gifting"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_confirmButtonTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SUUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "localizedStringForKey:inTable:", CFSTR("GIFTING_BUY_CONFIRM_BUTTON"), CFSTR("Gifting"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_BUY_CONFIRM_BUTTON"), 0, CFSTR("Gifting"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchRecognizer, 0);
  objc_storeStrong((id *)&self->_purchaseRequest, 0);
  objc_storeStrong((id *)&self->_confirmView, 0);
}

@end
