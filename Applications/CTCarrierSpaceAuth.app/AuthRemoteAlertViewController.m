@implementation AuthRemoteAlertViewController

- (void)_loadURL:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  RemoteUIController *remoteUIController;
  _QWORD v8[5];
  uint8_t buf[4];
  id v10;

  v4 = a3;
  v5 = sub_1000036C4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Loading URL: %@", buf, 0xCu);
  }

  remoteUIController = self->_remoteUIController;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003B90;
  v8[3] = &unk_10000C428;
  v8[4] = self;
  -[RemoteUIController loadURL:postBody:completion:](remoteUIController, "loadURL:postBody:completion:", v4, 0, v8);

}

- (BOOL)_loadPlanTermsUrl
{
  void *v3;
  RemoteUIController *remoteUIController;
  RemoteUIController *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AuthRemoteAlertViewController _getURLFromContextForKey:](self, "_getURLFromContextForKey:", CFSTR("kCTCarrierSpacePlanTermsURL")));
  if (v3)
  {
    location = 0;
    objc_initWeak(&location, self);
    remoteUIController = self->_remoteUIController;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100003D1C;
    v9[3] = &unk_10000C478;
    objc_copyWeak(&v10, &location);
    -[RemoteUIController setHandlerForElementName:handler:](remoteUIController, "setHandlerForElementName:handler:", CFSTR("agree"), v9);
    v5 = self->_remoteUIController;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100003E24;
    v7[3] = &unk_10000C478;
    objc_copyWeak(&v8, &location);
    -[RemoteUIController setHandlerForElementName:handler:](v5, "setHandlerForElementName:handler:", CFSTR("disagree"), v7);
    -[AuthRemoteAlertViewController _loadURL:](self, "_loadURL:", v3);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v3 != 0;
}

- (void)_addOptionalParametersForAuthCodeRequest:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AuthRemoteAlertViewController _getValueFromContextForKey:](self, "_getValueFromContextForKey:", CFSTR("kCTCarrierSpaceAuthICCID")));
  if (v4)
    objc_msgSend(v6, "setIccid:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AuthRemoteAlertViewController _getValueFromContextForKey:](self, "_getValueFromContextForKey:", CFSTR("kCTCarrierSpaceAuthScope")));
  if (v5)
    objc_msgSend(v6, "setScope:", v5);

}

- (id)_generateStateDict
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 32));
  v3 = objc_msgSend(v2, "length");
  v4 = objc_retainAutorelease(v2);
  if (SecRandomCopyBytes(kSecRandomDefault, (size_t)v3, objc_msgSend(v4, "mutableBytes")))
  {
    v5 = 0;
  }
  else
  {
    v9[0] = CFSTR("timestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v9[1] = CFSTR("nonce");
    v10[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "base64EncodedStringWithOptions:", 0));
    v10[1] = v7;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));

  }
  return v5;
}

- (id)_base64EncodedDictionary:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v6;

  v6 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v6));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "base64EncodedStringWithOptions:", 0));

  return v4;
}

