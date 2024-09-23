@implementation PKPeerPaymentMessagesAppViewController

- (PKPeerPaymentMessagesAppViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  PKPeerPaymentMessagesAppViewController *v8;
  uint64_t Object;
  NSObject *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  id v14;
  void *v15;
  PKPeerPaymentController *v16;
  PKPeerPaymentController *peerPaymentController;
  PKPaymentService *v18;
  PKPaymentService *paymentService;
  uint64_t v20;
  NSMutableDictionary *viewControllerForState;
  id v22;
  void *v23;
  PKTransactionSource *v24;
  PKTransactionSource *transactionSource;
  PKPaymentService *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[4];
  id v32;
  objc_super v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  PKPeerPaymentMessagesAppViewController *v37;

  v6 = a3;
  v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)PKPeerPaymentMessagesAppViewController;
  v8 = -[PKPeerPaymentMessagesAppViewController initWithNibName:bundle:](&v33, "initWithNibName:bundle:", v6, v7);
  if (v8)
  {
    Object = PKLogFacilityTypeGetObject(11);
    v10 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class(v8);
      v12 = NSStringFromClass(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138543618;
      v35 = v13;
      v36 = 2048;
      v37 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: %p Init", buf, 0x16u);

    }
    v14 = objc_alloc((Class)PKPeerPaymentController);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[PKPeerPaymentWebService sharedService](PKPeerPaymentWebService, "sharedService"));
    v16 = (PKPeerPaymentController *)objc_msgSend(v14, "initWithPeerPaymentWebService:", v15);
    peerPaymentController = v8->_peerPaymentController;
    v8->_peerPaymentController = v16;

    v18 = (PKPaymentService *)objc_alloc_init((Class)PKPaymentService);
    paymentService = v8->_paymentService;
    v8->_paymentService = v18;

    v8->_state = 0;
    v20 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    viewControllerForState = v8->_viewControllerForState;
    v8->_viewControllerForState = (NSMutableDictionary *)v20;

    v22 = objc_alloc((Class)PKTransactionSource);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController peerPaymentPass](v8->_peerPaymentController, "peerPaymentPass"));
    v24 = (PKTransactionSource *)objc_msgSend(v22, "initWithPaymentPass:", v23);
    transactionSource = v8->_transactionSource;
    v8->_transactionSource = v24;

    objc_initWeak((id *)buf, v8);
    v26 = v8->_paymentService;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100008FC0;
    v31[3] = &unk_100020CC0;
    objc_copyWeak(&v32, (id *)buf);
    -[PKPaymentService familyMembersWithCompletion:](v26, "familyMembersWithCompletion:", v31);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v27, "addObserver:selector:name:object:", v8, "_handleAccountChanged:", PKPeerPaymentControllerAccountDidChangeNotification, v8->_peerPaymentController);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v28, "addObserver:selector:name:object:", v8, "_handleRecipientBecameInvalid:", PKPeerPaymentControllerRecipientDidBecomeInvalidNotification, v8->_peerPaymentController);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v29, "addObserver:selector:name:object:", v8, "_handleNetworkConnectivityChanged:", PKNetworkConnectivityChangedNotification, 0);

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);
  }

  return v8;
}

- (void)dealloc
{
  uint64_t Object;
  NSObject *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  PKPeerPaymentMessagesAppViewController *v13;

  Object = PKLogFacilityTypeGetObject(11);
  v4 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class(self);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(_DWORD *)buf = 138543618;
    v11 = v7;
    v12 = 2048;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %p Dealloc'd", buf, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "removeObserver:", self);

  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentMessagesAppViewController;
  -[PKPeerPaymentMessagesAppViewController dealloc](&v9, "dealloc");
}

- (void)loadView
{
  uint64_t Object;
  NSObject *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  UIView *v9;
  UIView *rootView;
  id v11;
  UIView *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  PKPeerPaymentMessagesAppViewController *v18;
  __int16 v19;
  id v20;

  Object = PKLogFacilityTypeGetObject(11);
  v4 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class(self);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v15 = 138543874;
    v16 = v7;
    v17 = 2048;
    v18 = self;
    v19 = 2048;
    v20 = -[PKPeerPaymentMessagesAppViewController presentationStyle](self, "presentationStyle");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %p loadView presentationStyle = %lu", (uint8_t *)&v15, 0x20u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PKMessagesAppSharedContext sharedContext](PKMessagesAppSharedContext, "sharedContext"));
  objc_msgSend(v8, "_registerAppViewController:", self);

  v9 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 300.0, 100.0);
  rootView = self->_rootView;
  self->_rootView = v9;

  v11 = -[PKPeerPaymentMessagesAppViewController presentationStyle](self, "presentationStyle");
  v12 = self->_rootView;
  if (v11 == (id)2)
    v13 = objc_claimAutoreleasedReturnValue(+[PKPeerPaymentBubbleView referenceBackgroundColor](PKPeerPaymentBubbleView, "referenceBackgroundColor"));
  else
    v13 = objc_claimAutoreleasedReturnValue(+[PKPeerPaymentTheme backgroundColor](PKPeerPaymentTheme, "backgroundColor"));
  v14 = (void *)v13;
  -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

  -[PKPeerPaymentMessagesAppViewController setView:](self, "setView:", self->_rootView);
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPeerPaymentMessagesAppViewController;
  -[PKPeerPaymentMessagesAppViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPeerPaymentMessagesAppViewController;
  -[PKPeerPaymentMessagesAppViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  uint64_t Object;
  NSObject *v14;
  NSString *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  uint8_t buf[4];
  PKPeerPaymentMessagesAppViewController *v31;
  __int16 v32;
  void *v33;
  CGRect v34;

  v29.receiver = self;
  v29.super_class = (Class)PKPeerPaymentMessagesAppViewController;
  -[PKPeerPaymentMessagesAppViewController viewDidLayoutSubviews](&v29, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeAreaLayoutGuide"));
  objc_msgSend(v4, "layoutFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  if (v8 > 0.0)
  {
    Object = PKLogFacilityTypeGetObject(11);
    v14 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v34.origin.x = v6;
      v34.origin.y = v8;
      v34.size.width = v10;
      v34.size.height = v12;
      v15 = NSStringFromCGRect(v34);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      *(_DWORD *)buf = 134218242;
      v31 = self;
      v32 = 2114;
      v33 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesAppViewController %p: viewDidLayoutSubviews layoutFrame = %{public}@", buf, 0x16u);

    }
  }
  if (-[PKPeerPaymentMessagesAppViewController presentationStyle](self, "presentationStyle") == (id)2)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController _viewControllerForState:shouldLoad:](self, "_viewControllerForState:shouldLoad:", 12, 0));
    -[PKPeerPaymentMessagesAppViewController _balloonMaskEdgeInsets](self, "_balloonMaskEdgeInsets");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bubbleView"));
    objc_msgSend(v26, "setContentInset:", v19, v21, v23, v25);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentProtocol view](self->_activeViewController, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController view](self, "view"));
  objc_msgSend(v28, "bounds");
  objc_msgSend(v27, "setFrame:");

  if (self->_debugBallView)
    -[UIView bringSubviewToFront:](self->_rootView, "bringSubviewToFront:");
}

- (id)_viewControllerForState:(unint64_t)a3 shouldLoad:(BOOL)a4
{
  _BOOL4 v4;
  NSMutableDictionary *viewControllerForState;
  void *v8;
  void *v9;
  BOOL v10;
  NSMutableDictionary *v11;
  void *v12;

  v4 = a4;
  viewControllerForState = self->_viewControllerForState;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](viewControllerForState, "objectForKeyedSubscript:", v8));

  if (v9)
    v10 = 1;
  else
    v10 = !v4;
  if (!v10)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController _createViewControllerForState:](self, "_createViewControllerForState:", a3));
    if (v9)
    {
      v11 = self->_viewControllerForState;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v9, v12);

    }
  }
  return v9;
}

- (id)_createViewControllerForState:(unint64_t)a3
{
  __objc2_class *v4;
  id result;
  PKPeerPaymentMessagesContentAmountEntryViewController *v6;
  PKPeerPaymentMessagesContentNavigationController *v7;
  void *v8;
  PKPeerPaymentMessagesContentRenderBubbleViewController *v9;
  PKPeerPaymentMessagesContentAmountEntryViewController *v10;

  switch(a3)
  {
    case 0uLL:
      v4 = PKPeerPaymentMessagesContentBaseViewController;
      goto LABEL_19;
    case 1uLL:
      v4 = PKPeerPaymentMessagesContentOfflineViewController;
      goto LABEL_19;
    case 2uLL:
      v4 = PKPeerPaymentMessagesContentIMessageDisabledViewController;
      goto LABEL_19;
    case 3uLL:
      v4 = PKPeerPaymentMessagesContentEnableViewController;
      goto LABEL_19;
    case 4uLL:
      v4 = PKPeerPaymentMessagesContentInstallViewController;
      goto LABEL_19;
    case 5uLL:
      v4 = PKPeerPaymentMessagesContentAccountLockedViewController;
      goto LABEL_19;
    case 6uLL:
      v4 = PKPeerPaymentMessagesContentAmbiguousSenderAddressViewController;
      goto LABEL_19;
    case 7uLL:
      v4 = PKPeerPaymentMessagesContentRecipientLoadingViewController;
      goto LABEL_19;
    case 8uLL:
      v4 = PKPeerPaymentMessagesContentRecipientInvalidViewController;
      goto LABEL_19;
    case 9uLL:
      v4 = PKPeerPaymentMessagesContentRecipientGroupViewController;
      goto LABEL_19;
    case 0xAuLL:
      v4 = PKPeerPaymentMessagesContentRecipientBusinessViewController;
      goto LABEL_19;
    case 0xBuLL:
      v6 = -[PKPeerPaymentMessagesContentAmountEntryViewController initWithMessagesAppController:]([PKPeerPaymentMessagesContentAmountEntryViewController alloc], "initWithMessagesAppController:", self);
      -[PKPeerPaymentMessagesContentAmountEntryViewController setSourceType:](v6, "setSourceType:", 2);
      -[PKPeerPaymentMessagesContentAmountEntryViewController setShowSendAndRequest:](v6, "setShowSendAndRequest:", 1);
      v7 = -[PKPeerPaymentMessagesContentNavigationController initWithMessagesAppController:]([PKPeerPaymentMessagesContentNavigationController alloc], "initWithMessagesAppController:", self);
      v10 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
      -[PKPeerPaymentMessagesContentNavigationController setViewControllers:animated:](v7, "setViewControllers:animated:", v8, 0);

      return v7;
    case 0xCuLL:
      v9 = -[PKPeerPaymentMessagesContentBaseViewController initWithMessagesAppController:]([PKPeerPaymentMessagesContentRenderBubbleViewController alloc], "initWithMessagesAppController:", self);
      if (PKEnableSURFLiveBubbleDebugMode())
        -[PKPeerPaymentMessagesAppViewController enableLiveBubbleDebugMode](self, "enableLiveBubbleDebugMode");
      goto LABEL_20;
    case 0xDuLL:
      v4 = PKPeerPaymentMessagesContentRecipientRestrictedOutsideContactsViewController;
      goto LABEL_19;
    case 0xEuLL:
      v4 = PKPeerPaymentMessagesContentRecipientRestrictedOutsideFamilyViewController;
LABEL_19:
      v9 = (PKPeerPaymentMessagesContentRenderBubbleViewController *)objc_msgSend([v4 alloc], "initWithMessagesAppController:", self);
LABEL_20:
      result = v9;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)_amountEntryViewController
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController _viewControllerForState:shouldLoad:](self, "_viewControllerForState:shouldLoad:", 11, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewControllers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  return v4;
}

- (void)_transitionToState:(unint64_t)a3 animated:(BOOL)a4
{
  _QWORD block[6];
  BOOL v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000992C;
  block[3] = &unk_100020D10;
  block[4] = self;
  block[5] = a3;
  v5 = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_prewarmDeviceScoreForRecipient:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PKPeerPaymentWebService sharedService](PKPeerPaymentWebService, "sharedService"));
    objc_msgSend(v3, "prewarmDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:", PKPeerPaymentDeviceScoreEndpointIdentifierRequestToken, v4, 1);
    objc_msgSend(v3, "prewarmDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:", PKPeerPaymentDeviceScoreEndpointIdentifierQuote, v4, 1);

  }
}

