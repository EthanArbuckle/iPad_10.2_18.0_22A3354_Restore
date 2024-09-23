@implementation TSSIMUnlockDetailViewController

- (TSSIMUnlockDetailViewController)initWithSubscriptionContext:(id)a3 subscriptionAction:(id)a4 lockedSIMName:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  TSSIMUnlockDetailViewController *v16;
  NSString *v17;
  NSString *lockedSIMName;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (sub_10000CED8())
  {
    v14 = sub_10000CE68();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      sub_10000EFE4();

  }
  v16 = -[TSSIMUnlockDetailViewController initWithSubscriptionContext:subscriptionAction:suppressCancellation:delegate:](self, "initWithSubscriptionContext:subscriptionAction:suppressCancellation:delegate:", v10, v11, 0, v13);
  if (v16)
  {
    v17 = (NSString *)objc_msgSend(v12, "copy");
    lockedSIMName = v16->_lockedSIMName;
    v16->_lockedSIMName = v17;

  }
  return v16;
}

- (TSSIMUnlockDetailViewController)initWithSubscriptionContext:(id)a3 subscriptionAction:(id)a4 suppressCancellation:(BOOL)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  TSSIMUnlockDetailViewController *v16;
  TSSIMUnlockDetailViewController *v17;
  CoreTelephonyClient *v18;
  CoreTelephonyClient *telephonyClient;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (sub_10000CED8())
  {
    v14 = sub_10000CE68();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      sub_10000F080();

  }
  v16 = -[TSSIMUnlockDetailViewController init](self, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_subscriptionContext, a3);
    objc_storeStrong((id *)&v17->_subscriptionAction, a4);
    objc_storeWeak((id *)&v17->_delegate, v13);
    v17->_suppressCancellation = a5;
    v18 = (CoreTelephonyClient *)objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", &_dispatch_main_q);
    telephonyClient = v17->_telephonyClient;
    v17->_telephonyClient = v18;

    -[CoreTelephonyClient setDelegate:](v17->_telephonyClient, "setDelegate:", v17);
  }

  return v17;
}

- (void)loadView
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  TSSIMUnlockDetailView *v7;
  id v8;
  void *v9;

  if (sub_10000CED8())
  {
    v3 = sub_10000CE68();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_10000F11C(v4, v5, v6);

  }
  v7 = -[TSSIMUnlockDetailView initWithActionType:actionSubtype:lockedSIMName:]([TSSIMUnlockDetailView alloc], "initWithActionType:actionSubtype:lockedSIMName:", -[TSSubscriptionAction actionType](self->_subscriptionAction, "actionType"), -[TSSubscriptionAction actionSubtype](self->_subscriptionAction, "actionSubtype"), self->_lockedSIMName);
  -[TSSIMUnlockDetailView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
  -[TSSIMUnlockDetailViewController setView:](self, "setView:", v7);
  v8 = objc_msgSend(objc_alloc((Class)UISwipeGestureRecognizer), "initWithTarget:action:", self, "_cancelButtonPressed:");
  objc_msgSend(v8, "setDirection:", 8);
  objc_msgSend(v8, "setDelegate:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController view](self, "view"));
  objc_msgSend(v9, "addGestureRecognizer:", v8);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  TSSIMUnlockDetailViewController *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSSIMUnlockDetailViewController;
  -[TSSIMUnlockDetailViewController viewDidLoad](&v12, "viewDidLoad");
  -[TSSIMUnlockDetailViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController _entryView](self, "_entryView"));
  objc_msgSend(v3, "setDelegate:", self);

  if (!self->_suppressCancellation)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController navigationController](self, "navigationController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllers"));
    v6 = (TSSIMUnlockDetailViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

    if (v6 == self)
    {
      v7 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_cancelButtonPressed:");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v8, "setLeftBarButtonItem:", v7);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController navigationController](self, "navigationController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
      objc_msgSend(v11, "setBackgroundColor:", v9);

    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4;
  NSObject *v5;
  int64_t v6;
  CoreTelephonyClient *v7;
  CTXPCServiceSubscriptionContext *v8;
  CoreTelephonyClient *telephonyClient;
  CTXPCServiceSubscriptionContext *subscriptionContext;
  _QWORD v11[5];
  _QWORD v12[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TSSIMUnlockDetailViewController;
  -[TSSIMUnlockDetailViewController viewWillAppear:](&v13, "viewWillAppear:", a3);
  -[TSSIMUnlockDetailViewController becomeFirstResponder](self, "becomeFirstResponder");
  if (sub_10000CED8())
  {
    v4 = sub_10000CE68();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_10000F1A0((uint64_t)self);

  }
  v6 = -[TSSubscriptionAction actionType](self->_subscriptionAction, "actionType");
  if (v6 == 3)
  {
    if ((id)-[TSSubscriptionAction actionSubtype](self->_subscriptionAction, "actionSubtype") == (id)1)
    {
      telephonyClient = self->_telephonyClient;
      subscriptionContext = self->_subscriptionContext;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100001C28;
      v11[3] = &unk_10001C678;
      v11[4] = self;
      -[CoreTelephonyClient getRemainingPUKAttemptCount:completion:](telephonyClient, "getRemainingPUKAttemptCount:completion:", subscriptionContext, v11);
    }
  }
  else if (v6 == 2)
  {
    v7 = self->_telephonyClient;
    v8 = self->_subscriptionContext;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100001BCC;
    v12[3] = &unk_10001C678;
    v12[4] = self;
    -[CoreTelephonyClient getRemainingPINAttemptCount:completion:](v7, "getRemainingPINAttemptCount:completion:", v8, v12);
  }
}

- (BOOL)becomeFirstResponder
{
  _BOOL4 v3;
  void *v4;
  unsigned __int8 v5;

  v3 = -[TSSIMUnlockDetailViewController _appearingOrAppeared](self, "_appearingOrAppeared");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController _entryView](self, "_entryView"));
    v5 = objc_msgSend(v4, "becomeFirstResponder");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  _BOOL4 v3;
  void *v4;
  unsigned __int8 v5;

  v3 = -[TSSIMUnlockDetailViewController _appearingOrAppeared](self, "_appearingOrAppeared");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController _entryView](self, "_entryView"));
    v5 = objc_msgSend(v4, "canBecomeFirstResponder");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)resignFirstResponder
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController _entryView](self, "_entryView"));
  v3 = objc_msgSend(v2, "resignFirstResponder");

  return v3;
}