- (id)_decodeBase64Dictionary:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v3, 0);

  if (v4)
  {
    v8 = 0;
    v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(NSDictionary), v4, &v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_loadAuthUrl
{
  void *v3;
  NSString *v4;
  NSString *clientID;
  AuthCodeHttpRequest *v6;
  void *v7;
  NSDictionary *v8;
  NSDictionary *authState;
  void *v10;
  AuthCodeHttpRequest *authCodeRequest;
  AuthCodeHttpRequest *v12;
  void *v13;
  BOOL v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AuthRemoteAlertViewController _getURLFromContextForKey:](self, "_getURLFromContextForKey:", CFSTR("kCTCarrierSpaceAuthorizationURL")));
  if (v3
    && (v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[AuthRemoteAlertViewController _getValueFromContextForKey:](self, "_getValueFromContextForKey:", CFSTR("kCTCarrierSpaceClientID"))), clientID = self->_clientID, self->_clientID = v4, clientID, self->_clientID))
  {
    v6 = -[AuthCodeHttpRequest initWithBaseURL:clientID:]([AuthCodeHttpRequest alloc], "initWithBaseURL:clientID:", v3, self->_clientID);
    -[AuthRemoteAlertViewController _addOptionalParametersForAuthCodeRequest:](self, "_addOptionalParametersForAuthCodeRequest:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AuthRemoteAlertViewController _getValueFromContextForKey:](self, "_getValueFromContextForKey:", CFSTR("kCTCarrierSpaceAuthSupportsStateParameter")));
    if (objc_msgSend(v7, "BOOLValue"))
    {
      v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[AuthRemoteAlertViewController _generateStateDict](self, "_generateStateDict"));
      authState = self->_authState;
      self->_authState = v8;

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AuthRemoteAlertViewController _base64EncodedDictionary:](self, "_base64EncodedDictionary:", self->_authState));
      -[AuthCodeHttpRequest setState:](v6, "setState:", v10);

    }
    authCodeRequest = self->_authCodeRequest;
    self->_authCodeRequest = v6;
    v12 = v6;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AuthCodeHttpRequest url](v12, "url"));
    -[AuthRemoteAlertViewController _loadURL:](self, "_loadURL:", v13);

    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_getNSURLSessionConfiguration
{
  void *v2;
  void *v3;
  uint64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
  v5 = objc_opt_class(AuthURLProtocol);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
  objc_msgSend(v2, "setProtocolClasses:", v3);

  objc_msgSend(v2, "set_sourceApplicationSecondaryIdentifier:", kCTCarrierSpaceConnectionAccountIdentifier);
  return v2;
}

- (void)_loadRemoteUIController
{
  LoadingIndicatorViewController *v3;
  NSBundle *v4;
  void *v5;
  void *v6;
  LoadingIndicatorViewController *v7;
  RemoteUIController *v8;
  RemoteUIController *remoteUIController;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v3 = [LoadingIndicatorViewController alloc];
  v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(AuthRemoteAlertViewController));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("LOADING"), &stru_10000C9B8, CFSTR("Localizable")));
  v7 = -[LoadingIndicatorViewController initWithTitle:message:](v3, "initWithTitle:message:", v6, 0);

  -[AuthViewController pushViewController:animated:](self->_authViewController, "pushViewController:animated:", v7, 0);
  v8 = (RemoteUIController *)objc_alloc_init((Class)RemoteUIController);
  remoteUIController = self->_remoteUIController;
  self->_remoteUIController = v8;

  -[RemoteUIController setDelegate:](self->_remoteUIController, "setDelegate:", self);
  if (sub_100003734())
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteUIController loader](self->_remoteUIController, "loader"));
    objc_msgSend(v10, "setAllowNonSecureHTTP:", 1);

  }
  -[RemoteUIController setNavigationController:](self->_remoteUIController, "setNavigationController:", self->_authViewController);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AuthRemoteAlertViewController _getNSURLSessionConfiguration](self, "_getNSURLSessionConfiguration"));
  -[RemoteUIController setSessionConfiguration:](self->_remoteUIController, "setSessionConfiguration:", v11);

  if (!-[AuthRemoteAlertViewController _loadPlanTermsUrl](self, "_loadPlanTermsUrl")
    && !-[AuthRemoteAlertViewController _loadAuthUrl](self, "_loadAuthUrl"))
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100004508;
    v12[3] = &unk_10000C450;
    v12[4] = self;
    -[AuthRemoteAlertViewController _sendAuthFailure:completion:](self, "_sendAuthFailure:completion:", 8, v12);
  }

}

- (void)_configure
{
  void *v3;
  void *v4;
  void *v5;
  CTCarrierSpaceClient *v6;
  CTCarrierSpaceClient *client;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AuthRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v3, "setDesiredHardwareButtonEvents:", 16);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AuthRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v4, "setDesiredAutoLockDuration:", 150.0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AuthRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "setStatusBarHidden:withDuration:", 1, 0.0);

  v6 = (CTCarrierSpaceClient *)objc_msgSend(objc_alloc((Class)CTCarrierSpaceClient), "initWithQueue:", &_dispatch_main_q);
  client = self->_client;
  self->_client = v6;

  -[CTCarrierSpaceClient setUserInAuthFlow:completion:](self->_client, "setUserInAuthFlow:completion:", 1, &stru_10000C4B8);
}