- (unint64_t)_requiredContentState
{
  unint64_t v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;

  if (-[PKPeerPaymentMessagesAppViewController presentationStyle](self, "presentationStyle") != (id)2)
  {
    if (PKPassbookIsCurrentlyDeletedByUser())
      return 4;
    if (-[PKPeerPaymentMessagesAppViewController _isGroupConversation](self, "_isGroupConversation"))
      return 9;
    if (-[PKPeerPaymentMessagesAppViewController _isBusinessConversation](self, "_isBusinessConversation"))
      return 10;
    if ((PKStoreDemoModeEnabled() & 1) != 0)
      return 11;
    if (!PKNetworkConnectivityAvailable())
      return 1;
    if (!-[PKPeerPaymentMessagesAppViewController _iMessageIsEnabled](self, "_iMessageIsEnabled"))
      return 2;
    if (-[PKPeerPaymentMessagesAppViewController _requiresEnablement](self, "_requiresEnablement"))
      return 3;
    if (-[PKPeerPaymentMessagesAppViewController _accountIsLocked](self, "_accountIsLocked"))
      return 5;
    if (!-[PKPeerPaymentMessagesAppViewController recipientFoundInContacts](self, "recipientFoundInContacts"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController account](self->_peerPaymentController, "account"));
      v6 = objc_msgSend(v5, "sendRestrictionType");

      if (v6 == (id)2)
        return 13;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController recipient](self->_peerPaymentController, "recipient"));
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "status");
      if (v9)
      {
        if (v9 == (id)2)
        {
          v10 = (unint64_t)objc_msgSend(v8, "statusReason");
          if (v10 < 3)
          {
            v3 = qword_100018010[v10];
            goto LABEL_32;
          }
        }
        else if (v9 == (id)1)
        {
          v3 = 11;
LABEL_32:

          return v3;
        }
        v3 = 0;
        goto LABEL_32;
      }
    }
    v3 = 7;
    goto LABEL_32;
  }
  return 12;
}

- (void)_transitionToRequiredContentStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  PKPeerPaymentController *peerPaymentController;
  _QWORD v10[5];

  v3 = a3;
  v5 = -[PKPeerPaymentMessagesAppViewController _requiredContentState](self, "_requiredContentState");
  -[PKPeerPaymentMessagesAppViewController _transitionToState:animated:](self, "_transitionToState:animated:", v5, v3);
  if (v5 == 7)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController _recipientAddress](self, "_recipientAddress"));
    v7 = objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController _senderAddress](self, "_senderAddress"));
    v8 = (void *)v7;
    if (v6 && v7)
    {
      peerPaymentController = self->_peerPaymentController;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100009F88;
      v10[3] = &unk_100020D38;
      v10[4] = self;
      -[PKPeerPaymentController identifyRecipientWithAddress:senderAddress:completion:](peerPaymentController, "identifyRecipientWithAddress:senderAddress:completion:", v6, v8, v10);
    }
    else
    {
      -[PKPeerPaymentMessagesAppViewController _transitionToState:animated:](self, "_transitionToState:animated:", 8, 1);
    }

  }
}

- (void)_handleNetworkConnectivityChanged:(id)a3
{
  id v4;
  uint64_t Object;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v4 = a3;
  Object = PKLogFacilityTypeGetObject(11);
  v6 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Network connectivity changed.", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController activeConversation](self, "activeConversation"));
  if (v7
    && -[PKPeerPaymentMessagesAppViewController _requiredContentState](self, "_requiredContentState") != self->_state)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Updating messages content state in response to a network connectivity changed notification.", v8, 2u);
    }

    -[PKPeerPaymentMessagesAppViewController _transitionToRequiredContentStateAnimated:](self, "_transitionToRequiredContentStateAnimated:", 0);
  }

}

- (void)willBecomeActiveWithConversation:(id)a3
{
  uint64_t Object;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;

  Object = PKLogFacilityTypeGetObject(11);
  v5 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "recipientAddresses"));
    v7 = 138412546;
    v8 = a3;
    v9 = 2112;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Will become active with conversation: %@, recipientAddresses:%@", (uint8_t *)&v7, 0x16u);

  }
}

- (void)didBecomeActiveWithConversation:(id)a3
{
  uint64_t Object;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;

  Object = PKLogFacilityTypeGetObject(11);
  v6 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "recipientAddresses"));
    v8 = 138412546;
    v9 = a3;
    v10 = 2112;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Did become active with conversation: %@, recipientAddresses:%@", (uint8_t *)&v8, 0x16u);

  }
  -[PKPeerPaymentMessagesAppViewController _transitionToRequiredContentStateAnimated:](self, "_transitionToRequiredContentStateAnimated:", 0);
}

- (void)willResignActiveWithConversation:(id)a3
{
  uint64_t Object;
  NSObject *v6;
  int v7;
  PKPeerPaymentMessagesAppViewController *v8;
  __int16 v9;
  id v10;

  Object = PKLogFacilityTypeGetObject(11);
  v6 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218242;
    v8 = self;
    v9 = 2112;
    v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Controller:%p Will resign active with conversation: %@", (uint8_t *)&v7, 0x16u);
  }

}

- (void)didResignActiveWithConversation:(id)a3
{
  id v4;
  uint64_t Object;
  NSObject *v6;
  PKPeerPaymentMessage *pendingFormalPaymentRequestMesssage;
  PKCurrencyAmount *pendingInformalPaymentRequestAmount;
  PKPeerPaymentRecurringPayment *pendingRecurringPayment;
  int v10;
  PKPeerPaymentMessagesAppViewController *v11;
  __int16 v12;
  id v13;

  v4 = a3;
  Object = PKLogFacilityTypeGetObject(11);
  v6 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218242;
    v11 = self;
    v12 = 2112;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Controller:%p Did resign active with conversation: %@", (uint8_t *)&v10, 0x16u);
  }

  -[PKPeerPaymentController reset](self->_peerPaymentController, "reset");
  if (self->_pendingFormalPaymentRequestMesssage || self->_pendingInformalPaymentRequestAmount)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Controller:%p Invalidating pending request values.", (uint8_t *)&v10, 0xCu);
    }

    pendingFormalPaymentRequestMesssage = self->_pendingFormalPaymentRequestMesssage;
    self->_pendingFormalPaymentRequestMesssage = 0;

    pendingInformalPaymentRequestAmount = self->_pendingInformalPaymentRequestAmount;
    self->_pendingInformalPaymentRequestAmount = 0;

    pendingRecurringPayment = self->_pendingRecurringPayment;
    self->_pendingRecurringPayment = 0;

  }
}

- (void)didReceiveMessage:(id)a3 conversation:(id)a4
{
  uint64_t Object;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  Object = PKLogFacilityTypeGetObject(11);
  v6 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "peerPaymentMessage"));
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Received message: %@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)didSelectMessage:(id)a3 conversation:(id)a4
{
  void *v5;
  uint64_t Object;
  NSObject *v7;
  NSString *v8;
  uint64_t v9;
  NSDecimalNumber *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "peerPaymentMessage"));
  Object = PKLogFacilityTypeGetObject(11);
  v7 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Selected message: %@", (uint8_t *)&v14, 0xCu);
  }

  if (objc_msgSend(v5, "type") == (id)2)
  {
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currency"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "amount"));
    v10 = (NSDecimalNumber *)v9;
    if (v8 && v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController _amountEntryViewController](self, "_amountEntryViewController"));
      v12 = PKCurrencyAmountCreate(v10, v8, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      objc_msgSend(v11, "setAmount:", v13);

    }
  }

}

- (void)_validateMessageForSending:(id)a3 conversation:(id)a4 completionHandler:(id)a5
{
  -[PKPeerPaymentMessagesAppViewController _validateMessageForSending:conversation:associatedText:completionHandler:](self, "_validateMessageForSending:conversation:associatedText:completionHandler:", a3, a4, 0, a5);
}

- (BOOL)_canPerformQuoteForMessage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t Object;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint8_t v25[16];
  uint8_t buf[16];

  v6 = a3;
  if (-[PKPeerPaymentMessagesAppViewController _isGroupConversation](self, "_isGroupConversation")
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recipientAddress")),
        v8 = -[PKPeerPaymentMessagesAppViewController _recipientAddressIsValid:](self, "_recipientAddressIsValid:", v7),
        v7,
        (v8 & 1) == 0))
  {
    Object = PKLogFacilityTypeGetObject(11);
    v19 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Recipient identifier doesn't match current conversation recipient. Hence failing validation.", buf, 2u);
    }

    if (a4)
    {
      v20 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_BUBBLE_RECIPIENT_MISMATCH_ERROR_TITLE"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v21 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_BUBBLE_RECIPIENT_MISMATCH_ERROR_DESCRIPTION"));
      v17 = objc_claimAutoreleasedReturnValue(v21);
LABEL_16:
      v22 = (void *)v17;
      v23 = PKDisplayableErrorCustom(v15, v17, 0, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue(v23);

      LOBYTE(a4) = 0;
    }
  }
  else
  {
    if (-[PKPeerPaymentMessagesAppViewController recipientFoundInContacts](self, "recipientFoundInContacts")
      || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController account](self->_peerPaymentController, "account")),
          v10 = objc_msgSend(v9, "sendRestrictionType"),
          v9,
          v10 != (id)2))
    {
      LOBYTE(a4) = 1;
      goto LABEL_18;
    }
    v11 = PKLogFacilityTypeGetObject(11);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: The curent user cannot sent to people outside of their contacts. Hence failing validation.", v25, 2u);
    }

    if (a4)
    {
      if (objc_msgSend(v6, "type") == (id)2)
        v13 = CFSTR("PEER_PAYMENT_RECIPIENT_DOES_NOT_ALLOW_REQUESTS_TITLE");
      else
        v13 = CFSTR("PEER_PAYMENT_RECIPIENT_DOES_NOT_ALLOW_SENDS_TITLE");
      v14 = PKLocalizedPeerPaymentString(&v13->isa);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_MESSAGES_RECIPIENT_CONTACTS_RESTRICTED_MESSAGE"));
      v17 = objc_claimAutoreleasedReturnValue(v16);
      goto LABEL_16;
    }
  }
LABEL_18:

  return (char)a4;
}

- (BOOL)_recipientAddressIsValid:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t Object;
  NSObject *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = PKIDSNormalizedAddress();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController recipientAddress](self, "recipientAddress"));
  v8 = PKIDSNormalizedAddress();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (objc_msgSend(v9, "isEqualToString:", v6))
  {
    Object = PKLogFacilityTypeGetObject(11);
    v11 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: recipientAddress matches conversationAddress.", buf, 2u);
    }
    v12 = 1;
  }
  else
  {
    v13 = PKPeerPaymentNormalizedMergedPinningIdentifiersForRecipientAddress(v4);
    v11 = objc_claimAutoreleasedReturnValue(v13);
    if (-[NSObject containsObject:](v11, "containsObject:", v6)
      && -[NSObject containsObject:](v11, "containsObject:", v9))
    {
      v14 = PKLogFacilityTypeGetObject(11);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: addresses match mergedPinningIdentifiers.", v19, 2u);
      }
      v12 = 1;
    }
    else
    {
      v16 = PKLogFacilityTypeGetObject(11);
      v15 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: mismatch between addresses and mergedPinningIdentifiers.", v18, 2u);
      }
      v12 = 0;
    }

  }
  return v12;
}

- (void)_shouldProceedPerformingQuote:(id)a3 message:(id)a4 memoText:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t Object;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  __int128 *p_buf;
  uint64_t v33;
  __int128 buf;
  uint64_t v35;
  char v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  Object = PKLogFacilityTypeGetObject(11);
  v15 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Should proceed performing quote: %@", (uint8_t *)&buf, 0xCu);
  }

  if (v13)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v35 = 0x2020000000;
    v36 = 1;
    if (objc_msgSend(v10, "riskLevel"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dynamicFraudContent"));
      v17 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationDontDismissOnUnlock);
      objc_msgSend(v17, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationAllowMenuButtonDismissal);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "header"));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, kCFUserNotificationAlertHeaderKey);

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "message"));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, kCFUserNotificationAlertMessageKey);

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "defaultButtonTitle"));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, kCFUserNotificationDefaultButtonTitleKey);

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "otherButtonTitle"));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, kCFUserNotificationOtherButtonTitleKey);

      v22 = 2;
    }
    else
    {
      if (!-[PKPeerPaymentMessagesAppViewController _peerPaymentParicipantShouldSeeMemoSharingMessageForMemo:](self, "_peerPaymentParicipantShouldSeeMemoSharingMessageForMemo:", v12))goto LABEL_10;
      v17 = objc_alloc_init((Class)NSMutableDictionary);
      objc_msgSend(v17, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationDontDismissOnUnlock);
      objc_msgSend(v17, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationAllowMenuButtonDismissal);
      v23 = PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_MESSAGES_MEMO_SHARING_ALERT_TITLE"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, kCFUserNotificationAlertHeaderKey);

      v25 = PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_MESSAGES_MEMO_SHARING_ALERT_MESSAGE"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v26, kCFUserNotificationAlertMessageKey);

      v27 = PKLocalizedPaymentString(CFSTR("CONTINUE"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v28, kCFUserNotificationDefaultButtonTitleKey);

      v29 = PKLocalizedString(CFSTR("CANCEL"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(v29);
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, kCFUserNotificationOtherButtonTitleKey);
      v22 = 0;
    }

    if (v17)
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10000B014;
      v30[3] = &unk_100020D60;
      p_buf = &buf;
      v33 = v22;
      v31 = v13;
      +[PKUserNotificationAgent presentNotificationWithParameters:flags:responseHandler:](PKUserNotificationAgent, "presentNotificationWithParameters:flags:responseHandler:", v17, 0, v30);

LABEL_11:
      _Block_object_dispose(&buf, 8);
      goto LABEL_12;
    }
LABEL_10:
    (*((void (**)(id, _QWORD))v13 + 2))(v13, *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24));
    goto LABEL_11;
  }
