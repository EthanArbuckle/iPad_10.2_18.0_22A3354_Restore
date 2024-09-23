@implementation PKPeerPaymentMessagesContentAmountEntryViewController

- (PKPeerPaymentMessagesContentAmountEntryViewController)init
{
  PKPeerPaymentMessagesContentAmountEntryViewController *v2;
  NSDecimalNumber *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  PKCurrencyAmount *amount;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  v2 = -[PKPeerPaymentMessagesContentAmountEntryViewController init](&v12, "init");
  if (v2)
  {
    v3 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber one](NSDecimalNumber, "one"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentAmountEntryViewController _currentBalance](v2, "_currentBalance"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currency"));
    v6 = (void *)v5;
    if (v5)
      v7 = (__CFString *)v5;
    else
      v7 = CFSTR("USD");
    v8 = PKCurrencyAmountCreate(v3, &v7->isa, 0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    amount = v2->_amount;
    v2->_amount = (PKCurrencyAmount *)v9;

  }
  return v2;
}

- (PKPeerPaymentMessagesContentAmountEntryViewController)initWithMessagesAppController:(id)a3
{
  PKPeerPaymentMessagesContentAmountEntryViewController *v3;
  NSDecimalNumber *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  PKCurrencyAmount *amount;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  v3 = -[PKPeerPaymentMessagesContentBaseViewController initWithMessagesAppController:](&v13, "initWithMessagesAppController:", a3);
  if (v3)
  {
    v4 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber one](NSDecimalNumber, "one"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentAmountEntryViewController _currentBalance](v3, "_currentBalance"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currency"));
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = CFSTR("USD");
    v9 = PKCurrencyAmountCreate(v4, &v8->isa, 0);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    amount = v3->_amount;
    v3->_amount = (PKCurrencyAmount *)v10;

  }
  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  NSString *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  PKPeerPaymentMessagesContentAmountEntryView *v10;
  PKPeerPaymentMessagesContentAmountEntryView *mainView;
  unint64_t context;
  void *v13;
  PKPeerPaymentMessagesContentAmountEntryView *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id WeakRetained;
  void *v24;
  id v25;
  char v26;
  void **v27;
  uint64_t v28;
  void (*v29)(id *, void *, uint64_t);
  void *v30;
  PKPeerPaymentMessagesContentAmountEntryViewController *v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[4];
  id v39;
  id location;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  -[PKPeerPaymentMessagesContentAmountEntryViewController viewDidLoad](&v41, "viewDidLoad");
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentAmountEntryViewController traitCollection](self, "traitCollection"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));
  self->_usesAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v4, UIContentSizeCategoryAccessibilityLarge) == NSOrderedDescending;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection"));
  v7 = objc_msgSend(v6, "_presentationSemanticContext");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView"));
  objc_msgSend(v8, "setContentAlignment:", PKContentAlignmentMake(1, 1));
  objc_msgSend(v8, "setVerticalPadding:", 0.0);
  objc_msgSend(v8, "setContentInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  objc_msgSend(v8, "setIgnoreTopSafeArea:", v7 == (id)2);
  v9 = objc_alloc((Class)PKPeerPaymentMessagesContentAmountEntryView);
  objc_msgSend(v8, "bounds");
  v10 = (PKPeerPaymentMessagesContentAmountEntryView *)objc_msgSend(v9, "initWithFrame:");
  mainView = self->_mainView;
  self->_mainView = v10;

  -[PKPeerPaymentMessagesContentAmountEntryView setPresentationContext:](self->_mainView, "setPresentationContext:", v7);
  context = self->_context;
  if (context)
  {
    if (context == 1)
    {
      -[PKPeerPaymentMessagesContentAmountEntryView setSubtitleType:](self->_mainView, "setSubtitleType:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentAmountEntryView memoField](self->_mainView, "memoField"));
      objc_msgSend(v13, "setText:", self->_memo);

      v14 = self->_mainView;
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100002EC4;
      v38[3] = &unk_100020780;
      objc_copyWeak(&v39, &location);
      -[PKPeerPaymentMessagesContentAmountEntryView setMemoChangedHandler:](v14, "setMemoChangedHandler:", v38);
      objc_destroyWeak(&v39);
    }
  }
  else
  {
    -[PKPeerPaymentMessagesContentAmountEntryView setSubtitleType:](self->_mainView, "setSubtitleType:", 0);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));

  if (v15)
  {
    v16 = (id)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));
    objc_msgSend(v16, "_percentExpanded");