- (void)_deactivate
{
  CTCarrierSpaceClient *client;
  _QWORD v4[4];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  client = self->_client;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004680;
  v4[3] = &unk_10000C508;
  objc_copyWeak(&v5, &location);
  -[CTCarrierSpaceClient setUserInAuthFlow:completion:](client, "setUserInAuthFlow:completion:", 0, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)_getValueFromContextForKey:(id)a3
{
  return -[NSDictionary valueForKey:](self->_launchContext, "valueForKey:", a3);
}

- (id)_getURLFromContextForKey:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AuthRemoteAlertViewController _getValueFromContextForKey:](self, "_getValueFromContextForKey:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));

  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AuthRemoteAlertViewController;
  -[AuthRemoteAlertViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[AuthRemoteAlertViewController _configure](self, "_configure");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  NSDictionary *v5;
  NSDictionary *launchContext;
  AuthViewController *v7;
  AuthViewController *authViewController;
  AuthViewController *v9;
  _QWORD v10[5];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AuthRemoteAlertViewController;
  -[AuthRemoteAlertViewController viewDidLoad](&v11, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));

  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "launchContext"));
  launchContext = self->_launchContext;
  self->_launchContext = v5;

  objc_msgSend(v4, "setAlertViewController:", self);
  v7 = -[AuthViewController initWithNibName:bundle:]([AuthViewController alloc], "initWithNibName:bundle:", 0, 0);
  authViewController = self->_authViewController;
  self->_authViewController = v7;

  -[AuthViewController loadView](self->_authViewController, "loadView");
  -[AuthViewController setDelegate:](self->_authViewController, "setDelegate:", self);
  v9 = self->_authViewController;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100004948;
  v10[3] = &unk_10000C4E0;
  v10[4] = self;
  -[AuthRemoteAlertViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, v10);
  -[AuthRemoteAlertViewController _loadRemoteUIController](self, "_loadRemoteUIController");

}

- (void)_sendAuthInfo:(id)a3 completion:(id)a4
{
  -[CTCarrierSpaceClient authenticationDidComplete:completion:](self->_client, "authenticationDidComplete:completion:", a3, a4);
}

- (void)_sendAuthFailure:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[CTCarrierSpaceError errorForCode:](CTCarrierSpaceError, "errorForCode:", a3));
  -[CTCarrierSpaceClient authenticationDidFail:completion:](self->_client, "authenticationDidFail:completion:", v7, v6);

}

- (void)_presentAlertController:(int64_t)a3
{
  id v3;
  _QWORD block[5];
  id v5;
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004AC8;
  v6[3] = &unk_10000C4E0;
  v6[4] = self;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004B28;
  block[3] = &unk_10000C530;
  block[4] = self;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[AlertControllerFactory alertControllerWithError:completion:](AlertControllerFactory, "alertControllerWithError:completion:", a3, v6));
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (id)_itemWithName:(id)a3 items:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100004C38;
  v11[3] = &unk_10000C558;
  v7 = v5;
  v12 = v7;
  v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", v11);
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
    v9 = 0;
  else
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v8));

  return v9;
}

- (void)_evaluateBiometry:(id)a3
{
  id v4;
  id v5;
  unsigned __int8 v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v4 = a3;
  v5 = objc_alloc_init((Class)LAContext);
  v12 = 0;
  v6 = objc_msgSend(v5, "canEvaluatePolicy:error:", 1, &v12);
  v7 = v12;
  if ((v6 & 1) != 0 && (v8 = objc_msgSend(v5, "biometryType")) != 0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100004D80;
    v9[3] = &unk_10000C580;
    v9[4] = self;
    v11 = v8;
    v10 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (void)_handleTokenResponse:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  AuthRemoteAlertViewController *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  AuthRemoteAlertViewController *v25;
  uint8_t buf[4];
  void *v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

  if (v5)
  {
    v6 = sub_1000036C4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100005DDC(v4, v7);

    v8 = self;
    v9 = 1;
    goto LABEL_11;
  }
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "token"));
  if (!v10 || (v11 = (void *)v10, v12 = objc_msgSend(v4, "statusCode"), v11, v12 != (id)200))
  {
    sub_100002D68(v4);
    v8 = self;
    v9 = 2;
LABEL_11:
    -[AuthRemoteAlertViewController _presentAlertController:](v8, "_presentAlertController:", v9);
    goto LABEL_12;
  }
  sub_100002C68(2, 0);
  v13 = sub_1000036C4();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "token"));
    *(_DWORD *)buf = 138412290;
    v27 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Successfully received acess token %@", buf, 0xCu);

  }
  v16 = objc_alloc_init((Class)CTCarrierSpaceAuthInfo);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "token"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dataUsingEncoding:", 4));
  objc_msgSend(v16, "setAccessToken:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "refreshToken"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dataUsingEncoding:", 4));
  objc_msgSend(v16, "setRefreshToken:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "expiryDate"));
  objc_msgSend(v16, "setExpiresAt:", v21);

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100005068;
  v23[3] = &unk_10000C5A8;
  v24 = v16;
  v25 = self;
  v22 = v16;
  -[AuthRemoteAlertViewController _evaluateBiometry:](self, "_evaluateBiometry:", v23);

LABEL_12:
}