LABEL_12:

}

- (void)_validateMessageForSending:(id)a3 conversation:(id)a4 associatedText:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t Object;
  NSObject *v13;
  unsigned __int8 v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  PKPeerPaymentMessagesAppViewController *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  char v37;
  id v38;
  uint8_t buf[4];
  PKPeerPaymentMessagesAppViewController *v40;
  __int16 v41;
  void *v42;

  v9 = a5;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "peerPaymentMessage"));
  Object = PKLogFacilityTypeGetObject(11);
  v13 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v40 = self;
    v41 = 2112;
    v42 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Controller:%p Validate message for sending: %@", buf, 0x16u);
  }

  v38 = 0;
  v14 = -[PKPeerPaymentMessagesAppViewController _canPerformQuoteForMessage:error:](self, "_canPerformQuoteForMessage:error:", v11, &v38);
  v15 = v38;
  v16 = v15;
  if ((v14 & 1) != 0)
  {
    v17 = objc_msgSend(v11, "type");
    switch((unint64_t)v17)
    {
      case 0uLL:
        goto LABEL_14;
      case 1uLL:
      case 3uLL:
        v18 = objc_alloc((Class)PKPeerPaymentController);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[PKPeerPaymentWebService sharedService](PKPeerPaymentWebService, "sharedService"));
        v20 = objc_msgSend(v18, "initWithPeerPaymentWebService:", v19);

        objc_msgSend(v20, "setDelegate:", self);
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[PKMessagesAppSharedContext sharedContext](PKMessagesAppSharedContext, "sharedContext"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "externalizedControllerStateForMessageIdentifier:", v22));

        LOBYTE(v22) = objc_msgSend(v20, "restoreStateWithExternalizedControllerState:", v23);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "quote"));
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10000B418;
        v29[3] = &unk_100020E40;
        v37 = (char)v22;
        v30 = v23;
        v31 = self;
        v32 = v11;
        v33 = v20;
        v34 = v9;
        v36 = v17;
        v35 = v10;
        v24 = v20;
        v25 = v23;
        -[PKPeerPaymentMessagesAppViewController _shouldProceedPerformingQuote:message:memoText:completion:](self, "_shouldProceedPerformingQuote:message:memoText:completion:", v28, v32, v34, v29);

        break;
      case 2uLL:
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, PKDarwinNotificationEventInAppDismissed, 0, 0, 1u);
        if (objc_msgSend(v9, "length"))
        {
          objc_msgSend(v11, "setMemo:", v9);
          v27 = &PKAggDKeyPeerPaymentBubbleRequestWithMemo;
        }
        else
        {
          v27 = &PKAggDKeyPeerPaymentBubbleRequestWithoutMemo;
        }
        PKAnalyticsSendEvent(*v27, 0);
        objc_msgSend(v11, "reportMessageSent");
LABEL_14:
        if (v10)
          (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v10, 1, 0);
        break;
      default:
        break;
    }
  }
  else
  {
    if (v15)
      -[PKPeerPaymentMessagesAppViewController _handleError:](self, "_handleError:", v15);
    if (v10)
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

}

- (void)_hostSceneIdentifierForMessageIdentifier:(id)a3 withCompletion:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)didStartSendingMessage:(id)a3 conversation:(id)a4
{
  id v5;
  uint64_t Object;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;

  v5 = a3;
  Object = PKLogFacilityTypeGetObject(11);
  v7 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "peerPaymentMessage"));
    v9 = 138412290;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Did start sending message: %@", (uint8_t *)&v9, 0xCu);

  }
  -[PKPeerPaymentMessagesAppViewController _donatePeerPaymentInteractionForMessage:](self, "_donatePeerPaymentInteractionForMessage:", v5);
  -[PKPeerPaymentMessagesAppViewController dismiss](self, "dismiss");

}

- (void)didCancelSendingMessage:(id)a3 conversation:(id)a4
{
  void *v4;
  uint64_t Object;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "peerPaymentMessage"));
  Object = PKLogFacilityTypeGetObject(11);
  v6 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Did cancel sending message: %@", (uint8_t *)&v9, 0xCu);
  }

  PKAnalyticsSendEvent(PKAggDKeyPeerPaymentPayDeleteStagedBubble, 0);
  if (objc_msgSend(v4, "type") == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PKMessagesAppSharedContext sharedContext](PKMessagesAppSharedContext, "sharedContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    objc_msgSend(v7, "removeExternalizedControllerStateDataForMessageIdentifier:", v8);

  }
}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  PKPeerPaymentMessagesContentProtocol *activeViewController;
  uint64_t v5;
  id v6;

  if (!a3)
  {
    activeViewController = self->_activeViewController;
    v5 = objc_opt_class(UINavigationController);
    if ((objc_opt_isKindOfClass(activeViewController, v5) & 1) != 0)
      v6 = -[PKPeerPaymentMessagesContentProtocol popToRootViewControllerAnimated:](self->_activeViewController, "popToRootViewControllerAnimated:", 0);
  }
  -[PKPeerPaymentMessagesContentProtocol reloadContent](self->_activeViewController, "reloadContent");
}

- (CGSize)_contentSizeThatFits:(CGSize)result presentationStyle:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4 == 2)
    -[PKPeerPaymentMessagesAppViewController contentSizeThatFits:](self, "contentSizeThatFits:", result.width, result.height, v4, v5);
  return result;
}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController _viewControllerForState:shouldLoad:](self, "_viewControllerForState:shouldLoad:", 12, 1));
  objc_msgSend(v5, "contentSizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)displaysAfterAppearance
{
  uint64_t Object;
  NSObject *v4;
  BOOL result;
  uint8_t v6[16];

  if (self->_readyForDisplay
    || -[PKPeerPaymentMessagesAppViewController presentationStyle](self, "presentationStyle") != (id)2)
  {
    result = 1;
    self->_readyForDisplay = 1;
  }
  else
  {
    Object = PKLogFacilityTypeGetObject(11);
    v4 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Deferring display to the bubble render view for transcript presentation controller.", v6, 2u);
    }

    return 0;
  }
  return result;
}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  _QWORD v16[9];

  if (a3)
  {
    v4 = (void (**)(id, id))a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController view](self, "view"));
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    v14 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", v11, v13);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000C2C8;
    v16[3] = &unk_100020E68;
    v16[5] = v7;
    v16[6] = v9;
    *(double *)&v16[7] = v11;
    *(double *)&v16[8] = v13;
    v16[4] = self;
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageWithActions:", v16));
    v4[2](v4, v15);

  }
}

- (NSString)recipientDisplayName
{
  PKPeerPaymentController *peerPaymentController;
  void *v3;
  void *v4;

  peerPaymentController = self->_peerPaymentController;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController _recipientAddress](self, "_recipientAddress"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController displayNameForRecipientAddress:](peerPaymentController, "displayNameForRecipientAddress:", v3));

  return (NSString *)v4;
}

- (BOOL)recipientFoundInContacts
{
  PKPeerPaymentController *peerPaymentController;
  void *v3;
  id v4;
  BOOL v6;

  v6 = 0;
  peerPaymentController = self->_peerPaymentController;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController _recipientAddress](self, "_recipientAddress"));
  v4 = -[PKPeerPaymentController displayNameForRecipientAddress:foundInContacts:](peerPaymentController, "displayNameForRecipientAddress:foundInContacts:", v3, &v6);

  return v6;
}

- (PKCurrencyAmount)currentBalance
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController account](self->_peerPaymentController, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentBalance"));

  return (PKCurrencyAmount *)v3;
}

- (NSDecimalNumber)minimumTransferAmount
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController account](self->_peerPaymentController, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sendToUserFeatureDescriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "minimumAmount"));

  return (NSDecimalNumber *)v4;
}

- (NSDecimalNumber)maximumTransferAmount
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController account](self->_peerPaymentController, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sendToUserFeatureDescriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "maximumAmount"));

  return (NSDecimalNumber *)v4;
}

- (void)handleAction:(unint64_t)a3 sender:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  _QWORD *v22;
  void *v23;
  id v24;
  _BOOL8 v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  PKPeerPaymentRecurringPayment *pendingRecurringPayment;
  PKPeerPaymentRecurringPayment *v36;
  PKPeerPaymentRecurringPayment *v37;
  PKPeerPaymentRecurringPayment *v38;
  void *v39;
  void *v40;
  PKPeerPaymentRecurringPayment *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  PKPeerPaymentMessagesContentProtocol *activeViewController;
  uint64_t v52;
  void *v53;
  id v54;
  PKPeerPaymentMessagesContentProtocol *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  PKPeerPaymentController *peerPaymentController;
  uint64_t v68;
  id *v69;
  uint64_t Object;
  NSObject *v71;
  const __CFString *v72;
  const __CFString *v73;
  char v74;
  void *v75;
  id v76;
  uint64_t v77;
  void *v78;
  void *v79;
  _QWORD v80[4];
  id v81;
  id v82;
  _QWORD v83[4];
  id v84;
  _QWORD v85[5];
  id v86;
  _QWORD v87[5];
  id v88;
  id v89;
  _BYTE buf[12];
  __int16 v91;
  const __CFString *v92;

  v8 = a4;
  v9 = a5;
  switch(a3)
  {
    case 1uLL:
      v10 = objc_opt_class(PKPeerPaymentMessagesContentAmountEntryViewController);
      if ((objc_opt_isKindOfClass(v8, v10) & 1) == 0)
        goto LABEL_32;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "amount"));
      -[PKPeerPaymentMessagesAppViewController _stagePaymentWithAmount:completion:](self, "_stagePaymentWithAmount:completion:", v11, v9);
      goto LABEL_6;
    case 2uLL:
      v12 = objc_opt_class(PKPeerPaymentMessagesContentAmountEntryViewController);
      if ((objc_opt_isKindOfClass(v8, v12) & 1) == 0)
        goto LABEL_32;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "amount"));
      -[PKPeerPaymentMessagesAppViewController _stageRequestWithAmount:completion:](self, "_stageRequestWithAmount:completion:", v11, v9);
LABEL_6:

LABEL_19:
      v26 = 1;
      goto LABEL_53;
    case 3uLL:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController activeConversation](self, "activeConversation"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "selectedMessage"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "peerPaymentMessage"));

      if (!v15 || objc_msgSend(v15, "type") != (id)2)
        goto LABEL_38;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[PKMessagesAppSharedContext sharedContext](PKMessagesAppSharedContext, "sharedContext"));
      objc_msgSend(v16, "handlePaymentRequestMessage:sender:completion:", v15, self, v9);
      goto LABEL_50;
    case 4uLL:
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController activeConversation](self, "activeConversation"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selectedMessage"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "peerPaymentMessage"));

      if (!v15 || objc_msgSend(v15, "type") != (id)1)
        goto LABEL_38;
      if (-[PKPeerPaymentMessagesAppViewController _requiresSetupFlow](self, "_requiresSetupFlow"))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "senderAddress"));
        v19 = objc_msgSend(v16, "length");
        v20 = 1;
        if (v19)
          v20 = 2;
        v77 = v20;
        v87[0] = _NSConcreteStackBlock;
        v87[1] = 3221225472;
        v87[2] = sub_10000CF30;
        v87[3] = &unk_100020E90;
        v87[4] = self;
        v21 = v15;
        v88 = v21;
        v89 = v9;
        v22 = objc_retainBlock(v87);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController account](self->_peerPaymentController, "account"));
        v24 = objc_msgSend(v23, "stage");

        if (v24 == (id)1)
          -[PKPeerPaymentMessagesAppViewController _presentSetupFlowWithPeerPaymentMessage:flowState:completion:](self, "_presentSetupFlowWithPeerPaymentMessage:flowState:completion:", v21, v77, v22);
        else
          -[PKPeerPaymentMessagesAppViewController _presentInlineSetupFlowWithPeerPaymentMessage:flowState:completion:](self, "_presentInlineSetupFlowWithPeerPaymentMessage:flowState:completion:", v21, v77, v22);

        v69 = &v88;
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "paymentIdentifier"));
        peerPaymentController = self->_peerPaymentController;
        v68 = PKPeerPaymentActionAccept;
        v85[0] = _NSConcreteStackBlock;
        v85[1] = 3221225472;
        v85[2] = sub_10000CFAC;
        v85[3] = &unk_100020EE0;
        v85[4] = self;
        v69 = &v86;
        v86 = v9;
        -[PKPeerPaymentController performAction:withPaymentIdentifier:completion:](peerPaymentController, "performAction:withPaymentIdentifier:completion:", v68, v16, v85);
      }