LABEL_7:
    v18 = v17;

    goto LABEL_8;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v18 = 1.0;
  if (WeakRetained)
  {
    v24 = WeakRetained;
    v25 = objc_loadWeakRetained((id *)&self->_delegate);
    v26 = objc_opt_respondsToSelector(v25, "percentExpanded");

    if ((v26 & 1) != 0)
    {
      v16 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v16, "percentExpanded");
      goto LABEL_7;
    }
  }
LABEL_8:
  -[PKPeerPaymentMessagesContentAmountEntryView setPercentExpanded:](self->_mainView, "setPercentExpanded:", v18);
  objc_msgSend(v8, "addSubview:", self->_mainView);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentAmountEntryView amountStepperView](self->_mainView, "amountStepperView"));
  objc_msgSend(v19, "setAmount:", self->_amount);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100002F54;
  v36[3] = &unk_1000207A8;
  objc_copyWeak(&v37, &location);
  v36[4] = self;
  objc_msgSend(v19, "setAmountChangedHandler:", v36);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100003010;
  v34[3] = &unk_1000207D0;
  objc_copyWeak(&v35, &location);
  objc_msgSend(v19, "setAmountTappedHandler:", v34);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentAmountEntryView actionView](self->_mainView, "actionView"));
  v21 = v20;
  if (self->_showSendAndRequest)
  {
    objc_msgSend(v20, "setLeadingAction:", 2);
    objc_msgSend(v21, "setTrailingAction:", 1);
  }
  if (self->_showSetupRecurringSend)
    objc_msgSend(v21, "setCenterAction:", 7);
  v27 = _NSConcreteStackBlock;
  v28 = 3221225472;
  v29 = sub_100003114;
  v30 = &unk_100020848;
  objc_copyWeak(&v33, &location);
  v31 = self;
  v22 = v19;
  v32 = v22;
  objc_msgSend(v21, "setActionHandler:", &v27);
  -[PKPeerPaymentMessagesContentAmountEntryViewController _registerForPresentationSemanticContextChanges](self, "_registerForPresentationSemanticContextChanges", v27, v28, v29, v30, v31);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);

  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  -[PKPeerPaymentMessagesContentBaseViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentAmountEntryViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setBackButtonDisplayMode:", 2);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  -[PKPeerPaymentMessagesContentAmountEntryViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[PKPeerPaymentMessagesContentAmountEntryView updateIsExpansionSupported](self->_mainView, "updateIsExpansionSupported");
  -[PKPeerPaymentMessagesContentAmountEntryView updateIsKeypadSupported](self->_mainView, "updateIsKeypadSupported");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double Height;
  objc_super v6;
  CGRect v7;

  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  -[PKPeerPaymentMessagesContentAmountEntryViewController viewWillLayoutSubviews](&v6, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentAmountEntryViewController navigationController](self, "navigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "navigationBar"));
  objc_msgSend(v4, "frame");
  Height = CGRectGetHeight(v7);

  -[PKPeerPaymentMessagesContentAmountEntryView setNavigationBarHeight:](self->_mainView, "setNavigationBarHeight:", Height);
  -[PKPeerPaymentMessagesContentAmountEntryView updateIsExpansionSupported](self->_mainView, "updateIsExpansionSupported");
  -[PKPeerPaymentMessagesContentAmountEntryView updateIsKeypadSupported](self->_mainView, "updateIsKeypadSupported");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  id v4;
  double v5;
  double v6;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  -[PKPeerPaymentMessagesContentAmountEntryViewController viewDidLayoutSubviews](&v11, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));
    objc_msgSend(v4, "_percentExpanded");
LABEL_3:
    v6 = v5;

    goto LABEL_4;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = 1.0;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector(v9, "percentExpanded");

    if ((v10 & 1) != 0)
    {
      v4 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v4, "percentExpanded");
      goto LABEL_3;
    }
  }
