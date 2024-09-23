@implementation PKPeerPaymentRegistrationFlowController

- (PKPeerPaymentRegistrationFlowController)initWithAccount:(id)a3 currencyAmount:(id)a4 state:(unint64_t)a5 senderAddress:(id)a6 setupDelegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKPeerPaymentRegistrationFlowController *v17;
  PKPeerPaymentRegistrationFlowController *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)PKPeerPaymentRegistrationFlowController;
  v17 = -[PKPeerPaymentRegistrationFlowController init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_account, a3);
    objc_storeStrong((id *)&v18->_currencyAmount, a4);
    v18->_state = a5;
    objc_storeStrong((id *)&v18->_senderAddress, a6);
    objc_storeWeak((id *)&v18->_setupDelegate, v16);
  }

  return v18;
}

- (PKPeerPaymentRegistrationFlowController)initWithUserInfo:(id)a3 setupDelegate:(id)a4
{
  id v6;
  id v7;
  PKPeerPaymentRegistrationFlowController *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t Object;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  PKPeerPaymentAccount *account;
  NSDecimalNumber *v19;
  NSString *v20;
  uint64_t v21;
  uint64_t v22;
  PKCurrencyAmount *currencyAmount;
  uint64_t v24;
  NSString *senderAddress;
  void *v26;
  objc_super v28;
  id v29;
  uint8_t buf[4];
  void *v31;

  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PKPeerPaymentRegistrationFlowController;
  v8 = -[PKPeerPaymentRegistrationFlowController init](&v28, "init");
  if (!v8)
    goto LABEL_14;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("account")));
  v10 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v9, 0);
  if (v10)
  {
    v11 = objc_opt_class(PKPeerPaymentAccount);
    v29 = 0;
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "decodeTopLevelObjectOfClass:forKey:error:", v11, NSKeyedArchiveRootObjectKey, &v29));
    v13 = v29;
    objc_msgSend(v10, "finishDecoding");
    if (v12)
      goto LABEL_10;
    Object = PKLogFacilityTypeGetObject(11);
    v15 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject description](v13, "description"));
      *(_DWORD *)buf = 138412290;
      v31 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Could not unarchive peer payment account data with error:%@", buf, 0xCu);

    }
  }
  else
  {
    v17 = PKLogFacilityTypeGetObject(11);
    v13 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Could not initialize unarchiver with peer payment account data.", buf, 2u);
    }
  }
  v12 = 0;
LABEL_10:

  account = v8->_account;
  v8->_account = (PKPeerPaymentAccount *)v12;

  v19 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("amount")));
  v20 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("currency")));
  if (-[NSString length](v20, "length") && v19)
  {
    v21 = PKCurrencyAmountCreate(v19, v20, 0);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    currencyAmount = v8->_currencyAmount;
    v8->_currencyAmount = (PKCurrencyAmount *)v22;

  }
  v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("senderAddress")));
  senderAddress = v8->_senderAddress;
  v8->_senderAddress = (NSString *)v24;

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("state")));
  v8->_state = (unint64_t)objc_msgSend(v26, "unsignedIntegerValue");

  objc_storeWeak((id *)&v8->_setupDelegate, v7);
LABEL_14:

  return v8;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t Object;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  PKPeerPaymentRegistrationFlowController *v15;
  id v16;
  uint8_t buf[16];
  id v18;

  v4 = a3;
  if (v4)
  {
    if (self->_account)
    {
      v5 = objc_alloc((Class)PKPaymentProvisioningController);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[PKPaymentWebService sharedService](PKPaymentWebService, "sharedService"));
      v7 = objc_msgSend(v5, "initWithWebService:", v6);

      v8 = objc_msgSend(objc_alloc((Class)PKPeerPaymentCredential), "initWithPeerPaymentAccount:", self->_account);
      objc_msgSend(v8, "setAmount:", self->_currencyAmount);
      objc_msgSend(v8, "setFlowState:", self->_state);
      objc_msgSend(v8, "setPendingPaymentSenderAddress:", self->_senderAddress);
      if (v8)
      {
        v18 = v8;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_100004CE0;
        v13[3] = &unk_100008368;
        v14 = v7;
        v15 = self;
        v16 = v4;
        objc_msgSend(v14, "associateCredentials:withCompletionHandler:", v9, v13);

        v10 = v14;
      }
      else
      {
        Object = PKLogFacilityTypeGetObject(11);
        v12 = objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Could not create peer payment credential.", buf, 2u);
        }

        v10 = (id)objc_claimAutoreleasedReturnValue(+[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:](PKPaymentSetupNavigationController, "viewControllerForPresentingPaymentError:", 0));
        objc_msgSend(v10, "setModalInPresentation:", 1);
        (*((void (**)(id, id))v4 + 2))(v4, v10);
      }

    }
    else
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(+[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:](PKPaymentSetupNavigationController, "viewControllerForPresentingPaymentError:", 0));
      objc_msgSend(v7, "setModalInPresentation:", 1);
      (*((void (**)(id, id))v4 + 2))(v4, v7);
    }

  }
}

- (PKPeerPaymentAccount)account
{
  return self->_account;
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (PKPaymentSetupDelegate)setupDelegate
{
  return (PKPaymentSetupDelegate *)objc_loadWeakRetained((id *)&self->_setupDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