LABEL_50:
      goto LABEL_51;
    case 5uLL:
      v25 = -[PKPeerPaymentMessagesAppViewController _openWallet](self, "_openWallet");
      if (v9)
        (*((void (**)(id, _BOOL8))v9 + 2))(v9, v25);
      goto LABEL_19;
    case 6uLL:
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController activeConversation](self, "activeConversation"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "selectedMessage"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "peerPaymentMessage"));

      if (!v15 || objc_msgSend(v15, "type") != (id)1 || !objc_msgSend(v15, "hasBeenSent"))
        goto LABEL_38;
      v83[0] = _NSConcreteStackBlock;
      v83[1] = 3221225472;
      v83[2] = sub_10000D1B0;
      v83[3] = &unk_100020F08;
      v84 = v9;
      -[PKPeerPaymentMessagesAppViewController _showPaymentDetailsForMessage:completion:](self, "_showPaymentDetailsForMessage:completion:", v15, v83);
      v29 = v84;
      goto LABEL_37;
    case 7uLL:
      v30 = objc_opt_class(PKPeerPaymentMessagesContentAmountEntryViewController);
      if ((objc_opt_isKindOfClass(v8, v30) & 1) == 0)
        goto LABEL_32;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController account](self->_peerPaymentController, "account"));
      *(_QWORD *)buf = 0;
      v82 = 0;
      v26 = +[PKPeerPaymentActionController canPerformPeerPaymentAction:account:unableReason:displayableError:](PKPeerPaymentActionController, "canPerformPeerPaymentAction:account:unableReason:displayableError:", 3, v15, buf, &v82);
      v31 = v82;
      v32 = v31;
      if ((v26 & 1) != 0)
      {
        v76 = v31;
        v78 = v15;
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "amount"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController account](self->_peerPaymentController, "account"));
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "recurringPaymentsFeatureDescriptor"));

        pendingRecurringPayment = self->_pendingRecurringPayment;
        if (!pendingRecurringPayment)
        {
          v36 = (PKPeerPaymentRecurringPayment *)objc_alloc_init((Class)PKPeerPaymentRecurringPayment);
          v37 = self->_pendingRecurringPayment;
          self->_pendingRecurringPayment = v36;

          -[PKPeerPaymentRecurringPayment setFrequency:](self->_pendingRecurringPayment, "setFrequency:", 1);
          v38 = self->_pendingRecurringPayment;
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          -[PKPeerPaymentRecurringPayment setStartDate:](v38, "setStartDate:", v39);

          pendingRecurringPayment = self->_pendingRecurringPayment;
        }
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "currency"));
        -[PKPeerPaymentRecurringPayment setCurrency:](pendingRecurringPayment, "setCurrency:", v40);

        v41 = self->_pendingRecurringPayment;
        v75 = v33;
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "amount"));
        -[PKPeerPaymentRecurringPayment setAmount:](v41, "setAmount:", v42);

        v43 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController activeConversation](self, "activeConversation"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "recipientAddresses"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "firstObject"));

        v46 = objc_alloc((Class)PKPeerPaymentRecurringPaymentDetailViewController);
        v47 = -[PKPeerPaymentRecurringPayment copy](self->_pendingRecurringPayment, "copy");
        v48 = objc_msgSend(v46, "initWithRecurringPayment:recipientAddress:mode:context:peerPaymentController:remoteMessagesComposer:", v47, v45, 1, 9, self->_peerPaymentController, 0);

        objc_msgSend(v48, "setDelegate:", self);
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "minimumAmount"));
        objc_msgSend(v48, "setMinimumAmount:", v49);

        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "maximumAmount"));
        objc_msgSend(v48, "setMaximumAmount:", v50);

        objc_msgSend(v48, "setOverrideUserInterfaceStyle:", 2);
        activeViewController = self->_activeViewController;
        v52 = objc_opt_class(UINavigationController);
        if ((objc_opt_isKindOfClass(activeViewController, v52) & 1) != 0)
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController traitCollection](self, "traitCollection"));
          v54 = objc_msgSend(v53, "_presentationSemanticContext");

          if (v54 == (id)3 && PKIsPad())
          {
            objc_msgSend(v48, "setShowCancelButton:", 1);
            v55 = (PKPeerPaymentMessagesContentProtocol *)objc_msgSend(objc_alloc((Class)PKNavigationController), "initWithRootViewController:", v48);
            -[PKPeerPaymentMessagesContentProtocol setOverrideUserInterfaceStyle:](v55, "setOverrideUserInterfaceStyle:", 2);
            -[PKPeerPaymentMessagesContentProtocol setModalPresentationStyle:](v55, "setModalPresentationStyle:", 0);
            -[PKPeerPaymentMessagesAppViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v55, 1, 0);
          }
          else
          {
            v55 = self->_activeViewController;
            -[PKPeerPaymentMessagesContentProtocol setOverrideUserInterfaceStyle:](v55, "setOverrideUserInterfaceStyle:", 2);
            -[PKPeerPaymentMessagesContentProtocol pushViewController:animated:](v55, "pushViewController:animated:", v48, 1);
          }

        }
        v32 = v76;
        if (v9)
          (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);

        v15 = v78;
        v58 = v75;
      }
      else
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        objc_msgSend(v58, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationDontDismissOnUnlock);
        objc_msgSend(v58, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationAllowMenuButtonDismissal);
        v59 = PKTitleForDisplayableError(v32);
        v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
        objc_msgSend(v58, "setObject:forKeyedSubscript:", v60, kCFUserNotificationAlertHeaderKey);

        v61 = PKMessageForDisplayableError(v32);
        v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
        objc_msgSend(v58, "setObject:forKeyedSubscript:", v62, kCFUserNotificationAlertMessageKey);

        v63 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ACTION_UNAVAILABLE_ADD_CARD_BUTTON_TITLE"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
        objc_msgSend(v58, "setObject:forKeyedSubscript:", v64, kCFUserNotificationDefaultButtonTitleKey);

        v65 = PKLocalizedString(CFSTR("CANCEL_BUTTON_TITLE"));
        v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
        objc_msgSend(v58, "setObject:forKeyedSubscript:", v66, kCFUserNotificationOtherButtonTitleKey);

        +[PKUserNotificationAgent presentNotificationWithParameters:flags:responseHandler:](PKUserNotificationAgent, "presentNotificationWithParameters:flags:responseHandler:", v58, 0, &stru_100020F48);
      }

      goto LABEL_52;
    case 8uLL:
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController activeConversation](self, "activeConversation"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "selectedMessage"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "peerPaymentMessage"));

      if (v15 && objc_msgSend(v15, "type") == (id)3 && objc_msgSend(v15, "hasBeenSent"))
      {
        v80[0] = _NSConcreteStackBlock;
        v80[1] = 3221225472;
        v80[2] = sub_10000D264;
        v80[3] = &unk_100020F08;
        v81 = v9;
        -[PKPeerPaymentMessagesAppViewController _showRecurringPaymentDetailsForMessage:completion:](self, "_showRecurringPaymentDetailsForMessage:completion:", v15, v80);
        v29 = v81;
LABEL_37:

LABEL_51:
        v26 = 1;
      }
      else
      {
LABEL_38:
        v26 = 0;
      }
LABEL_52:

LABEL_53:
      Object = PKLogFacilityTypeGetObject(11);
      v71 = objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        if (a3 > 8)
          v72 = CFSTR("unknown");
        else
          v72 = *(&off_100021360 + a3);
        v73 = CFSTR("NO");
        if (v26)
          v73 = CFSTR("YES");
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v72;
        v91 = 2114;
        v92 = v73;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Handle action: %{public}@, handled: %{public}@", buf, 0x16u);
      }

      if (v9)
        v74 = v26;
      else
        v74 = 1;
      if ((v74 & 1) == 0)
        (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);

      return;
    default:
LABEL_32:
      v26 = 0;
      goto LABEL_53;
  }
}

- (void)noteReadyForDisplay
{
  uint64_t Object;
  NSObject *v4;
  uint8_t v5[16];

  if (!self->_readyForDisplay)
  {
    Object = PKLogFacilityTypeGetObject(11);
    v4 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Ready for display.", v5, 2u);
    }

    -[PKPeerPaymentMessagesAppViewController setReadyForDisplay](self, "setReadyForDisplay");
    self->_readyForDisplay = 1;
  }
}

- (BOOL)appReadyForDisplay
{
  return self->_readyForDisplay;
}

- (CGSize)contentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[UIView bounds](self->_rootView, "bounds");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)noteContentSizeNeedsUpdate
{
  uint64_t Object;
  NSObject *v4;
  uint8_t v5[16];

  Object = PKLogFacilityTypeGetObject(11);
  v4 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Requesting content size update", v5, 2u);
  }

  -[PKPeerPaymentMessagesAppViewController requestResize](self, "requestResize");
}

- (BOOL)_openWallet
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController account](self->_peerPaymentController, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "associatedPassUniqueID"));

  if (PKPassbookIsSupported())
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("shoebox://card/%@"), v3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v4));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=PASSBOOK")));
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v7 = objc_msgSend(v6, "openSensitiveURL:withOptions:", v5, 0);

  return v7;
}

- (void)_showPaymentDetailsForMessage:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t Object;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  _QWORD v37[5];
  id v38;
  uint8_t buf[4];
  id v40;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transactionIdentifier"));
  if (!v6
    || objc_msgSend(v6, "type") != (id)1
    || !objc_msgSend(v6, "hasBeenSent")
    || !objc_msgSend(v8, "length"))
  {
    v9 = 0;
    goto LABEL_8;
  }
  if (PKPassbookIsCurrentlyDeletedByUser())
  {
    PKShowAlertForWalletUninstalled(0);
LABEL_15:
    v9 = 1;
    goto LABEL_8;
  }
  if (-[PKPeerPaymentMessagesAppViewController _requiresEnablement](self, "_requiresEnablement"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationDontDismissOnUnlock);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationAllowMenuButtonDismissal);
    v11 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SHOW_DETAILS_ENABLEMENT_REQUIRED_ALERT_TITLE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, kCFUserNotificationAlertHeaderKey);

    v13 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SHOW_DETAILS_ENABLEMENT_REQUIRED_ALERT_MESSAGE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, kCFUserNotificationAlertMessageKey);

    v15 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SHOW_DETAILS_ENABLEMENT_REQUIRED_ALERT_ACTION_SETTINGS"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, kCFUserNotificationDefaultButtonTitleKey);

    v17 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SHOW_DETAILS_ENABLEMENT_REQUIRED_ALERT_ACTION_CANCEL"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, kCFUserNotificationOtherButtonTitleKey);

    +[PKUserNotificationAgent presentNotificationWithParameters:flags:responseHandler:](PKUserNotificationAgent, "presentNotificationWithParameters:flags:responseHandler:", v10, 0, &stru_100020F68);
    goto LABEL_15;
  }
  if (-[PKPeerPaymentMessagesAppViewController _requiresSetupFlow](self, "_requiresSetupFlow"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationDontDismissOnUnlock);
    objc_msgSend(v19, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationAllowMenuButtonDismissal);
    v20 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SHOW_DETAILS_SETUP_REQUIRED_ALERT_TITLE"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, kCFUserNotificationAlertHeaderKey);

    v22 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SHOW_DETAILS_SETUP_REQUIRED_ALERT_MESSAGE"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, kCFUserNotificationAlertMessageKey);

    v24 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SHOW_DETAILS_SETUP_REQUIRED_ALERT_ACTION_SET_UP"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v25, kCFUserNotificationDefaultButtonTitleKey);

    v26 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SHOW_DETAILS_SETUP_REQUIRED_ALERT_ACTION_CANCEL"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v27, kCFUserNotificationOtherButtonTitleKey);

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10000D9F8;
    v37[3] = &unk_100020F90;
    v37[4] = self;
    v38 = v6;
    +[PKUserNotificationAgent presentNotificationWithParameters:flags:responseHandler:](PKUserNotificationAgent, "presentNotificationWithParameters:flags:responseHandler:", v19, 0, v37);

    goto LABEL_15;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController peerPaymentPass](self->_peerPaymentController, "peerPaymentPass"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "deviceTransactionSourceIdentifiers"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "anyObject"));

  v31 = PKTransactionDetailsSensitiveURL(v8, v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  if (v32)
  {
    PKAnalyticsSendEvent(PKAggDKeyPeerPaymentPassTransactionFromMessages, 0);
    Object = PKLogFacilityTypeGetObject(11);
    v34 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v32;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Launching transaction details with url: %@", buf, 0xCu);
    }

    v35 = objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v9 = (uint64_t)-[NSObject openSensitiveURL:withOptions:](v35, "openSensitiveURL:withOptions:", v32, 0);
  }
  else
  {
    v36 = PKLogFacilityTypeGetObject(11);
    v35 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v6;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Could not construct transaction details URL for message: %@", buf, 0xCu);
    }
    v9 = 0;
  }