- (BOOL)canResignFirstResponder
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController _entryView](self, "_entryView"));
  v3 = objc_msgSend(v2, "canResignFirstResponder");

  return v3;
}

- (BOOL)isFirstResponder
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController _entryView](self, "_entryView"));
  v3 = objc_msgSend(v2, "isFirstResponder");

  return v3;
}

- (void)entryView:(id)a3 didEnterText:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int64_t v8;
  void *v9;
  CoreTelephonyClient *v10;
  TSSubscriptionAction *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  TSSubscriptionAction *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  CoreTelephonyClient *telephonyClient;
  CTXPCServiceSubscriptionContext *subscriptionContext;
  id WeakRetained;
  void *v23;
  void *v24;
  TSSIMUnlockDetailViewController *v25;
  void *v26;

  v5 = a4;
  if (sub_10000CED8())
  {
    v6 = sub_10000CE68();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_10000F2D8((uint64_t)self);

  }
  v8 = -[TSSubscriptionAction actionType](self->_subscriptionAction, "actionType");
  if (v8 == 3)
  {
    v11 = self->_subscriptionAction;
    if (sub_10000CED8())
    {
      v12 = sub_10000CE68();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        sub_10000F234(v11, v13);

    }
    v14 = -[TSSubscriptionAction actionSubtype](v11, "actionSubtype");
    if (v14 == (id)3)
    {
      v16 = self->_subscriptionAction;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TSSubscriptionAction pin1](v16, "pin1"));
      v18 = objc_msgSend(v17, "isEqualToString:", v5);

      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController _detailView](self, "_detailView"));
        objc_msgSend(v19, "setUnlocking:", 1);

        telephonyClient = self->_telephonyClient;
        subscriptionContext = self->_subscriptionContext;
        WeakRetained = (id)objc_claimAutoreleasedReturnValue(-[TSSubscriptionAction puk](v16, "puk"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[TSSubscriptionAction pin1](v16, "pin1"));
        -[CoreTelephonyClient unlockPUK:puk:newPin:error:](telephonyClient, "unlockPUK:puk:newPin:error:", subscriptionContext, WeakRetained, v23, 0);

      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "unlockDetailViewController:didCompleteWithResult:", self, 4);
      }

      goto LABEL_23;
    }
    if (v14 == (id)2)
    {
      v15 = -[TSSubscriptionAction copyByApplyingPIN1:](v11, "copyByApplyingPIN1:", v5);
    }
    else
    {
      if (v14 != (id)1)
        goto LABEL_23;
      v15 = -[TSSubscriptionAction copyByApplyingPUK:](v11, "copyByApplyingPUK:", v5);
    }
    v24 = v15;
    v25 = -[TSSIMUnlockDetailViewController initWithSubscriptionContext:subscriptionAction:lockedSIMName:delegate:]([TSSIMUnlockDetailViewController alloc], "initWithSubscriptionContext:subscriptionAction:lockedSIMName:delegate:", self->_subscriptionContext, v15, self->_lockedSIMName, self);

    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController navigationController](self, "navigationController"));
      objc_msgSend(v26, "pushViewController:animated:", v25, 1);

      v11 = (TSSubscriptionAction *)v25;
      goto LABEL_23;
    }
  }
  else if (v8 == 2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController _detailView](self, "_detailView"));
    objc_msgSend(v9, "setUnlocking:", 1);

    v10 = self->_telephonyClient;
    v11 = (TSSubscriptionAction *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController subscriptionContext](self, "subscriptionContext"));
    -[CoreTelephonyClient unlockPIN:pin:error:](v10, "unlockPIN:pin:error:", v11, v5, 0);