LABEL_4:
  -[PKPeerPaymentMessagesContentAmountEntryView setPercentExpanded:](self->_mainView, "setPercentExpanded:", v6);
}

- (void)reloadContent
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = (id)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentAmountEntryViewController _currentBalance](self, "_currentBalance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "amount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currency"));
  v5 = PKFormattedCurrencyStringFromNumber(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MESSAGES_SECTION_HEADER_BALANCE_FORMAT"), CFSTR("%@"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentAmountEntryView balanceLabel](self->_mainView, "balanceLabel"));
  objc_msgSend(v9, "setText:", v8);

  -[PKPeerPaymentMessagesContentAmountEntryView updateIsExpansionSupported](self->_mainView, "updateIsExpansionSupported");
  -[PKPeerPaymentMessagesContentAmountEntryView updateIsKeypadSupported](self->_mainView, "updateIsKeypadSupported");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentAmountEntryView amountStepperView](self->_mainView, "amountStepperView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentAmountEntryViewController _minimumTransferAmount](self, "_minimumTransferAmount"));
  objc_msgSend(v10, "setMinAmount:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentAmountEntryView amountStepperView](self->_mainView, "amountStepperView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentAmountEntryViewController _maximumTransferAmount](self, "_maximumTransferAmount"));
  objc_msgSend(v12, "setMaxAmount:", v13);

  if (+[UIKeyboard isInHardwareKeyboardMode](UIKeyboard, "isInHardwareKeyboardMode"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentAmountEntryView amountStepperView](self->_mainView, "amountStepperView"));
    objc_msgSend(v14, "becomeFirstResponder");

  }
}

- (void)_noteAmountChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKCurrencyAmount amount](self->_amount, "amount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentAmountEntryViewController _minimumTransferAmount](self, "_minimumTransferAmount"));
  if (objc_msgSend(v3, "compare:", v4) == (id)-1)
  {
    v7 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKCurrencyAmount amount](self->_amount, "amount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentAmountEntryViewController _maximumTransferAmount](self, "_maximumTransferAmount"));
    if (objc_msgSend(v5, "compare:", v6) == (id)1)
    {
      v7 = 0;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKCurrencyAmount amount](self->_amount, "amount"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](NSDecimalNumber, "zero"));
      v7 = objc_msgSend(v8, "isEqualToNumber:", v9) ^ 1;

    }
  }

  v10 = (id)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentAmountEntryView actionView](self->_mainView, "actionView"));
  objc_msgSend(v10, "setEnabled:", v7);

}

- (id)_minimumTransferAmount
{
  void *v3;
  void *v4;
  id v5;
  PKPeerPaymentMessagesContentAmountEntryViewControllerDelegate **p_delegate;
  id WeakRetained;
  void *v8;
  uint64_t v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](NSDecimalNumber, "zero"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));
LABEL_5:
    v8 = v5;
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "minimumTransferAmount"));

    v3 = (void *)v9;
    return v3;
  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    goto LABEL_5;
  }
  return v3;
}

- (id)_maximumTransferAmount
{
  void *v3;
  void *v4;
  id v5;
  PKPeerPaymentMessagesContentAmountEntryViewControllerDelegate **p_delegate;
  id WeakRetained;
  void *v8;
  uint64_t v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](NSDecimalNumber, "zero"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));
LABEL_5:
    v8 = v5;
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "maximumTransferAmount"));

    v3 = (void *)v9;
    return v3;
  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    goto LABEL_5;
  }
  return v3;
}

- (id)_currentBalance
{
  void *v3;
  id v4;
  PKPeerPaymentMessagesContentAmountEntryViewControllerDelegate **p_delegate;
  id WeakRetained;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));
LABEL_5:
    v7 = v4;
    WeakRetained = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentBalance"));

    return WeakRetained;
  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_delegate);
    goto LABEL_5;
  }
  return WeakRetained;
}