LABEL_8:
  if (v7)
    v7[2](v7, v9);

}

- (void)_showRecurringPaymentDetailsForMessage:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t Object;
  NSObject *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  uint8_t buf[4];
  void *v36;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recurringPaymentIdentifier"));
  if (v6
    && objc_msgSend(v6, "type") == (id)3
    && objc_msgSend(v6, "hasBeenSent")
    && objc_msgSend(v8, "length"))
  {
    if (PKPassbookIsCurrentlyDeletedByUser())
    {
      PKShowAlertForWalletUninstalled(0);
      goto LABEL_11;
    }
    if (-[PKPeerPaymentMessagesAppViewController _requiresEnablement](self, "_requiresEnablement"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationDontDismissOnUnlock);
      objc_msgSend(v9, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationAllowMenuButtonDismissal);
      v10 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SHOW_DETAILS_ENABLEMENT_REQUIRED_ALERT_TITLE"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, kCFUserNotificationAlertHeaderKey);

      v12 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SHOW_DETAILS_ENABLEMENT_REQUIRED_ALERT_MESSAGE"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, kCFUserNotificationAlertMessageKey);

      v14 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SHOW_DETAILS_ENABLEMENT_REQUIRED_ALERT_ACTION_SETTINGS"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, kCFUserNotificationDefaultButtonTitleKey);

      v16 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SHOW_DETAILS_ENABLEMENT_REQUIRED_ALERT_ACTION_CANCEL"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, kCFUserNotificationOtherButtonTitleKey);

      +[PKUserNotificationAgent presentNotificationWithParameters:flags:responseHandler:](PKUserNotificationAgent, "presentNotificationWithParameters:flags:responseHandler:", v9, 0, &stru_100020FB0);
      goto LABEL_11;
    }
    if (-[PKPeerPaymentMessagesAppViewController _requiresSetupFlow](self, "_requiresSetupFlow"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v18, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationDontDismissOnUnlock);
      objc_msgSend(v18, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationAllowMenuButtonDismissal);
      v19 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SHOW_DETAILS_SETUP_REQUIRED_ALERT_TITLE"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, kCFUserNotificationAlertHeaderKey);

      v21 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SHOW_DETAILS_SETUP_REQUIRED_ALERT_MESSAGE"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, kCFUserNotificationAlertMessageKey);

      v23 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SHOW_DETAILS_SETUP_REQUIRED_ALERT_ACTION_SET_UP"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, kCFUserNotificationDefaultButtonTitleKey);

      v25 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SHOW_DETAILS_SETUP_REQUIRED_ALERT_ACTION_CANCEL"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v26, kCFUserNotificationOtherButtonTitleKey);

      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_10000DEFC;
      v33[3] = &unk_100020F90;
      v33[4] = self;
      v34 = v6;
      +[PKUserNotificationAgent presentNotificationWithParameters:flags:responseHandler:](PKUserNotificationAgent, "presentNotificationWithParameters:flags:responseHandler:", v18, 0, v33);

LABEL_11:
      v27 = 1;
      if (!v7)
        goto LABEL_18;
      goto LABEL_17;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("https://wallet.apple.com/%@/%@/%@"), PKURLActionRoutePeerPaymentPass, PKURLActionRouteRecurringPayment, v8));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v28));

    Object = PKLogFacilityTypeGetObject(11);
    v31 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v29;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Launching recurring payment details with url: %@", buf, 0xCu);
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v32, "openURL:configuration:completionHandler:", v29, 0, 0);

  }
  v27 = 0;
  if (v7)
LABEL_17:
    v7[2](v7, v27);
LABEL_18:

}

- (void)localStatusForMessage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  PKPaymentService *paymentService;
  _QWORD v12[4];
  id v13;
  PKPeerPaymentMessagesAppViewController *v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "paymentIdentifier"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKTransactionSource transactionSourceIdentifiers](self->_transactionSource, "transactionSourceIdentifiers"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "anyObject"));

      paymentService = self->_paymentService;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10000E044;
      v12[3] = &unk_100020FD8;
      v13 = v6;
      v14 = self;
      v15 = v8;
      v16 = v7;
      -[PKPaymentService transactionWithServiceIdentifier:transactionSourceIdentifier:completion:](paymentService, "transactionWithServiceIdentifier:transactionSourceIdentifier:completion:", v15, v10, v12);

    }
    else
    {
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }

  }
}

- (void)remoteStatusForMessage:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  PKPeerPaymentController *peerPaymentController;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "paymentIdentifier"));
    if (v7 && PKNetworkConnectivityAvailable())
    {
      peerPaymentController = self->_peerPaymentController;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10000E258;
      v9[3] = &unk_100021000;
      v10 = v6;
      -[PKPeerPaymentController statusForPaymentIdentifier:withCompletion:](peerPaymentController, "statusForPaymentIdentifier:withCompletion:", v7, v9);

    }
    else
    {
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    }

  }
}

- (BOOL)_iMessageIsEnabled
{
  if (PKUseMockSURFServer(self, a2) && PKIsSimulator())
    return 1;
  else
    return PKiMessageIsActive();
}

- (BOOL)_requiresEnablement
{
  void *v4;
  unsigned __int8 v5;

  if ((PKUseMockSURFServer(self, a2) & 1) != 0)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController webService](self->_peerPaymentController, "webService"));
  v5 = objc_msgSend(v4, "needsRegistration");

  return v5;
}

- (BOOL)_requiresSetupFlow
{
  void *v2;
  id v3;
  uint64_t v4;
  int v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController account](self->_peerPaymentController, "account"));
  v3 = +[PKPeerPaymentOnDeviceProvisioningCheck peerPaymentPassIsProvisionedOnDeviceForAccount:](PKPeerPaymentOnDeviceProvisioningCheck, "peerPaymentPassIsProvisionedOnDeviceForAccount:", v2);
  if ((v3 & 1) != 0)
    LOBYTE(v5) = 0;
  else
    v5 = PKUseMockSURFServer(v3, v4) ^ 1;

  return v5;
}

- (BOOL)_accountIsLocked
{
  BOOL v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if ((PKUseMockSURFServer(self, a2) & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController account](self->_peerPaymentController, "account"));
    v5 = (unint64_t)objc_msgSend(v4, "state");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "associatedPassUniqueID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "passWithUniqueID:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "paymentPass"));
    v10 = objc_msgSend(v9, "activationState");
    if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      if ((objc_msgSend(v4, "identityVerificationRequired") & 1) == 0)
      {
LABEL_5:
        v3 = 1;
LABEL_8:

        return v3;
      }
    }
    else if (v5 == 4)
    {
      goto LABEL_5;
    }
    v3 = v10 == (id)3;
    goto LABEL_8;
  }
  return 0;
}

- (BOOL)_isGroupConversation
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController activeConversation](self, "activeConversation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recipientAddresses"));
  v4 = (unint64_t)objc_msgSend(v3, "count") > 1;

  return v4;
}

- (BOOL)_isBusinessConversation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController activeConversation](self, "activeConversation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recipientAddresses"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));

  LOBYTE(v2) = IMStringIsBusinessID(v5);
  return (char)v2;
}

- (id)_senderAddress
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController activeConversation](self, "activeConversation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "senderAddress"));

  return v3;
}

- (id)_recipientAddress
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController activeConversation](self, "activeConversation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recipientAddresses"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  return v4;
}

- (void)_confirmSendAmount:(id)a3 toRecipientWithCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (PKStoreDemoModeEnabled())
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationDontDismissOnUnlock);
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationAllowMenuButtonDismissal);
      v9 = PKLocalizedString(CFSTR("GENERIC_DEMO_MODE_TITLE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, kCFUserNotificationAlertMessageKey);

      v11 = PKLocalizedString(CFSTR("GENERIC_DEMO_MODE_BUTTON"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, kCFUserNotificationDefaultButtonTitleKey);

      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10000E988;
      v25[3] = &unk_100020BE0;
      v26 = v7;
      +[PKUserNotificationAgent presentNotificationWithParameters:flags:responseHandler:](PKUserNotificationAgent, "presentNotificationWithParameters:flags:responseHandler:", v8, 0, v25);

    }
    else if (-[PKPeerPaymentMessagesAppViewController recipientFoundInContacts](self, "recipientFoundInContacts")
           || (v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController account](self->_peerPaymentController, "account")),
               v14 = objc_msgSend(v13, "sendRestrictionType"),
               v13,
               v14 != (id)2))
    {
      if (-[PKPeerPaymentMessagesAppViewController _requiresSetupFlow](self, "_requiresSetupFlow"))
      {
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_10000E99C;
        v23[3] = &unk_100020F08;
        v24 = v7;
        -[PKPeerPaymentMessagesAppViewController _presentInlineSetupFlowWithAmount:flowState:completion:](self, "_presentInlineSetupFlowWithAmount:flowState:completion:", v6, 4, v23);

      }
      else
      {
        (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
      }
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationDontDismissOnUnlock);
      objc_msgSend(v15, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationAllowMenuButtonDismissal);
      v16 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_RECIPIENT_DOES_NOT_ALLOW_SENDS_TITLE"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, kCFUserNotificationAlertHeaderKey);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController recipientDisplayName](self, "recipientDisplayName"));
      v19 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MESSAGES_RECIPIENT_CONTACTS_RESTRICTED_MESSAGE"), CFSTR("%@"), v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, kCFUserNotificationAlertMessageKey);

      v21 = PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, kCFUserNotificationDefaultButtonTitleKey);

      +[PKUserNotificationAgent presentNotificationWithParameters:flags:responseHandler:](PKUserNotificationAgent, "presentNotificationWithParameters:flags:responseHandler:", v15, 0, &stru_100021020);
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);

    }
  }

}

- (void)_confirmRequestAmount:(id)a3 toRecipientWithCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  Block_layout *v23;
  void *v24;
  unsigned __int8 v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (PKStoreDemoModeEnabled())
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationDontDismissOnUnlock);
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationAllowMenuButtonDismissal);
      v9 = PKLocalizedString(CFSTR("GENERIC_DEMO_MODE_TITLE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, kCFUserNotificationAlertMessageKey);

      v11 = PKLocalizedString(CFSTR("GENERIC_DEMO_MODE_BUTTON"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, kCFUserNotificationDefaultButtonTitleKey);

      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10000EE10;
      v35[3] = &unk_100020BE0;
      v36 = v7;
      +[PKUserNotificationAgent presentNotificationWithParameters:flags:responseHandler:](PKUserNotificationAgent, "presentNotificationWithParameters:flags:responseHandler:", v8, 0, v35);

    }
    else
    {
      if (!-[PKPeerPaymentMessagesAppViewController _requiresSetupFlow](self, "_requiresSetupFlow"))
      {
        if (-[PKPeerPaymentMessagesAppViewController recipientFoundInContacts](self, "recipientFoundInContacts")
          || (v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController account](self->_peerPaymentController, "account")),
              v14 = objc_msgSend(v13, "sendRestrictionType"),
              v13,
              v14 != (id)2))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController recipient](self->_peerPaymentController, "recipient"));
          v25 = objc_msgSend(v24, "allowsFormalPaymentRequests");

          if ((v25 & 1) != 0)
          {
            (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
            goto LABEL_13;
          }
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          objc_msgSend(v15, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationDontDismissOnUnlock);
          objc_msgSend(v15, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationAllowMenuButtonDismissal);
          v26 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_RECIPIENT_DOES_NOT_ALLOW_REQUESTS_TITLE"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v27, kCFUserNotificationAlertHeaderKey);

          v28 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController recipientDisplayName](self, "recipientDisplayName"));
          v29 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_RECIPIENT_DOES_NOT_ALLOW_REQUESTS_FORMAT"), CFSTR("%@"), v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v30, kCFUserNotificationAlertMessageKey);

          v31 = PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v32, kCFUserNotificationDefaultButtonTitleKey);

          v23 = &stru_100021060;
        }
        else
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          objc_msgSend(v15, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationDontDismissOnUnlock);
          objc_msgSend(v15, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationAllowMenuButtonDismissal);
          v16 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_RECIPIENT_DOES_NOT_ALLOW_REQUESTS_TITLE"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, kCFUserNotificationAlertHeaderKey);

          v18 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController recipientDisplayName](self, "recipientDisplayName"));
          v19 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MESSAGES_RECIPIENT_CONTACTS_RESTRICTED_MESSAGE"), CFSTR("%@"), v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, kCFUserNotificationAlertMessageKey);

          v21 = PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, kCFUserNotificationDefaultButtonTitleKey);

          v23 = &stru_100021040;
        }
        +[PKUserNotificationAgent presentNotificationWithParameters:flags:responseHandler:](PKUserNotificationAgent, "presentNotificationWithParameters:flags:responseHandler:", v15, 0, v23);
        (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);

        goto LABEL_13;
      }
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_10000EE20;
      v33[3] = &unk_100020F08;
      v34 = v7;
      -[PKPeerPaymentMessagesAppViewController _presentInlineSetupFlowWithAmount:flowState:completion:](self, "_presentInlineSetupFlowWithAmount:flowState:completion:", v6, 5, v33);

    }
  }
