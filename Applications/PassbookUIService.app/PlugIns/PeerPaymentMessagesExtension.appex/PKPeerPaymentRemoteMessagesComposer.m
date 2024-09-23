@implementation PKPeerPaymentRemoteMessagesComposer

- (PKPeerPaymentRemoteMessagesComposer)initWithPeerPaymentController:(id)a3 presentingViewController:(id)a4 actionType:(int64_t)a5 sourceType:(unint64_t)a6
{
  id v11;
  id v12;
  PKPeerPaymentRemoteMessagesComposer *v13;
  PKPeerPaymentRemoteMessagesComposer *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentRemoteMessagesComposer;
  v13 = -[PKPeerPaymentRemoteMessagesComposer init](&v16, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_peerPaymentController, a3);
    objc_storeWeak((id *)&v14->_presentingViewController, v12);
    v14->_actionType = a5;
    v14->_sourceType = a6;
  }

  return v14;
}

- (void)validateRecipientWithAddress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000678C;
  v10[3] = &unk_100020AC8;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v11 = v8;
  v9 = v7;
  v12 = v9;
  -[PKPeerPaymentRemoteMessagesComposer _showAlertForInvalidStateIfNeededWithCompletion:](self, "_showAlertForInvalidStateIfNeededWithCompletion:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)presentRemoteMessageComposerWithAmount:(id)a3 requestToken:(id)a4 memo:(id)a5 sessionID:(id)a6 overViewController:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  MSSession *v22;
  MSSession *session;
  int64_t actionType;
  unint64_t v25;
  uint64_t v26;
  PKPeerPaymentController *v27;
  unint64_t sourceType;
  uint64_t Object;
  NSObject *v30;
  PKPeerPaymentController *peerPaymentController;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id location;
  uint8_t buf[4];
  int64_t v41;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  objc_storeStrong((id *)&self->_memo, a5);
  objc_storeStrong((id *)&self->_requestToken, a4);
  objc_storeWeak((id *)&self->_presentingViewController, v18);
  if (v17)
  {
    v20 = objc_alloc((Class)MSSession);
    v21 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v17);
    v22 = (MSSession *)objc_msgSend(v20, "initWithIdentifier:", v21);
    session = self->_session;
    self->_session = v22;

  }
  objc_initWeak(&location, self);
  actionType = self->_actionType;
  if (actionType)
  {
    if (actionType == 1)
    {
      -[PKPeerPaymentController selectMode:](self->_peerPaymentController, "selectMode:", 1);
      v25 = self->_sourceType - 1;
      if (v25 > 2)
        v26 = 0;
      else
        v26 = qword_100017F68[v25];
      peerPaymentController = self->_peerPaymentController;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_100006EDC;
      v36[3] = &unk_100020B18;
      objc_copyWeak(&v38, &location);
      v37 = v19;
      -[PKPeerPaymentController quoteWithAmount:source:requestToken:alternateFundingSource:preserveCurrentBalance:recurringPaymentIdentifier:frequency:startDate:threshold:completion:](peerPaymentController, "quoteWithAmount:source:requestToken:alternateFundingSource:preserveCurrentBalance:recurringPaymentIdentifier:frequency:startDate:threshold:completion:", v14, v26, v15, 0, 0, 0, 0, 0, 0, v36);

      objc_destroyWeak(&v38);
    }
    else
    {
      Object = PKLogFacilityTypeGetObject(11);
      v30 = objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v41 = actionType;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Peer Payment Wallet: Unable to present remote message composer for action type: %ld", buf, 0xCu);
      }

    }
  }
  else
  {
    -[PKPeerPaymentController selectMode:](self->_peerPaymentController, "selectMode:", 3);
    v27 = self->_peerPaymentController;
    if (self->_sourceType - 1 >= 3)
      sourceType = 0;
    else
      sourceType = self->_sourceType;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100007110;
    v32[3] = &unk_100020B68;
    objc_copyWeak(&v35, &location);
    v33 = v14;
    v34 = v19;
    -[PKPeerPaymentController formalRequestTokenForAmount:source:completion:](v27, "formalRequestTokenForAmount:source:completion:", v33, sourceType, v32);

    objc_destroyWeak(&v35);
  }
  objc_destroyWeak(&location);

}