- (void)sendAnalyticsForAction:(unint64_t)a3
{
  unsigned int v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  const __CFString *v17;
  id v18;

  v18 = (id)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentAmountEntryView amountStepperView](self->_mainView, "amountStepperView"));
  v5 = objc_msgSend(v18, "usedKeypad");
  v6 = &PKAggDKeyPeerPaymentPayUsedKeypad;
  if (!v5)
    v6 = &PKAggDKeyPeerPaymentPayUsedSteppers;
  PKAnalyticsSendEvent(*v6, 0);
  v7 = v18;
  if (a3 == 2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "amount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "amount"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "amount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currency"));

    if (v9)
      v12 = v11 == 0;
    else
      v12 = 1;
    if (!v12)
    {
      v13 = objc_alloc_init((Class)NSMutableDictionary);
      v14 = PKAnalyticsAmountCategoryForAmount(v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      objc_msgSend(v13, "setObject:forKey:", v15, PKAnalyticsPayloadKeyP2PAmountCategory);

      objc_msgSend(v13, "setObject:forKey:", v11, PKAnalyticsPayloadKeyP2PCurrency);
      v16 = self->_sourceType - 1;
      if (v16 > 2)
        v17 = CFSTR("unknown");
      else
        v17 = off_100020CA0[v16];
      objc_msgSend(v13, "setObject:forKey:", v17, PKAnalyticsPayloadKeyP2PSource);
      PKAnalyticsSendEventWithDailyLimit(PKAnalyticsKeyPeerPaymentRequestToken, v13, PKAnalyticsPeerPaymentEventDailyLimit);

    }
    v7 = v18;
  }

}

- (void)_registerForPresentationSemanticContextChanges
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;
  uint64_t v9;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));
  v9 = objc_opt_class(UITraitPresentationSemanticContext);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100003DD8;
  v6[3] = &unk_100020870;
  objc_copyWeak(&v7, &location);
  v5 = objc_msgSend(v3, "registerForTraitChanges:withHandler:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)setAmount:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_amount) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_amount, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentAmountEntryView amountStepperView](self->_mainView, "amountStepperView"));
    objc_msgSend(v5, "setAmount:", v6);

    -[PKPeerPaymentMessagesContentAmountEntryViewController _noteAmountChanged](self, "_noteAmountChanged");
  }

}

- (void)setShowSendAndRequest:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (self->_showSendAndRequest != a3)
  {
    v3 = a3;
    self->_showSendAndRequest = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentAmountEntryView actionView](self->_mainView, "actionView"));
    v6 = v4;
    if (v3)
      v5 = 2;
    else
      v5 = 0;
    objc_msgSend(v4, "setLeadingAction:", v5);
    objc_msgSend(v6, "setTrailingAction:", v3);

  }
}

- (void)setShowSetupRecurringSend:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (self->_showSetupRecurringSend != a3)
  {
    v3 = a3;
    self->_showSetupRecurringSend = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentAmountEntryView actionView](self->_mainView, "actionView"));
    v6 = v4;
    if (v3)
      v5 = 7;
    else
      v5 = 0;
    objc_msgSend(v4, "setCenterAction:", v5);

  }
}

- ($85E40A55691FE2F31975A98F57E3065D)pkui_navigationStatusBarStyleDescriptor
{
  _BOOL8 v2;
  int64_t v3;
  $85E40A55691FE2F31975A98F57E3065D result;

  v2 = 1;
  v3 = 1;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (BOOL)pkui_navigationBarHidden
{
  return 1;
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (NSString)memo
{
  return self->_memo;
}

- (void)setMemo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(unint64_t)a3
{
  self->_sourceType = a3;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (BOOL)showSendAndRequest
{
  return self->_showSendAndRequest;
}

- (BOOL)showSetupRecurringSend
{
  return self->_showSetupRecurringSend;
}

- (PKPeerPaymentMessagesContentAmountEntryView)mainView
{
  return self->_mainView;
}

- (PKPeerPaymentMessagesContentAmountEntryViewControllerDelegate)delegate
{
  return (PKPeerPaymentMessagesContentAmountEntryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mainView, 0);
  objc_storeStrong((id *)&self->_memo, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end