LABEL_13:

}

- (void)_presentInlineSetupFlowWithAmount:(id)a3 flowState:(unint64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  PKPeerPaymentMessagesAppViewController *v10;
  id v11;
  id v12;
  unint64_t v13;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000EEE4;
  v9[3] = &unk_100021088;
  v10 = self;
  v11 = a3;
  v12 = a5;
  v13 = a4;
  v7 = v12;
  v8 = v11;
  -[PKPeerPaymentMessagesAppViewController _hostSceneIdentifierForMessageIdentifier:withCompletion:](v10, "_hostSceneIdentifierForMessageIdentifier:withCompletion:", 0, v9);

}

- (void)_presentInlineSetupFlowWithPeerPaymentMessage:(id)a3 flowState:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000EFC8;
  v13[3] = &unk_100021088;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  -[PKPeerPaymentMessagesAppViewController _hostSceneIdentifierForMessageIdentifier:withCompletion:](self, "_hostSceneIdentifierForMessageIdentifier:withCompletion:", v10, v13);

}

- (void)_presentInlineSetupFlowWithAmount:(id)a3 flowState:(unint64_t)a4 senderAddress:(id)a5 hostSceneIdentifier:(id)a6 completion:(id)a7
{
  id v12;
  PKPeerPaymentController *peerPaymentController;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t Object;
  NSObject *v19;
  void *v20;
  id v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _UNKNOWN **v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint8_t buf[16];

  v12 = a7;
  peerPaymentController = self->_peerPaymentController;
  v32 = a6;
  v14 = a5;
  v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController webService](peerPaymentController, "webService"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "peerPaymentService"));

  Object = PKLogFacilityTypeGetObject(11);
  v19 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Presenting peer payment setup flow via view service.", buf, 2u);
  }

  if (PKIsPad())
  {
    v31 = v17;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v30 = v15;
    v21 = v14;
    v22 = a4;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "windows"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstObject"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "windowScene"));
    v26 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v25, "interfaceOrientation")));

    a4 = v22;
    v14 = v21;
    v15 = v30;

    v17 = v31;
  }
  else
  {
    v26 = &off_1000222C0;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController account](self->_peerPaymentController, "account"));
  v28 = PKMobileSMSBundleIdentifier;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10000F27C;
  v33[3] = &unk_100020F08;
  v34 = v12;
  v29 = v12;
  objc_msgSend(v17, "presentRegistrationFlowWithAccount:amount:state:senderAddress:orientation:hostSceneIdentifier:hostSceneBundleIdentifier:completion:", v27, v15, a4, v14, v26, v32, v28, v33);

}

- (void)_presentSetupFlowWithPeerPaymentMessage:(id)a3 flowState:(unint64_t)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, id);
  uint64_t Object;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t SetupSensitiveURLWithConfiguration;
  void *v15;
  void *v16;
  id v17;
  const __CFString *v18;
  int v19;
  const __CFString *v20;

  v7 = a3;
  v8 = (void (**)(id, id))a5;
  Object = PKLogFacilityTypeGetObject(11);
  v10 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Presenting peer payment setup flow via url.", (uint8_t *)&v19, 2u);
  }

  v11 = objc_alloc_init((Class)PKPeerPaymentAccountResolutionControllerConfiguration);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currencyAmount"));
  objc_msgSend(v11, "setCurrencyAmount:", v12);

  objc_msgSend(v11, "setRegistrationFlowState:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "senderAddress"));
  objc_msgSend(v11, "setSenderAddress:", v13);

  SetupSensitiveURLWithConfiguration = PKPeerPaymentGetSetupSensitiveURLWithConfiguration(v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue(SetupSensitiveURLWithConfiguration);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v17 = objc_msgSend(v16, "openSensitiveURL:withOptions:", v15, 0);

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v18 = CFSTR("NO");
    if ((_DWORD)v17)
      v18 = CFSTR("YES");
    v19 = 138543362;
    v20 = v18;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Peer payment setup flow presented with success %{public}@.", (uint8_t *)&v19, 0xCu);
  }

  if (v8)
    v8[2](v8, v17);

}

- (void)_handleRecipientBecameInvalid:(id)a3
{
  id v4;
  uint64_t Object;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v4 = a3;
  Object = PKLogFacilityTypeGetObject(11);
  v6 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Recipient became invalid.", buf, 2u);
  }

  if (-[PKPeerPaymentMessagesAppViewController _requiredContentState](self, "_requiredContentState") != self->_state)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Updating messages content state in response to recipient becoming invalid.", v7, 2u);
    }

    -[PKPeerPaymentMessagesAppViewController _transitionToRequiredContentStateAnimated:](self, "_transitionToRequiredContentStateAnimated:", 1);
  }

}

- (BOOL)_peerPaymentParicipantShouldSeeMemoSharingMessageForMemo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController account](self->_peerPaymentController, "account"));
  if (objc_msgSend(v5, "role") == (id)1 && objc_msgSend(v4, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("PKPeerPaymentParticipantSharingMemoMessage")));
    v8 = objc_msgSend(v7, "BOOLValue") ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)_currentRequestTokenForAmount:(id)a3
{
  void *v3;

  if (self->_pendingFormalPaymentRequestMesssage)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessage requestToken](self->_pendingFormalPaymentRequestMesssage, "requestToken", a3));
  }
  else if (-[PKCurrencyAmount isEqual:](self->_pendingInformalPaymentRequestAmount, "isEqual:", a3))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PKPeerPaymentRequestToken informalRequestToken](PKPeerPaymentRequestToken, "informalRequestToken"));
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_handleAccountChanged:(id)a3
{
  void *v4;
  uint64_t Object;
  NSObject *v6;
  uint8_t v7[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController activeConversation](self, "activeConversation", a3));

  if (v4
    && -[PKPeerPaymentMessagesAppViewController _requiredContentState](self, "_requiredContentState") != self->_state)
  {
    Object = PKLogFacilityTypeGetObject(11);
    v6 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Updating messages content state in response to an account changed notification.", v7, 2u);
    }

    -[PKPeerPaymentMessagesAppViewController _transitionToRequiredContentStateAnimated:](self, "_transitionToRequiredContentStateAnimated:", 0);
  }
}

- (void)_updateWithFamilyCollection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController account](self->_peerPaymentController, "account"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController _amountEntryViewController](self, "_amountEntryViewController"));
  if (objc_msgSend(v4, "supportsRecurringPayments"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentUser"));
    if (objc_msgSend(v4, "isEligibleForRecurringPaymentsForUser:", v6))
      v7 = PKIsVision() ^ 1;
    else
      v7 = 0;
    objc_msgSend(v5, "setShowSetupRecurringSend:", v7);

  }
  else
  {
    objc_msgSend(v5, "setShowSetupRecurringSend:", 0);
  }

}

- (void)_stagePaymentWithAmount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKPeerPaymentRecurringPayment *pendingRecurringPayment;
  _QWORD *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  pendingRecurringPayment = self->_pendingRecurringPayment;
  self->_pendingRecurringPayment = 0;

  if (self->_pendingInformalPaymentRequestAmount)
    v9 = &PKAggDKeyPeerPaymentOriginPayDataDetector;
  else
    v9 = &PKAggDKeyPeerPaymentOriginPayMessages;
  PKAnalyticsSendEvent(*v9, 0);
  -[PKPeerPaymentController selectMode:](self->_peerPaymentController, "selectMode:", 1);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000F990;
  v12[3] = &unk_100020E90;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[PKPeerPaymentMessagesAppViewController _confirmSendAmount:toRecipientWithCompletion:](self, "_confirmSendAmount:toRecipientWithCompletion:", v11, v12);

}

- (void)_stageRequestWithAmount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKPeerPaymentRecurringPayment *pendingRecurringPayment;
  _QWORD *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  pendingRecurringPayment = self->_pendingRecurringPayment;
  self->_pendingRecurringPayment = 0;

  if (self->_pendingInformalPaymentRequestAmount)
    v9 = &PKAggDKeyPeerPaymentOriginRequestDataDetector;
  else
    v9 = &PKAggDKeyPeerPaymentOriginRequestMessages;
  PKAnalyticsSendEvent(*v9, 0);
  -[PKPeerPaymentController selectMode:](self->_peerPaymentController, "selectMode:", 3);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000FD7C;
  v12[3] = &unk_100020E90;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[PKPeerPaymentMessagesAppViewController _confirmRequestAmount:toRecipientWithCompletion:](self, "_confirmRequestAmount:toRecipientWithCompletion:", v11, v12);

}

- (void)_stageRecurringPayment:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  PKPeerPaymentMessagesAppViewController *v18;
  id v19;
  id v20;
  id v21;
  id location;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_pendingRecurringPayment, a3);
  -[PKPeerPaymentController selectMode:](self->_peerPaymentController, "selectMode:", 1);
  objc_initWeak(&location, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "amount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currency"));
  v11 = PKCurrencyAmountMake(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100010204;
  v16[3] = &unk_100021150;
  v13 = v7;
  v17 = v13;
  v18 = self;
  v14 = v12;
  v19 = v14;
  objc_copyWeak(&v21, &location);
  v15 = v8;
  v20 = v15;
  -[PKPeerPaymentMessagesAppViewController _confirmSendAmount:toRecipientWithCompletion:](self, "_confirmSendAmount:toRecipientWithCompletion:", v14, v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (void)_confirmPaymentMessageInsertionWithQuote:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t Object;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;

  v6 = a3;
  v7 = a4;
  Object = PKLogFacilityTypeGetObject(11);
  v9 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Confirm payment message insertion with peer payment quote: %@", buf, 0xCu);
  }

  if ((id)+[CNContactStore authorizationStatusForEntityType:](CNContactStore, "authorizationStatusForEntityType:", 0) != (id)3)goto LABEL_7;
  if (-[PKPeerPaymentMessagesAppViewController recipientFoundInContacts](self, "recipientFoundInContacts"))
    goto LABEL_7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationDontDismissOnUnlock);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationAllowMenuButtonDismissal);
  v11 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONFIRM_UNKNOWN_RECIPIENT_TITLE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, kCFUserNotificationAlertHeaderKey);

  v13 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONFIRM_UNKNOWN_RECIPIENT_MESSAGE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, kCFUserNotificationAlertMessageKey);

  v15 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONFIRM_UNKNOWN_RECIPIENT_ACTION_CONTINUE"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, kCFUserNotificationDefaultButtonTitleKey);

  v17 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONFIRM_UNKNOWN_RECIPIENT_ACTION_CANCEL"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, kCFUserNotificationOtherButtonTitleKey);

  if (v10)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100010828;
    v19[3] = &unk_100021178;
    v19[4] = self;
    v20 = v6;
    v21 = v7;
    +[PKUserNotificationAgent presentNotificationWithParameters:flags:responseHandler:](PKUserNotificationAgent, "presentNotificationWithParameters:flags:responseHandler:", v10, 0, v19);

  }
  else
  {
LABEL_7:
    -[PKPeerPaymentMessagesAppViewController _insertPaymentMessageWithQuote:completion:](self, "_insertPaymentMessageWithQuote:completion:", v6, v7);
  }

}