- (void)presentRemoteMessageComposerWithRecurringPayment:(id)a3 overViewController:(id)a4 completion:(id)a5
{
  id v9;
  int64_t actionType;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t Object;
  PKPeerPaymentController *peerPaymentController;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id location;
  uint8_t buf[4];
  int64_t v35;

  v9 = a3;
  v27 = a4;
  v28 = a5;
  objc_storeWeak((id *)&self->_presentingViewController, v27);
  objc_initWeak(&location, self);
  actionType = self->_actionType;
  if (actionType == 2)
  {
    objc_storeStrong((id *)&self->_recurringPayment, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "amount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currency"));
    v13 = PKCurrencyAmountMake(v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fundingSource"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fpanIdentifier"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "passWithFPANIdentifier:", v17));

    if (objc_msgSend(v9, "usesAppleCashBalance"))
      v18 = 2;
    else
      v18 = 1;
    -[PKPeerPaymentController selectMode:](self->_peerPaymentController, "selectMode:", 1);
    v19 = self->_sourceType - 1;
    if (v19 > 2)
      v25 = 0;
    else
      v25 = qword_100017F68[v19];
    peerPaymentController = self->_peerPaymentController;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    v23 = objc_msgSend(v9, "frequency");
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100007680;
    v29[3] = &unk_100020BB8;
    objc_copyWeak(&v32, &location);
    v29[4] = self;
    v30 = v9;
    v31 = v28;
    -[PKPeerPaymentController quoteWithAmount:source:requestToken:alternateFundingSource:preserveCurrentBalance:recurringPaymentIdentifier:frequency:startDate:threshold:completion:](peerPaymentController, "quoteWithAmount:source:requestToken:alternateFundingSource:preserveCurrentBalance:recurringPaymentIdentifier:frequency:startDate:threshold:completion:", v14, v25, 0, v26, v18, v22, v23, v24, 0, v29);

    objc_destroyWeak(&v32);
  }
  else
  {
    Object = PKLogFacilityTypeGetObject(11);
    v14 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v35 = actionType;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Peer Payment Wallet: Unable to present remote message composer for non-recurring payment action type: %ld", buf, 0xCu);
    }
  }

  objc_destroyWeak(&location);
}

- (void)_showAlertForInvalidStateIfNeededWithCompletion:(id)a3
{
  id v3;
  id v4;
  const CFStringRef *v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  if (!PKNetworkConnectivityAvailable())
  {
    v6 = CFSTR("PEER_PAYMENT_INTERNET_CONNECTION_ERROR_MESSAGE");
    v7 = CFSTR("PEER_PAYMENT_INTERNET_CONNECTION_ERROR_TITLE");
LABEL_7:
    v8 = PKLocalizedPeerPaymentString(&v7->isa);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, kCFUserNotificationAlertHeaderKey);

    v5 = &kCFUserNotificationAlertMessageKey;
    goto LABEL_8;
  }
  if (!+[MFMessageComposeViewController isiMessageEnabled](MFMessageComposeViewController, "isiMessageEnabled"))
  {
    v6 = CFSTR("PEER_PAYMENT_IMESSAGE_DISABLED_ERROR_MESSAGE");
    v7 = CFSTR("PEER_PAYMENT_IMESSAGE_DISABLED_ERROR_TITLE");
    goto LABEL_7;
  }
  if (+[MFMessageComposeViewController canSendText](MFMessageComposeViewController, "canSendText"))
    goto LABEL_9;
  v5 = &kCFUserNotificationAlertHeaderKey;
  v6 = CFSTR("PEER_PAYMENT_MESSAGES_UNAVAILABLE_ERROR_TITLE");
LABEL_8:
  v10 = PKLocalizedPeerPaymentString(&v6->isa);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *v5);

  v12 = PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, kCFUserNotificationDefaultButtonTitleKey);

LABEL_9:
  if (objc_msgSend(v4, "count"))
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100007B08;
    v14[3] = &unk_100020BE0;
    v15 = v3;
    +[PKUserNotificationAgent presentNotificationWithParameters:responseHandler:](PKUserNotificationAgent, "presentNotificationWithParameters:responseHandler:", v4, v14);

  }
  else
  {
    (*((void (**)(id, uint64_t))v3 + 2))(v3, 1);
  }

}