- (void)_exchangeAuthCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _BYTE buf[24];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AuthRemoteAlertViewController _getURLFromContextForKey:](self, "_getURLFromContextForKey:", CFSTR("kCTCarrierSpaceAuthTokenURL")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AuthTokenHttpRequest urlRequestForBaseURL:clientID:authCode:](AuthTokenHttpRequest, "urlRequestForBaseURL:clientID:authCode:", v5, self->_clientID, v4));
  v7 = sub_1000036C4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending request for auth code exchange: %@", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AuthRemoteAlertViewController _getNSURLSessionConfiguration](self, "_getNSURLSessionConfiguration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](NSURLSession, "sessionWithConfiguration:", v9));
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000052C4;
  v12[3] = &unk_10000C5D0;
  objc_copyWeak(&v13, (id *)buf);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataTaskWithRequest:completionHandler:", v6, v12));
  objc_msgSend(v11, "resume");

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

- (BOOL)_validateRedirectURL:(id)a3 withExpectedURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scheme"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scheme"));
  if ((v7 != 0) == (v8 != 0))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "host"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "host"));
    if ((v10 != 0) != (v11 != 0))
    {
      v9 = 0;
LABEL_5:

      goto LABEL_6;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    v15 = (v13 != 0) ^ (v14 != 0);

    if ((v15 & 1) != 0)
    {
LABEL_10:
      v9 = 0;
      goto LABEL_8;
    }
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scheme"));
    if (v16)
    {
      v17 = (void *)v16;
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scheme"));
      if (v18)
      {
        v19 = (void *)v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scheme"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scheme"));
        v22 = objc_msgSend(v20, "isEqualToString:", v21);

        if (!v22)
          goto LABEL_10;
      }
      else
      {

      }
    }
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "host"));
    if (v23)
    {
      v24 = (void *)v23;
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "host"));
      if (v25)
      {
        v26 = (void *)v25;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "host"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "host"));
        v29 = objc_msgSend(v27, "isEqualToString:", v28);

        if (!v29)
          goto LABEL_10;
      }
      else
      {

      }
    }
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
    if (!v30)
    {
      v9 = 1;
      goto LABEL_8;
    }
    v7 = (void *)v30;
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    if (!v31)
    {
      v9 = 1;
      goto LABEL_7;
    }
    v8 = (void *)v31;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    v9 = objc_msgSend(v10, "isEqualToString:", v11);
    goto LABEL_5;
  }
  v9 = 0;
LABEL_6:

LABEL_7:
LABEL_8:

  return v9;
}