- (void)_insertPaymentMessageWithQuote:(id)a3 completion:(id)a4
{
  PKPeerPaymentMessage *v6;
  id v7;
  uint64_t Object;
  NSObject *v9;
  NSDecimalNumber *v10;
  NSString *v11;
  uint64_t v12;
  void *v13;
  PKPeerPaymentMessage *pendingFormalPaymentRequestMesssage;
  void *v15;
  void *v16;
  PKPeerPaymentMessage *v17;
  unsigned int v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  PKPeerPaymentMessage *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  PKPeerPaymentMessagesAppViewController *v48;
  id v49;
  uint8_t buf[4];
  PKPeerPaymentMessage *v51;

  v6 = (PKPeerPaymentMessage *)a3;
  v7 = a4;
  Object = PKLogFacilityTypeGetObject(11);
  v9 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v51 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Insert payment message with peer payment quote: %@", buf, 0xCu);
  }

  v10 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessage totalReceiveAmount](v6, "totalReceiveAmount"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessage totalReceiveAmountCurrency](v6, "totalReceiveAmountCurrency"));
  v12 = PKCurrencyAmountCreate(v10, v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  pendingFormalPaymentRequestMesssage = self->_pendingFormalPaymentRequestMesssage;
  if (pendingFormalPaymentRequestMesssage)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessage underlyingMessage](pendingFormalPaymentRequestMesssage, "underlyingMessage"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "session"));

    if (v16)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v17 = self->_pendingFormalPaymentRequestMesssage;
        *(_DWORD *)buf = 138412290;
        v51 = v17;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Found a pending formal payment request message. Inserted message will have session %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v16 = 0;
  }
  v18 = -[PKPeerPaymentMessage isRecurringPayment](v6, "isRecurringPayment");
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessage recurringPaymentIdentifier](v6, "recurringPaymentIdentifier"));

    if (v19)
    {
      v20 = objc_alloc((Class)MSSession);
      v21 = objc_alloc((Class)NSUUID);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessage recurringPaymentIdentifier](v6, "recurringPaymentIdentifier"));
      v23 = objc_msgSend(v21, "initWithUUIDString:", v22);
      v24 = objc_msgSend(v20, "initWithIdentifier:", v23);
      v25 = v16;
      v26 = v13;
      v27 = v7;
      v28 = v24;

      v29 = 3;
      v30 = v28;
      v7 = v27;
      v13 = v26;
      v16 = v30;
    }
    else
    {
      v29 = 3;
    }
  }
  else
  {
    v29 = 1;
  }
  v31 = objc_msgSend(objc_alloc((Class)PKPeerPaymentMessage), "initWithType:session:", v29, v16);
  objc_msgSend(v31, "setCurrencyAmount:", v13);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController _senderAddress](self, "_senderAddress"));
  objc_msgSend(v31, "setSenderAddress:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController _recipientAddress](self, "_recipientAddress"));
  objc_msgSend(v31, "setRecipientAddress:", v33);

  objc_msgSend(v31, "setSource:", 2);
  v34 = self->_pendingFormalPaymentRequestMesssage;
  if (v34)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessage memo](v34, "memo"));
    objc_msgSend(v31, "setMemo:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessage requestToken](self->_pendingFormalPaymentRequestMesssage, "requestToken"));
    objc_msgSend(v31, "setRequestToken:", v36);

  }
  if (v18)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessage startDate](v6, "startDate"));
    objc_msgSend(v31, "setRecurringPaymentStartDate:", v37);

    objc_msgSend(v31, "setRecurringPaymentFrequency:", -[PKPeerPaymentMessage frequency](v6, "frequency"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentRecurringPayment memo](self->_pendingRecurringPayment, "memo"));
    objc_msgSend(v31, "setRecurringPaymentMemo:", v38);

  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[PKMessagesAppSharedContext sharedContext](PKMessagesAppSharedContext, "sharedContext"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController externalizedControllerState](self->_peerPaymentController, "externalizedControllerState"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "identifier"));
  objc_msgSend(v39, "persistExternalizedControllerState:forMessageIdentifier:", v40, v41);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController activeConversation](self, "activeConversation"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "underlyingMessage"));
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100010D20;
  v46[3] = &unk_1000211F0;
  v47 = v31;
  v48 = self;
  v49 = v7;
  v44 = v7;
  v45 = v31;
  objc_msgSend(v42, "insertMessage:completionHandler:", v43, v46);

}

- (void)_insertRequestMessageWithAmount:(id)a3 requestToken:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t Object;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  PKPeerPaymentMessagesAppViewController *v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  Object = PKLogFacilityTypeGetObject(11);
  v12 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Insert request with amount: %@ requestToken: %@", buf, 0x16u);
  }

  v13 = objc_alloc_init((Class)PKPeerPaymentMessage);
  objc_msgSend(v13, "setType:", 2);
  objc_msgSend(v13, "setCurrencyAmount:", v8);
  objc_msgSend(v13, "setRequestToken:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController _senderAddress](self, "_senderAddress"));
  objc_msgSend(v13, "setSenderAddress:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController _recipientAddress](self, "_recipientAddress"));
  objc_msgSend(v13, "setRecipientAddress:", v15);

  objc_msgSend(v13, "setSource:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController activeConversation](self, "activeConversation"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "underlyingMessage"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100011260;
  v20[3] = &unk_1000211F0;
  v21 = v13;
  v22 = self;
  v23 = v10;
  v18 = v10;
  v19 = v13;
  objc_msgSend(v16, "insertMessage:completionHandler:", v17, v20);

}

- (void)_handleError:(id)a3
{
  -[PKPeerPaymentMessagesAppViewController _handleError:forAction:withCompletion:](self, "_handleError:forAction:withCompletion:", a3, 0, 0);
}

- (void)_handleError:(id)a3 forAction:(unint64_t)a4 withCompletion:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  uint64_t Object;
  NSObject *v11;
  PKPeerPaymentController *peerPaymentController;
  void (**v13)(id, uint64_t);
  uint64_t v14;
  NSObject *v15;
  PKPeerPaymentController *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  void (**v26)(id, uint64_t);
  unint64_t v27;
  _QWORD v28[4];
  void (**v29)(id, uint64_t);
  _QWORD v30[5];
  void (**v31)(id, uint64_t);
  unint64_t v32;
  uint8_t buf[16];

  v8 = a3;
  v9 = (void (**)(id, uint64_t))a5;
  switch((unint64_t)+[PKPeerPaymentController proposedResolutionForError:](PKPeerPaymentController, "proposedResolutionForError:", v8))
  {
    case 0uLL:
      if (v9)
        v9[2](v9, 1);
      break;
    case 1uLL:
      v17 = objc_claimAutoreleasedReturnValue(+[PKPeerPaymentController displayableErrorForError:](PKPeerPaymentController, "displayableErrorForError:", v8));

      -[PKPeerPaymentMessagesAppViewController _presentAlertWithDisplayableError:](self, "_presentAlertWithDisplayableError:", v17);
      if (v9)
        v9[2](v9, 1);
      v8 = (id)v17;
      break;
    case 2uLL:
      Object = PKLogFacilityTypeGetObject(11);
      v11 = objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Displaying terms acceptance flow...", buf, 2u);
      }

      peerPaymentController = self->_peerPaymentController;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100011860;
      v30[3] = &unk_100021218;
      v32 = a4;
      v30[4] = self;
      v31 = v9;
      -[PKPeerPaymentController handleTermsAcceptanceRequiredWithError:completion:](peerPaymentController, "handleTermsAcceptanceRequiredWithError:completion:", v8, v30);
      v13 = v31;
      goto LABEL_11;
    case 3uLL:
      v14 = PKLogFacilityTypeGetObject(11);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Displaying identity verification flow...", buf, 2u);
      }

      if ((PKDeviceSupportsPeerPaymentIdentityVerification() & 1) != 0)
      {
        v16 = self->_peerPaymentController;
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_1000119AC;
        v25[3] = &unk_100021218;
        v27 = a4;
        v25[4] = self;
        v26 = v9;
        -[PKPeerPaymentController handleIdentityVerificationWithError:completion:](v16, "handleIdentityVerificationWithError:completion:", v8, v25);
        v13 = v26;
LABEL_11:

      }
      else
      {
        v18 = PKCreateAlertControllerForPeerPaymentIdentityVerificationNotSupported(0);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "title"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "message"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "actions"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "title"));
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_100011994;
        v28[3] = &unk_100020A50;
        v29 = v9;
        -[PKPeerPaymentMessagesAppViewController _presentAlertWithTitle:message:buttonTitle:completion:](self, "_presentAlertWithTitle:message:buttonTitle:completion:", v20, v21, v24, v28);

      }
      break;
    default:
      break;
  }

}

- (void)_handlePeerPaymentRemoteAlertCompletedForPaymentIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011B8C;
  block[3] = &unk_100021240;
  v9 = a3;
  v10 = a4;
  block[4] = self;
  v6 = v9;
  v7 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_presentAlertWithDisplayableError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationDontDismissOnUnlock);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationAllowMenuButtonDismissal);
  v5 = PKTitleForDisplayableError(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, kCFUserNotificationAlertHeaderKey);

  v7 = PKMessageForDisplayableError(v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, kCFUserNotificationAlertMessageKey);

  v9 = PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, kCFUserNotificationDefaultButtonTitleKey);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedRecoveryOptions"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", PKErrorRecoveryURLKey));

  if (v12 && v14)
  {
    v15 = PKLocalizedString(CFSTR("CANCEL_BUTTON_TITLE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, kCFUserNotificationDefaultButtonTitleKey);

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, kCFUserNotificationOtherButtonTitleKey);
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001213C;
  v18[3] = &unk_100020C80;
  v19 = v14;
  v17 = v14;
  +[PKUserNotificationAgent presentNotificationWithParameters:flags:responseHandler:](PKUserNotificationAgent, "presentNotificationWithParameters:flags:responseHandler:", v4, 0, v18);

}

- (BOOL)_handleTextInputPayload:(id)a3 withPayloadID:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t Object;
  uint64_t v22;
  void *v23;
  BOOL v24;
  uint64_t v25;
  void *v26;
  unsigned int v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  unsigned __int8 v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  PKPeerPaymentMessagesAppViewController *v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  _QWORD block[4];
  NSObject *v59;
  NSObject *v60;
  PKPeerPaymentMessagesAppViewController *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  NSObject *v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];

  v6 = a3;
  v7 = a4;
  if ((-[NSObject isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.messages.surf")) & 1) != 0
    || (-[NSObject isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.messages.datadetectors.currency")) & 1) != 0|| (-[NSObject isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.messages.appLaunchURLPluginPayload")) & 1) != 0)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("Currency")));
    if (v8 && (v9 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v8, v9) & 1) != 0))
    {
      v53 = self;
      v54 = v8;
      v55 = v7;
      v56 = v6;
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v10 = v8;
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v63;
        v57 = v10;
LABEL_8:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v63 != v13)
            objc_enumerationMutation(v10);
          v15 = *(NSObject **)(*((_QWORD *)&v62 + 1) + 8 * v14);
          v16 = objc_opt_class(NSDictionary);
          if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
          {
            Object = PKLogFacilityTypeGetObject(11);
            v17 = objc_claimAutoreleasedReturnValue(Object);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v67 = v15;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Text input payload currency array contains non-dictionary type: %@", buf, 0xCu);
            }
            goto LABEL_29;
          }
          v17 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("CurrencyType")));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("CurrencyValue")));
          v19 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
            break;
          v22 = objc_opt_class(NSDecimalNumber);
          if ((objc_opt_isKindOfClass(v18, v22) & 1) != 0)
          {
            v20 = v18;
LABEL_18:
            v23 = v20;
            if (v17)
              v24 = v20 == 0;
            else
              v24 = 1;
            if (!v24)
            {
              v25 = objc_opt_class(NSString);
              if ((objc_opt_isKindOfClass(v17, v25) & 1) != 0)
              {
                v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber notANumber](NSDecimalNumber, "notANumber"));
                v27 = objc_msgSend(v23, "isEqualToNumber:", v26);

                if (!v27)
                {
                  v33 = PKCurrencyDecimalAmountRound(v23);
                  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

                  v31 = objc_msgSend(objc_alloc((Class)PKCurrencyAmount), "initWithAmount:currency:exponent:", v34, v17, 0);
                  if (!v31)
                    goto LABEL_48;
                  v35 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController currentBalance](v53, "currentBalance"));
                  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "currency"));

                  v37 = objc_claimAutoreleasedReturnValue(-[NSObject currency](v31, "currency"));
                  v32 = -[NSObject isEqualToString:](v37, "isEqualToString:", v36);
                  if ((v32 & 1) != 0)
                  {
                    v38 = objc_claimAutoreleasedReturnValue(-[NSObject amount](v31, "amount"));
                    v39 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController minimumTransferAmount](v53, "minimumTransferAmount"));
                    v40 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController maximumTransferAmount](v53, "maximumTransferAmount"));
                    v41 = v31;
                    if (v39 && -[NSObject compare:](v38, "compare:", v39) == (id)-1)
                    {
                      v42 = PKLogFacilityTypeGetObject(11);
                      v43 = objc_claimAutoreleasedReturnValue(v42);
                      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        v67 = v38;
                        v68 = 2112;
                        v69 = v39;
                        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Suggested amount %@ is less than the minimum transfer amount %@. Using minimum transfer amount instead.", buf, 0x16u);
                      }

                      v44 = objc_msgSend(objc_alloc((Class)PKCurrencyAmount), "initWithAmount:currency:exponent:", v39, v36, 0);
                      v41 = v44;
                    }
                    if (v40 && -[NSObject compare:](v38, "compare:", v40) == (id)1)
                    {
                      v45 = PKLogFacilityTypeGetObject(11);
                      v46 = objc_claimAutoreleasedReturnValue(v45);
                      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        v67 = v38;
                        v68 = 2112;
                        v69 = v40;
                        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Suggested amount %@ is greater than the maximum transfer amount %@. Using maximum transfer amount instead.", buf, 0x16u);
                      }

                      v47 = objc_msgSend(objc_alloc((Class)PKCurrencyAmount), "initWithAmount:currency:exponent:", v40, v36, 0);
                      v41 = v47;
                    }
                    block[0] = _NSConcreteStackBlock;
                    block[1] = 3221225472;
                    block[2] = sub_100012900;
                    block[3] = &unk_100021268;
                    v59 = v41;
                    v60 = v56;
                    v61 = v53;
                    v48 = v41;
                    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

                  }
                  else
                  {
                    v51 = PKLogFacilityTypeGetObject(11);
                    v38 = objc_claimAutoreleasedReturnValue(v51);
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      v67 = v37;
                      v68 = 2112;
                      v69 = v36;
                      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Suggested amount's currency %@ does not match account currency %@", buf, 0x16u);
                    }
                  }