- (void)_showAlertForInvalidRecipientWithName:(id)a3 statusReason:(unint64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v7 = a3;
  v8 = a5;
  v9 = objc_alloc_init((Class)NSMutableDictionary);
  if (a4 < 2)
  {
    v10 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_INVALID_RECIPIENT_ERROR_TITLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, kCFUserNotificationAlertHeaderKey);

    v12 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_INVALID_RECIPIENT_ERROR_FORMAT"), CFSTR("%@"), v7);
    v13 = objc_claimAutoreleasedReturnValue(v12);
LABEL_5:
    v17 = (void *)v13;
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, kCFUserNotificationAlertMessageKey);

    v18 = PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, kCFUserNotificationDefaultButtonTitleKey);

    goto LABEL_6;
  }
  if (a4 == 2)
  {
    v14 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_INVALID_RECIPIENT_ERROR_TITLE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, kCFUserNotificationAlertHeaderKey);

    v16 = PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_MESSAGES_RECIPIENT_FAMILY_RESTRICTED_MESSAGE"));
    v13 = objc_claimAutoreleasedReturnValue(v16);
    goto LABEL_5;
  }
LABEL_6:
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100007CC0;
  v21[3] = &unk_100020BE0;
  v22 = v8;
  v20 = v8;
  +[PKUserNotificationAgent presentNotificationWithParameters:responseHandler:](PKUserNotificationAgent, "presentNotificationWithParameters:responseHandler:", v9, v21);

}

- (BOOL)_recipientFoundInContacts
{
  PKPeerPaymentController *peerPaymentController;
  void *v3;
  id v4;
  BOOL v6;

  v6 = 0;
  peerPaymentController = self->_peerPaymentController;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentRecipient phoneOrEmail](self->_recipient, "phoneOrEmail"));
  v4 = -[PKPeerPaymentController displayNameForRecipientAddress:foundInContacts:](peerPaymentController, "displayNameForRecipientAddress:foundInContacts:", v3, &v6);

  return v6;
}

- (void)_confirmPaymentMessageInsertionWithQuote:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t Object;
  NSObject *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30[2];
  uint8_t buf[4];
  id v32;

  v6 = a3;
  v7 = a4;
  Object = PKLogFacilityTypeGetObject(11);
  v9 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Peer Payment Wallet: Confirm payment message insertion with peer payment quote: %@", buf, 0xCu);
  }

  if (-[PKPeerPaymentRemoteMessagesComposer _recipientFoundInContacts](self, "_recipientFoundInContacts")
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController account](self->_peerPaymentController, "account")),
        v11 = objc_msgSend(v10, "sendRestrictionType") == (id)2,
        v10,
        !v11))
  {
    if ((id)+[CNContactStore authorizationStatusForEntityType:](CNContactStore, "authorizationStatusForEntityType:", 0) != (id)3|| -[PKPeerPaymentRemoteMessagesComposer _recipientFoundInContacts](self, "_recipientFoundInContacts"))
    {
      goto LABEL_11;
    }
    v12 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationDontDismissOnUnlock);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationAllowMenuButtonDismissal);
    v20 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONFIRM_UNKNOWN_RECIPIENT_TITLE"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, kCFUserNotificationAlertHeaderKey);

    v22 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONFIRM_UNKNOWN_RECIPIENT_MESSAGE"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, kCFUserNotificationAlertMessageKey);

    v24 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONFIRM_UNKNOWN_RECIPIENT_ACTION_CONTINUE"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v25, kCFUserNotificationDefaultButtonTitleKey);

    v26 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONFIRM_UNKNOWN_RECIPIENT_ACTION_CANCEL"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v26);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, kCFUserNotificationOtherButtonTitleKey);
    v19 = 0;
  }
  else
  {
    v12 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationDontDismissOnUnlock);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, PKUserNotificationAllowMenuButtonDismissal);
    v13 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_INVALID_RECIPIENT_ERROR_TITLE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, kCFUserNotificationAlertHeaderKey);

    v15 = PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_MESSAGES_RECIPIENT_CONTACTS_RESTRICTED_MESSAGE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, kCFUserNotificationAlertMessageKey);

    v17 = PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, kCFUserNotificationDefaultButtonTitleKey);
    v19 = 3;
  }

  if (!v12)
  {
LABEL_11:
    -[PKPeerPaymentRemoteMessagesComposer _insertPaymentMessageWithQuote:completion:](self, "_insertPaymentMessageWithQuote:completion:", v6, v7);
    goto LABEL_12;
  }
  objc_initWeak((id *)buf, self);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000810C;
  v27[3] = &unk_100020C08;
  objc_copyWeak(v30, (id *)buf);
  v30[1] = (id)v19;
  v28 = v6;
  v29 = v7;
  +[PKUserNotificationAgent presentNotificationWithParameters:responseHandler:](PKUserNotificationAgent, "presentNotificationWithParameters:responseHandler:", v12, v27);

  objc_destroyWeak(v30);
  objc_destroyWeak((id *)buf);

LABEL_12:
}