- (void)handleAppURL:(id)a3
{
  id v4;
  AuthCodeHttpRequest *authCodeRequest;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  AuthCodeHttpRequest *v16;
  NSDictionary *authState;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  id v26;

  v4 = a3;
  authCodeRequest = self->_authCodeRequest;
  if (authCodeRequest)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AuthCodeHttpRequest redirectURI](authCodeRequest, "redirectURI"));
    v7 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));

    if (-[AuthRemoteAlertViewController _validateRedirectURL:withExpectedURL:](self, "_validateRedirectURL:withExpectedURL:", v4, v7))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v4, 0));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "queryItems"));
      if (!self->_authState)
        goto LABEL_8;
      v10 = objc_claimAutoreleasedReturnValue(-[AuthRemoteAlertViewController _itemWithName:items:](self, "_itemWithName:items:", CFSTR("state"), v9));
      if (!v10)
      {
        v21 = sub_1000036C4();
        v11 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_100005EEC();
        goto LABEL_25;
      }
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject value](v10, "value"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[AuthRemoteAlertViewController _decodeBase64Dictionary:](self, "_decodeBase64Dictionary:", v12));

      if (v13)
      {
        if ((objc_msgSend(v13, "isEqualToDictionary:", self->_authState) & 1) != 0)
        {

LABEL_8:
          v14 = objc_claimAutoreleasedReturnValue(-[AuthRemoteAlertViewController _itemWithName:items:](self, "_itemWithName:items:", CFSTR("code"), v9));
          v11 = v14;
          if (v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject value](v14, "value"));
            -[AuthRemoteAlertViewController _exchangeAuthCode:](self, "_exchangeAuthCode:", v15);

            v16 = self->_authCodeRequest;
            self->_authCodeRequest = 0;

            authState = self->_authState;
            self->_authState = 0;

          }
          else
          {
            sub_100002C68(2, 1);
            v22 = sub_1000036C4();
            v23 = objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              sub_100005E88();

            -[AuthRemoteAlertViewController _presentAlertController:](self, "_presentAlertController:", 2);
          }
          goto LABEL_25;
        }
        sub_100002C68(2, 5);
        v26 = sub_1000036C4();
        v25 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_100005F44();
      }
      else
      {
        v24 = sub_1000036C4();
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_100005F18();
      }

      -[AuthRemoteAlertViewController _presentAlertController:](self, "_presentAlertController:", 2);
LABEL_25:

      goto LABEL_26;
    }
    sub_100002C68(2, 4);
    v19 = sub_1000036C4();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_100005F70();

    -[AuthRemoteAlertViewController _presentAlertController:](self, "_presentAlertController:", 2);
  }
  else
  {
    v18 = sub_1000036C4();
    v7 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100005E5C();
  }
LABEL_26:

}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  return 1;
}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000592C;
  v5[3] = &unk_10000C5F8;
  v5[4] = self;
  objc_msgSend(a3, "setHandlerForElementName:handler:", CFSTR("cancel"), v5, a5);
}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
    v10 = objc_msgSend(v9, "isEqualToString:", NSURLErrorDomain);

    if (v10)
    {
      if (objc_msgSend(v8, "code") != (id)-999)
      {
        v11 = sub_1000036C4();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          sub_100005FEC();

        -[AuthRemoteAlertViewController _presentAlertController:](self, "_presentAlertController:", 1);
      }
    }
  }

}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a4;
  if (objc_msgSend(v5, "statusCode") != (id)200 && objc_msgSend(v5, "statusCode") != (id)302)
  {
    v6 = sub_1000036C4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100006050(v5, v7);

    sub_100002C68(3, (uint64_t)objc_msgSend(v5, "statusCode"));
    -[AuthRemoteAlertViewController _presentAlertController:](self, "_presentAlertController:", 1);
  }

}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  _QWORD v5[5];

  if (*a5 == 1)
  {
    *a5 = 2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100005B4C;
    v5[3] = &unk_10000C450;
    v5[4] = self;
    -[AuthRemoteAlertViewController _sendAuthFailure:completion:](self, "_sendAuthFailure:completion:", 10, v5);
  }
}

- (void)handleButtonActions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  id v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[16];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        if (((unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "events") & 0x11) != 0)
        {
          v9 = sub_1000036C4();
          v10 = objc_claimAutoreleasedReturnValue(v9);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "User pressed lock or home button, dismissing ourselves", buf, 2u);
          }

          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_100005CE0;
          v11[3] = &unk_10000C450;
          v11[4] = self;
          -[AuthRemoteAlertViewController _sendAuthFailure:completion:](self, "_sendAuthFailure:completion:", 10, v11);
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authState, 0);
  objc_storeStrong((id *)&self->_authCodeRequest, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_launchContext, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_authViewController, 0);
}

@end
