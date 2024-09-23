@implementation PKServiceTransactionAuthenticationPasscodeViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_hostApplicationDidEnterBackground
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKServiceTransactionAuthenticationPasscodeViewController;
  -[PKServiceTransactionAuthenticationPasscodeViewController _hostApplicationDidEnterBackground](&v4, "_hostApplicationDidEnterBackground");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKServiceTransactionAuthenticationPasscodeViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v3, "passcodeViewControllerDidCancel");

}

- (void)viewWillAppear:(BOOL)a3
{
  NSData *archivedAnalyticsSessionToken;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKServiceTransactionAuthenticationPasscodeViewController;
  -[PKServiceTransactionAuthenticationPasscodeViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  if (self->_archivedAnalyticsSessionToken)
  {
    +[PKAnalyticsReporter beginSubjectReporting:withArchivedParent:](PKAnalyticsReporter, "beginSubjectReporting:withArchivedParent:", PKAnalyticsSubjectSecureUIService);
    archivedAnalyticsSessionToken = self->_archivedAnalyticsSessionToken;
    self->_archivedAnalyticsSessionToken = 0;

  }
  else
  {
    +[PKAnalyticsReporter beginSubjectReporting:](PKAnalyticsReporter, "beginSubjectReporting:", PKAnalyticsSubjectSecureUIService);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKServiceTransactionAuthenticationPasscodeViewController;
  -[PKServiceTransactionAuthenticationPasscodeViewController viewDidDisappear:](&v3, "viewDidDisappear:", a3);
  +[PKAnalyticsReporter endSubjectReporting:](PKAnalyticsReporter, "endSubjectReporting:", PKAnalyticsSubjectSecureUIService);
}

- (void)setPassUniqueIdentifier:(id)a3 transactionIdentifier:(id)a4 archivedAnalyticsSessionToken:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PKTransactionAuthenticationCollectPasscodeViewController *v14;
  PKTransactionAuthenticationCollectPasscodeViewController *collectPasscodeViewController;
  PKTransactionAuthenticationCollectPasscodeViewController *v16;
  uint64_t Object;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[PKServiceTransactionAuthenticationPasscodeViewController _isHostProcessEntitled](self, "_isHostProcessEntitled"))
  {
    objc_storeStrong((id *)&self->_archivedAnalyticsSessionToken, a5);
    v14 = -[PKTransactionAuthenticationCollectPasscodeViewController initWithPassUniqueIdentifier:transactionIdentifier:delegate:]([PKTransactionAuthenticationCollectPasscodeViewController alloc], "initWithPassUniqueIdentifier:transactionIdentifier:delegate:", v10, v11, self);
    collectPasscodeViewController = self->_collectPasscodeViewController;
    self->_collectPasscodeViewController = v14;

    objc_initWeak(location, self);
    v16 = self->_collectPasscodeViewController;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000065B8;
    v19[3] = &unk_10000C610;
    objc_copyWeak(&v21, location);
    v20 = v13;
    -[PKTransactionAuthenticationCollectPasscodeViewController preflightWithCompletion:](v16, "preflightWithCompletion:", v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak(location);
  }
  else
  {
    Object = PKLogFacilityTypeGetObject(28);
    v18 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Host process is not entitled to request PIN view service.", (uint8_t *)location, 2u);
    }

    if (v13)
      (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }

}

- (void)resetWithTransactionAuthenticationFailure:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  PKTransactionAuthenticationCollectPasscodeViewController *collectPasscodeViewController;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = v6;
  collectPasscodeViewController = self->_collectPasscodeViewController;
  if (collectPasscodeViewController)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100006814;
    v9[3] = &unk_10000C638;
    v10 = v6;
    -[PKTransactionAuthenticationCollectPasscodeViewController resetWithTransactionAuthenticationFailure:completion:](collectPasscodeViewController, "resetWithTransactionAuthenticationFailure:completion:", a3, v9);

  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (BOOL)_isHostProcessEntitled
{
  __SecTask *v2;
  __SecTask *v3;
  void *v4;
  unsigned __int8 v5;
  audit_token_t v7;

  -[PKServiceTransactionAuthenticationPasscodeViewController _hostAuditToken](self, "_hostAuditToken");
  v2 = SecTaskCreateWithAuditToken(0, &v7);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = (void *)SecTaskCopyValueForEntitlement(v2, PKTransactionAuthenticationSecureUIServiceAccess, 0);
  v5 = objc_msgSend(v4, "BOOLValue");
  CFRelease(v3);

  return v5;
}

- (void)passcodeViewController:(id)a3 requestSessionExchangeToken:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PKServiceTransactionAuthenticationPasscodeViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v6, "passcodeViewControllerRequestSessionExchangeTokenWithHandler:", v5);

}

- (void)passcodeViewControllerDidEndSessionExchange:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PKServiceTransactionAuthenticationPasscodeViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy", a3));
  objc_msgSend(v3, "passcodeViewControllerDidEndSessionExchange");

}

- (void)passcodeViewControllerDidCancel:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PKServiceTransactionAuthenticationPasscodeViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy", a3));
  objc_msgSend(v3, "passcodeViewControllerDidCancel");

}

- (void)passcodeViewController:(id)a3 didGenerateEncryptedPasscode:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PKServiceTransactionAuthenticationPasscodeViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v6, "passcodeViewControllerDidGenerateEncryptedPasscode:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivedAnalyticsSessionToken, 0);
  objc_storeStrong((id *)&self->_collectPasscodeViewController, 0);
}

@end