LABEL_57:
                  v6 = v56;
                  goto LABEL_58;
                }
                v10 = v57;
              }
            }
            goto LABEL_26;
          }
          v23 = 0;
LABEL_26:
          v28 = PKLogFacilityTypeGetObject(11);
          v29 = objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v67 = v15;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Text input payload currency amount dictionary does not contain appropriate values: %@", buf, 0xCu);
          }

LABEL_29:
          if (v12 == (id)++v14)
          {
            v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
            if (v12)
              goto LABEL_8;
            goto LABEL_31;
          }
        }
        v20 = (id)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber decimalNumberWithString:](NSDecimalNumber, "decimalNumberWithString:", v18));
        goto LABEL_18;
      }
LABEL_31:

LABEL_48:
      v49 = PKLogFacilityTypeGetObject(11);
      v31 = objc_claimAutoreleasedReturnValue(v49);
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = 0;
        goto LABEL_57;
      }
      *(_DWORD *)buf = 138412290;
      v6 = v56;
      v67 = v56;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "No valid currency amount was found in text input payload: %@", buf, 0xCu);
      v32 = 0;
LABEL_58:
      v8 = v54;
      v7 = v55;
    }
    else
    {
      v30 = PKLogFacilityTypeGetObject(11);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v6;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Text input payload does not contain a currency array. Payload: %@", buf, 0xCu);
      }
      v32 = 0;
    }

  }
  else
  {
    v50 = PKLogFacilityTypeGetObject(11);
    v8 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received text input payload for unhandled payloadID: %@", buf, 0xCu);
    }
    v32 = 0;
  }

  return v32;
}

- (void)_donatePeerPaymentInteractionForMessage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "peerPaymentMessage"));
  if (v4)
  {
    v12 = v4;
    v5 = objc_msgSend(v4, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController _recipientPersonForIntentDonation](self, "_recipientPersonForIntentDonation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController _inCurrencyAmountForPeerPaymentMessage:](self, "_inCurrencyAmountForPeerPaymentMessage:", v12));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "memo"));
    if (v5 == (id)2)
    {
      v9 = objc_msgSend(objc_alloc((Class)INRequestPaymentIntent), "initWithPayer:currencyAmount:note:", v6, v7, v8);
    }
    else
    {
      if (v5 != (id)1)
      {
LABEL_8:

        v4 = v12;
        goto LABEL_9;
      }
      v9 = objc_msgSend(objc_alloc((Class)INSendPaymentIntent), "initWithPayee:currencyAmount:note:", v6, v7, v8);
    }
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "_setLaunchId:", PKMobileSMSBundleIdentifier);
      objc_msgSend(v10, "_setExtensionBundleId:", PKIntentsExtensionBundleIdentifier);
      objc_msgSend(v10, "_setUiExtensionBundleId:", PKIntentsUIExtensionBundleIdentifier);
      v11 = objc_msgSend(objc_alloc((Class)INInteraction), "initWithIntent:response:", v10, 0);
      objc_msgSend(v11, "_donateInteractionWithBundleId:completion:", 0, &stru_1000212A8);

    }
    goto LABEL_8;
  }
LABEL_9:

}

- (id)_inCurrencyAmountForPeerPaymentMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "amount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currency"));

  v6 = 0;
  if (v4 && v5)
    v6 = objc_msgSend(objc_alloc((Class)INCurrencyAmount), "initWithAmount:currencyCode:", v4, v5);

  return v6;
}

- (id)_recipientPersonForIntentDonation
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController _recipientAddress](self, "_recipientAddress"));
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "containsString:", CFSTR("@")))
      v5 = 1;
    else
      v5 = 2;
    v6 = objc_msgSend(objc_alloc((Class)INPersonHandle), "initWithValue:type:", v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController contactForHandle:](self->_peerPaymentController, "contactForHandle:", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[PKPeerPaymentCounterpartHandleFormatter displayNameForCounterpartHandle:contact:](PKPeerPaymentCounterpartHandleFormatter, "displayNameForCounterpartHandle:contact:", v4, v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nameComponents"));
    v11 = objc_msgSend(objc_alloc((Class)INPerson), "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v6, v10, v9, 0, v8, v8);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_handlePaymentRequestMessage:(id)a3
{
  id v5;
  id v6;
  uint64_t Object;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  NSDecimalNumber *v11;
  BOOL v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  void *v16;
  PKCurrencyAmount *pendingInformalPaymentRequestAmount;
  int v19;
  id v20;

  v5 = a3;
  v6 = objc_msgSend(v5, "type");
  Object = PKLogFacilityTypeGetObject(11);
  v8 = objc_claimAutoreleasedReturnValue(Object);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6 == (id)2)
  {
    if (v9)
    {
      v19 = 138412290;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Handle Payment Request Message: %@", (uint8_t *)&v19, 0xCu);
    }

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currency"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "amount"));
    v11 = (NSDecimalNumber *)v10;
    if (v8)
      v12 = v10 == 0;
    else
      v12 = 1;
    v13 = !v12;
    if (!v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController _amountEntryViewController](self, "_amountEntryViewController"));
      v15 = PKCurrencyAmountCreate(v11, (NSString *)&v8->isa, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      objc_msgSend(v14, "setAmount:", v16);

      objc_storeStrong((id *)&self->_pendingFormalPaymentRequestMesssage, a3);
      pendingInformalPaymentRequestAmount = self->_pendingInformalPaymentRequestAmount;
      self->_pendingInformalPaymentRequestAmount = 0;

    }
  }
  else
  {
    if (v9)
    {
      v19 = 138412290;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Asked to handle a Payment Message of incorrect type: %@", (uint8_t *)&v19, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

- (void)_handleUpdatedTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD block[5];

  v5 = a3;
  if ((id)-[PKPeerPaymentMessagesAppViewController _requiredContentState](self, "_requiredContentState") == (id)12)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesAppViewController activeConversation](self, "activeConversation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectedMessage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "peerPaymentMessage"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "transactionIdentifier"));
    if (objc_msgSend(v10, "isEqualToString:", v6))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100013040;
      block[3] = &unk_100020898;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }

  }
}

- (void)enableLiveBubbleDebugMode
{
  PKShapeView *v3;
  PKShapeView *debugBallView;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIBezierPath *v12;
  id v13;
  UIDynamicAnimator *v14;
  UIDynamicAnimator *debugAnimator;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  CMMotionManager *v25;
  CMMotionManager *debugMotionManager;
  CMMotionManager *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  PKShapeView *v31;
  PKShapeView *v32;
  PKShapeView *v33;
  CGRect v34;

  if (!self->_debugBallView)
  {
    v3 = (PKShapeView *)objc_msgSend(objc_alloc((Class)PKShapeView), "initWithFrame:", 0.0, 0.0, 10.0, 10.0);
    debugBallView = self->_debugBallView;
    self->_debugBallView = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKShapeView shapeLayer](self->_debugBallView, "shapeLayer"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor")));
    objc_msgSend(v5, "setFillColor:", objc_msgSend(v6, "CGColor"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKShapeView shapeLayer](self->_debugBallView, "shapeLayer"));
    -[PKShapeView center](self->_debugBallView, "center");
    v9 = v8;
    v11 = v10;
    -[PKShapeView bounds](self->_debugBallView, "bounds");
    v12 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v9, v11, CGRectGetWidth(v34) * 0.5, 0.0, 6.28318531);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v12));
    objc_msgSend(v7, "setPath:", objc_msgSend(v13, "CGPath"));

    -[UIView addSubview:](self->_rootView, "addSubview:", self->_debugBallView);
    v14 = (UIDynamicAnimator *)objc_msgSend(objc_alloc((Class)UIDynamicAnimator), "initWithReferenceView:", self->_rootView);
    debugAnimator = self->_debugAnimator;
    self->_debugAnimator = v14;

    v16 = objc_alloc((Class)UIGravityBehavior);
    v33 = self->_debugBallView;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
    v18 = objc_msgSend(v16, "initWithItems:", v17);

    -[UIDynamicAnimator addBehavior:](self->_debugAnimator, "addBehavior:", v18);
    v19 = objc_alloc((Class)UICollisionBehavior);
    v32 = self->_debugBallView;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
    v21 = objc_msgSend(v19, "initWithItems:", v20);

    objc_msgSend(v21, "setTranslatesReferenceBoundsIntoBoundary:", 1);
    -[UIDynamicAnimator addBehavior:](self->_debugAnimator, "addBehavior:", v21);
    v22 = objc_alloc((Class)UIDynamicItemBehavior);
    v31 = self->_debugBallView;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
    v24 = objc_msgSend(v22, "initWithItems:", v23);

    objc_msgSend(v24, "setElasticity:", 0.6);
    objc_msgSend(v24, "setFriction:", 0.2);
    -[UIDynamicAnimator addBehavior:](self->_debugAnimator, "addBehavior:", v24);
    v25 = (CMMotionManager *)objc_alloc_init((Class)CMMotionManager);
    debugMotionManager = self->_debugMotionManager;
    self->_debugMotionManager = v25;

    if (-[CMMotionManager isDeviceMotionAvailable](self->_debugMotionManager, "isDeviceMotionAvailable"))
    {
      -[CMMotionManager setDeviceMotionUpdateInterval:](self->_debugMotionManager, "setDeviceMotionUpdateInterval:", 0.1);
      v27 = self->_debugMotionManager;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100013444;
      v29[3] = &unk_1000212D0;
      v30 = v18;
      -[CMMotionManager startDeviceMotionUpdatesToQueue:withHandler:](v27, "startDeviceMotionUpdatesToQueue:withHandler:", v28, v29);

    }
  }
}

- (id)presentationSceneIdentifierForPeerPaymentController:(id)a3
{
  return self->_currentHostSceneIdentifier;
}

- (id)presentationSceneBundleIdentifierForPeerPaymentController:(id)a3
{
  return PKMobileSMSBundleIdentifier;
}

- (void)stageRecurringPayment:(id)a3 completion:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100013544;
  v7[3] = &unk_100020F08;
  v8 = a4;
  v6 = v8;
  -[PKPeerPaymentMessagesAppViewController _stageRecurringPayment:completion:](self, "_stageRecurringPayment:completion:", a3, v7);

}

- (void)recurringPaymentDetailViewControllerDidDisappearWithRecurringPayment:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRecurringPayment, a3);
}

- (PKTransactionSource)transactionSource
{
  return self->_transactionSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionSource, 0);
  objc_storeStrong((id *)&self->_currentHostSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_debugMotionManager, 0);
  objc_storeStrong((id *)&self->_debugAnimator, 0);
  objc_storeStrong((id *)&self->_debugBallView, 0);
  objc_storeStrong((id *)&self->_pendingRecurringPayment, 0);
  objc_storeStrong((id *)&self->_pendingInformalPaymentRequestAmount, 0);
  objc_storeStrong((id *)&self->_pendingFormalPaymentRequestMesssage, 0);
  objc_storeStrong((id *)&self->_activeViewController, 0);
  objc_storeStrong((id *)&self->_rootView, 0);
  objc_storeStrong((id *)&self->_viewControllerForState, 0);
  objc_storeStrong((id *)&self->_peerPaymentController, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
}

@end