- (void)_insertPaymentMessageWithQuote:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t Object;
  NSObject *v9;
  NSDecimalNumber *v10;
  NSString *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;

  v6 = a3;
  v7 = a4;
  Object = PKLogFacilityTypeGetObject(11);
  v9 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Peer Payment Wallet: Insert payment message with peer payment quote: %@", (uint8_t *)&v21, 0xCu);
  }

  v10 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "totalReceiveAmount"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "totalReceiveAmountCurrency"));
  v12 = PKCurrencyAmountCreate(v10, v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = objc_msgSend(v6, "isRecurringPayment");
  if (v14)
    v15 = 3;
  else
    v15 = 1;
  v16 = objc_msgSend(objc_alloc((Class)PKPeerPaymentMessage), "initWithType:session:", v15, self->_session);
  objc_msgSend(v16, "setCurrencyAmount:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController senderPhoneOrEmail](self->_peerPaymentController, "senderPhoneOrEmail"));
  objc_msgSend(v16, "setSenderAddress:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentRecipient phoneOrEmail](self->_recipient, "phoneOrEmail"));
  objc_msgSend(v16, "setRecipientAddress:", v18);

  objc_msgSend(v16, "setSource:", 1);
  if (self->_memo)
    objc_msgSend(v16, "setMemo:");
  if (self->_requestToken)
    objc_msgSend(v16, "setRequestToken:");
  if (v14)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
    objc_msgSend(v16, "setRecurringPaymentStartDate:", v19);

    objc_msgSend(v16, "setRecurringPaymentFrequency:", objc_msgSend(v6, "frequency"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentRecurringPayment memo](self->_recurringPayment, "memo"));
    objc_msgSend(v16, "setRecurringPaymentMemo:", v20);

  }
  -[PKPeerPaymentRemoteMessagesComposer _presentPeerPaymentMessage:completion:](self, "_presentPeerPaymentMessage:completion:", v16, v7);

}

- (void)_insertRequestMessageWithAmount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t Object;
  NSObject *v9;
  PKPeerPaymentRequestToken *requestToken;
  id v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  PKPeerPaymentRequestToken *v17;

  v6 = a3;
  v7 = a4;
  Object = PKLogFacilityTypeGetObject(11);
  v9 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    requestToken = self->_requestToken;
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = requestToken;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Peer Payment Wallet: Insert request with amount: %@ requestToken: %@", (uint8_t *)&v14, 0x16u);
  }

  v11 = objc_msgSend(objc_alloc((Class)PKPeerPaymentMessage), "initWithType:session:", 2, self->_session);
  objc_msgSend(v11, "setCurrencyAmount:", v6);
  objc_msgSend(v11, "setRequestToken:", self->_requestToken);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController senderPhoneOrEmail](self->_peerPaymentController, "senderPhoneOrEmail"));
  objc_msgSend(v11, "setSenderAddress:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentRecipient phoneOrEmail](self->_recipient, "phoneOrEmail"));
  objc_msgSend(v11, "setRecipientAddress:", v13);

  objc_msgSend(v11, "setSource:", 1);
  if (self->_memo)
    objc_msgSend(v11, "setMemo:");
  -[PKPeerPaymentRemoteMessagesComposer _presentPeerPaymentMessage:completion:](self, "_presentPeerPaymentMessage:completion:", v11, v7);

}

- (void)_presentPeerPaymentMessage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PKMessagesAppSharedContext sharedContext](PKMessagesAppSharedContext, "sharedContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentController externalizedControllerState](self->_peerPaymentController, "externalizedControllerState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  objc_msgSend(v8, "persistExternalizedControllerState:forMessageIdentifier:", v9, v10);

  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000086A8;
  v13[3] = &unk_100020C58;
  objc_copyWeak(&v16, &location);
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_handleError:(id)a3
{
  void *v3;
  id v4;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PKPeerPaymentController displayableErrorForError:](PKPeerPaymentController, "displayableErrorForError:", a3));
  v4 = objc_alloc_init((Class)NSMutableDictionary);
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
  v18[2] = sub_100008B60;
  v18[3] = &unk_100020C80;
  v19 = v14;
  v17 = v14;
  +[PKUserNotificationAgent presentNotificationWithParameters:responseHandler:](PKUserNotificationAgent, "presentNotificationWithParameters:responseHandler:", v4, v18);

}

- (PKPeerPaymentController)peerPaymentController
{
  return self->_peerPaymentController;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentController, 0);
  objc_storeStrong((id *)&self->_recurringPayment, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_memo, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_composeController, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
}

@end