LABEL_23:

  }
}

- (void)unlockDetailViewController:(id)a3 didCompleteWithResult:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  TSSIMUnlockDetailViewController *v10;
  int64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  const char *v19;
  __int16 v20;
  int64_t v21;
  __int16 v22;
  const char *v23;

  v6 = sub_10000CE68();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315650;
    v19 = "-[TSSIMUnlockDetailViewController unlockDetailViewController:didCompleteWithResult:]";
    v20 = 2048;
    v21 = a4;
    v22 = 2080;
    v23 = "-[TSSIMUnlockDetailViewController unlockDetailViewController:didCompleteWithResult:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, result %ld @%s", (uint8_t *)&v18, 0x20u);
  }

  switch(a4)
  {
    case 0:
    case 3:
    case 6:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController delegate](self, "delegate"));
      v9 = v8;
      v10 = self;
      v11 = a4;
      goto LABEL_5;
    case 1:
    case 2:
      goto LABEL_9;
    case 4:
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController navigationController](self, "navigationController"));
      v13 = objc_msgSend(v12, "popToViewController:animated:", self, 1);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController _entryView](self, "_entryView"));
      objc_msgSend(v14, "setPinMismatch:", 1);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController _entryView](self, "_entryView"));
      objc_msgSend(v9, "resetEnteredTextWithShakeAnimation:", 0);
      goto LABEL_10;
    case 5:
      if ((id)-[TSSubscriptionAction actionSubtype](self->_subscriptionAction, "actionSubtype") == (id)1)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController _entryView](self, "_entryView"));
        objc_msgSend(v15, "setPinMismatch:", 0);

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController _entryView](self, "_entryView"));
        objc_msgSend(v16, "resetEnteredTextWithShakeAnimation:", 1);

LABEL_9:
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController navigationController](self, "navigationController"));
        v17 = objc_msgSend(v9, "popToViewController:animated:", self, 1);
      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController delegate](self, "delegate"));
        v9 = v8;
        v10 = self;
        v11 = 5;
LABEL_5:
        objc_msgSend(v8, "unlockDetailViewController:didCompleteWithResult:", v10, v11);
      }
LABEL_10:

      return;
    default:
      return;
  }
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  TSSIMUnlockDetailViewController *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const char *v31;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = sub_10000CE68();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CTSubscriptionSlotAsString(objc_msgSend(v6, "slotID"));
      v11 = sub_100006F6C(-[TSSubscriptionAction actionType](self->_subscriptionAction, "actionType"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v22 = 136316162;
      v23 = "-[TSSIMUnlockDetailViewController simStatusDidChange:status:]";
      v24 = 2080;
      v25 = v10;
      v26 = 2112;
      v27 = v7;
      v28 = 2112;
      v29 = v12;
      v30 = 2080;
      v31 = "-[TSSIMUnlockDetailViewController simStatusDidChange:status:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: context %s, status %@, current action %@ @%s", (uint8_t *)&v22, 0x34u);

    }
    if ((id)-[TSSubscriptionAction actionType](self->_subscriptionAction, "actionType") == (id)2
      || (id)-[TSSubscriptionAction actionType](self->_subscriptionAction, "actionType") == (id)3)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CTXPCServiceSubscriptionContext uuid](self->_subscriptionContext, "uuid"));
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if (v15)
      {
        if (objc_msgSend(v7, "isEqualToString:", kCTSIMSupportSIMStatusPUKLocked))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController delegate](self, "delegate"));
          v17 = v16;
          v18 = self;
          v19 = 3;
LABEL_17:
          objc_msgSend(v16, "unlockDetailViewController:didCompleteWithResult:", v18, v19);

          goto LABEL_18;
        }
        if (objc_msgSend(v7, "isEqualToString:", kCTSIMSupportSIMStatusPermanentlyLocked))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController delegate](self, "delegate"));
          v17 = v16;
          v18 = self;
          v19 = 6;
          goto LABEL_17;
        }
        if (objc_msgSend(v7, "isEqualToString:", kCTSIMSupportSIMStatusReady))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController delegate](self, "delegate"));
          v17 = v16;
          v18 = self;
          v19 = 0;
          goto LABEL_17;
        }
        if ((sub_1000015A4(v7) & 1) == 0)
        {
          v20 = sub_10000CE68();
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = 136315138;
            v23 = "-[TSSIMUnlockDetailViewController simStatusDidChange:status:]";
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "sim not locked anymore, action complete @%s", (uint8_t *)&v22, 0xCu);
          }

          v16 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController delegate](self, "delegate"));
          v17 = v16;
          v18 = self;
          v19 = 1;
          goto LABEL_17;
        }
      }
    }
  }
LABEL_18:

}

- (void)simPinEntryErrorDidOccur:(id)a3 status:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  dispatch_time_t v15;
  _QWORD v16[4];
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  if (sub_10000CED8())
  {
    v8 = sub_10000CE68();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_10000F36C();

  }
  if ((id)-[TSSubscriptionAction actionType](self->_subscriptionAction, "actionType") == (id)2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CTXPCServiceSubscriptionContext uuid](self->_subscriptionContext, "uuid"));
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (v12)
    {
      if (objc_msgSend(v7, "isEqualToString:", kCTSIMSupportSIMStatusPUKLocked))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController _entryView](self, "_entryView"));
        objc_msgSend(v13, "resignFirstResponder");

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController delegate](self, "delegate"));
        objc_msgSend(v14, "unlockDetailViewController:didCompleteWithResult:", self, 3);

      }
      else if (objc_msgSend(v7, "isEqualToString:", kCTSIMSupportSIMStatusPINLocked))
      {
        objc_initWeak(&location, self);
        v15 = dispatch_time(0, 500000000);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1000026D4;
        v16[3] = &unk_10001C6A0;
        objc_copyWeak(&v17, &location);
        dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, v16);
        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }
    }
  }

}

- (void)simPukEntryErrorDidOccur:(id)a3 status:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  dispatch_time_t v13;
  _QWORD v14[4];
  id v15;
  TSSIMUnlockDetailViewController *v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  if (sub_10000CED8())
  {
    v8 = sub_10000CE68();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_10000F3EC();

  }
  if ((id)-[TSSubscriptionAction actionSubtype](self->_subscriptionAction, "actionSubtype") == (id)3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CTXPCServiceSubscriptionContext uuid](self->_subscriptionContext, "uuid"));
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (v12)
    {
      objc_initWeak(&location, self);
      v13 = dispatch_time(0, 500000000);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000029F4;
      v14[3] = &unk_10001C6C8;
      objc_copyWeak(&v17, &location);
      v15 = v7;
      v16 = self;
      dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, v14);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_cancelButtonPressed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "unlockDetailViewController:didCompleteWithResult:", self, 2);

}

- (id)_entryView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailViewController _detailView](self, "_detailView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "entryView"));

  return v3;
}

- (BOOL)_appearingOrAppeared
{
  unsigned int v3;

  v3 = -[TSSIMUnlockDetailViewController _appearState](self, "_appearState");
  if (v3 != 1)
    LOBYTE(v3) = -[TSSIMUnlockDetailViewController _appearState](self, "_appearState") == 2;
  return v3;
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (TSSubscriptionAction)subscriptionAction
{
  return self->_subscriptionAction;
}

- (NSString)lockedSIMName
{
  return self->_lockedSIMName;
}

- (TSSIMUnlockDetailViewControllerDelegate)delegate
{
  return (TSSIMUnlockDetailViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lockedSIMName, 0);
  objc_storeStrong((id *)&self->_subscriptionAction, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
}

@end
