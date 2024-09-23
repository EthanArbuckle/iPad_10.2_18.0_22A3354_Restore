@implementation BuddyCombinedTermsController

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupTOS;
}

+ (unint64_t)applicableDispositions
{
  return 28;
}

- (BOOL)controllerNeedsToRun
{
  BuddyNetworkProvider *v2;
  unsigned __int8 v3;

  v2 = -[BuddyCombinedTermsController networkProvider](self, "networkProvider", a2, self);
  v3 = -[BuddyNetworkProvider networkReachable](v2, "networkReachable");

  return v3 & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  BuddyCombinedTermsController *v9;
  id v10;
  id location[2];
  BuddyCombinedTermsController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[BuddyAppleIDConfigurationManager sharedManager](BuddyAppleIDConfigurationManager, "sharedManager");
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100193F8C;
  v8 = &unk_1002827F8;
  v9 = v12;
  v10 = location[0];
  objc_msgSend(v3, "getURLConfigurationWithHandler:", &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)presentHostedViewControllerOnNavigationController:(id)a3 completion:(id)a4
{
  BuddyCombinedTermsProvider *v5;
  void **v6;
  int v7;
  int v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  BuddyCombinedTermsController *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  BuddyCombinedTermsController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  -[BuddyCombinedTermsController setPresentationCanceled:](v16, "setPresentationCanceled:", 0);
  v5 = -[BuddyCombinedTermsController combinedTermsProvider](v16, "combinedTermsProvider");
  v6 = _NSConcreteStackBlock;
  v7 = -1073741824;
  v8 = 0;
  v9 = sub_10019419C;
  v10 = &unk_100284160;
  v11 = v16;
  v12 = location[0];
  v13 = v14;
  -[BuddyCombinedTermsProvider fetchTerms:](v5, "fetchTerms:", &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)cancelHostedPresentation
{
  -[BuddyCombinedTermsController setPresentationCanceled:](self, "setPresentationCanceled:", 1, a2);
  -[BuddyCombinedTermsController _cleanupRemoteUI](self, "_cleanupRemoteUI");
}

- (void)controllerDone
{
  id v2;
  BFFFlowItemDelegate *v3;

  v2 = -[BuddyCombinedTermsController presentationCompletion](self, "presentationCompletion", a2);

  if (v2)
  {
    -[BuddyCombinedTermsController _callPresentationCompletionWithNothing](self, "_callPresentationCompletionWithNothing");
    -[BuddyCombinedTermsController _cleanupRemoteUI](self, "_cleanupRemoteUI");
  }
  else
  {
    v3 = -[BuddyCombinedTermsController delegate](self, "delegate");
    -[BFFFlowItemDelegate flowItemDone:](v3, "flowItemDone:", self);

  }
}

- (void)_addHeadersToRequest:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  unint64_t i;
  id v9;
  id v10;
  _QWORD v11[8];
  uint64_t v12;
  id v13;
  id location[3];
  _BYTE v15[128];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[BuddyAccountTools sharedBuddyAccountTools](BuddyAccountTools, "sharedBuddyAccountTools");
  objc_msgSend(v3, "addAccountHeadersToRequest:", location[0]);

  v4 = (void *)objc_opt_new(AKAppleIDSession);
  v13 = objc_msgSend(v4, "appleIDHeadersForRequest:", location[0]);

  memset(v11, 0, sizeof(v11));
  v5 = v13;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11[2];
    do
    {
      for (i = 0; i < (unint64_t)v6; ++i)
      {
        if (*(_QWORD *)v11[2] != v7)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(v11[1] + 8 * i);
        v9 = location[0];
        v10 = objc_msgSend(v13, "objectForKeyedSubscript:", v12);
        objc_msgSend(v9, "setValue:forHTTPHeaderField:", v10, v12);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", v11, v15, 16);
    }
    while (v6);
  }

  if ((+[BYWarranty shouldDisplay](BYWarranty, "shouldDisplay") & 1) != 0)
    objc_msgSend(location[0], "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-MMe-Show-Warranty"));
  objc_msgSend(location[0], "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Mme-Setup-FCE048DE-F34F-4FAF-A6DD-6C8AC9DF0C54"));
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)_addHandlersForTermsButtonsToRemoteUIController:(id)a3
{
  id v3;
  id v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(NSObject *, void *, void *, void *);
  void *v9;
  BuddyCombinedTermsController *v10;
  void **v11;
  int v12;
  int v13;
  void (*v14)(NSObject *, void *, void *, void *);
  void *v15;
  BuddyCombinedTermsController *v16;
  id location[2];
  BuddyCombinedTermsController *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = location[0];
  v11 = _NSConcreteStackBlock;
  v12 = -1073741824;
  v13 = 0;
  v14 = sub_1001947BC;
  v15 = &unk_100284188;
  v16 = v18;
  objc_msgSend(v3, "setHandlerForElementName:handler:", CFSTR("agree"), &v11);
  v4 = location[0];
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_1001948F0;
  v9 = &unk_100284188;
  v10 = v18;
  objc_msgSend(v4, "setHandlerForElementName:handler:", CFSTR("disagree"), &v5);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)_callPresentationCompletionWithNothing
{
  id v2;
  id location[2];
  BuddyCombinedTermsController *v4;

  v4 = self;
  location[1] = (id)a2;
  v2 = -[BuddyCombinedTermsController presentationCompletion](self, "presentationCompletion");

  if (v2)
  {
    location[0] = -[BuddyCombinedTermsController presentationCompletion](v4, "presentationCompletion");
    -[BuddyCombinedTermsController setPresentationCompletion:](v4, "setPresentationCompletion:", 0);
    (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
    objc_storeStrong(location, 0);
  }
}

- (void)_cleanupRemoteUI
{
  RemoteUIController *v2;
  id v3;

  v2 = -[BuddyCombinedTermsController remoteUIController](self, "remoteUIController", a2);
  v3 = -[RemoteUIController loader](v2, "loader");
  objc_msgSend(v3, "cancel");

  -[BuddyCombinedTermsController setRemoteUIController:](self, "setRemoteUIController:", 0);
}

+ (id)_termsVersionFromObjectModel:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  os_log_t oslog;
  id v9;
  id location[3];
  id v11;
  uint8_t buf[24];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "clientInfo");
  v9 = objc_msgSend(v3, "objectForKey:", CFSTR("SLAVersion"));

  oslog = (os_log_t)(id)_BYLoggingFacility(v4);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100039500((uint64_t)buf, (uint64_t)v9);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "SLA version in combined terms: %{public}@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if ((objc_msgSend(v9, "hasPrefix:", CFSTR("EA")) & 1) != 0)
  {
    v5 = objc_msgSend(v9, "substringFromIndex:", 2);
    v6 = v9;
    v9 = v5;

  }
  if ((uint64_t)objc_msgSend(v9, "integerValue") <= 0)
    v11 = 0;
  else
    v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v9, "integerValue"));
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (void)_userRespondedToCombinedTCsWithAgreement:(BOOL)a3 withSLAVersion:(id)a4
{
  NSFileManager *v4;
  RemoteUIController *v5;
  id v6;
  id v7;
  id v8;
  BOOL v9;
  SEL v10;
  BuddyCombinedTermsController *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8 = 0;
  objc_storeStrong(&v8, a4);
  if (v9)
  {
    v4 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
    -[NSFileManager removeItemAtPath:error:](v4, "removeItemAtPath:error:", CFSTR("/var/mobile/Media/iTunes_Control/iTunes/ShowLicense"), 0);

    +[BYWarranty acknowledge](BYWarranty, "acknowledge");
    if (v8)
      +[BYLicenseAgreement recordUserAcceptedAgreementVersion:](BYLicenseAgreement, "recordUserAcceptedAgreementVersion:", objc_msgSend(v8, "unsignedIntegerValue"));
    +[BuddyTermsConditionsFlow didAgreeToServerTerms](BuddyTermsConditionsFlow, "didAgreeToServerTerms");
    -[BuddyCombinedTermsController controllerDone](v11, "controllerDone");
  }
  v5 = -[BuddyCombinedTermsController remoteUIController](v11, "remoteUIController");
  v6 = -[RemoteUIController navigationController](v5, "navigationController");
  v7 = objc_msgSend(v6, "presentedViewController");
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

  objc_storeStrong(&v8, 0);
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  unsigned __int8 v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  int v20;
  char v21;
  id v22;
  char v23;
  id v24;
  unint64_t *v25;
  id v26;
  id location[2];
  BuddyCombinedTermsController *v28;

  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = 0;
  objc_storeStrong(&v26, a4);
  v25 = a5;
  if (*a5 == 1)
  {
    v7 = objc_msgSend(v26, "clientInfo");
    v8 = objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("continue"));
    v9 = objc_opt_class(NSString);
    v23 = 0;
    v21 = 0;
    v10 = 0;
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      v24 = objc_msgSend(v26, "clientInfo");
      v23 = 1;
      v22 = objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("continue"));
      v21 = 1;
      v10 = objc_msgSend(v22, "BOOLValue");
    }
    if ((v21 & 1) != 0)

    if ((v23 & 1) != 0)
    if ((v10 & 1) != 0)
      +[BuddyTermsConditionsFlow didAgreeToServerTerms](BuddyTermsConditionsFlow, "didAgreeToServerTerms");
    -[BuddyCombinedTermsController controllerDone](v28, "controllerDone");
    v20 = 1;
  }
  else
  {
    if (*v25 == 2)
    {
      v11 = objc_msgSend(v26, "defaultPages");
      v19 = objc_msgSend(v11, "firstObject");

      v12 = objc_msgSend(v19, "presentingViewController");
      if (!v12)
      {
        *v25 = 5;
        v13 = objc_msgSend(v19, "toolbar");

        if (v13)
        {
          v14 = objc_msgSend(v19, "leftToolbarButtonItem");

          if (v14)
          {
            v15 = objc_msgSend(v19, "leftToolbarButtonItem");
            objc_msgSend(v19, "setLeftNavigationBarButtonItem:", v15);

          }
          v16 = objc_msgSend(v19, "rightToolbarButtonItem", v19);

          if (v16)
          {
            v17 = objc_msgSend(v19, "rightToolbarButtonItem");
            objc_msgSend(v19, "setRightNavigationBarButtonItem:", v17);

          }
          v18 = objc_msgSend(v19, "toolbar");
          objc_msgSend(v18, "setHidden:", 1);

        }
      }
      objc_storeStrong(&v19, 0);
    }
    v20 = 0;
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4
{
  double v5;
  double v6;
  id v7;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  objc_msgSend(v7, "setModalPresentationStyle:", 2);
  +[OBBaseWelcomeController preferredContentSize](OBBaseWelcomeController, "preferredContentSize");
  objc_msgSend(v7, "setPreferredContentSize:", v5, v6, *(_QWORD *)&v5, *(_QWORD *)&v6, *(_QWORD *)&v5, *(_QWORD *)&v6);
  objc_msgSend(v7, "setModalInPresentation:", 1);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)remoteUIController:(id)a3 didPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  id v7;
  id v8;
  id v9;
  void (**v10)(id, id);
  BOOL v11;
  id v12;
  id location[2];
  BuddyCombinedTermsController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v11 = a5;
  v7 = -[BuddyCombinedTermsController presentationCompletion](v14, "presentationCompletion");

  if (v7)
  {
    v10 = (void (**)(id, id))-[BuddyCombinedTermsController presentationCompletion](v14, "presentationCompletion");
    -[BuddyCombinedTermsController setPresentationCompletion:](v14, "setPresentationCompletion:", 0);
    v8 = objc_msgSend(v12, "displayedPages");
    v9 = objc_msgSend(v8, "firstObject");
    v10[2](v10, v9);

    objc_storeStrong((id *)&v10, 0);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  uint64_t v7;
  os_log_t oslog;
  id v9;
  id v10;
  id location[2];
  BuddyCombinedTermsController *v12;
  uint8_t buf[24];

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v9 = 0;
  objc_storeStrong(&v9, a5);
  if (v10)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v7);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100038C28((uint64_t)buf, (uint64_t)v10);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Failed to load combined terms: %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    -[BuddyCombinedTermsController _callPresentationCompletionWithNothing](v12, "_callPresentationCompletionWithNothing");
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  id v8;
  id v9;
  id location[2];
  BuddyCombinedTermsController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v8 = 0;
  objc_storeStrong(&v8, a5);
  -[BuddyCombinedTermsController _addHeadersToRequest:](v11, "_addHeadersToRequest:", v9);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return 1;
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_networkProvider, a3);
}

- (BuddyCombinedTermsProvider)combinedTermsProvider
{
  return self->_combinedTermsProvider;
}

- (void)setCombinedTermsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_combinedTermsProvider, a3);
}

- (RemoteUIController)remoteUIController
{
  return self->_remoteUIController;
}

- (void)setRemoteUIController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteUIController, a3);
}

- (NSURL)termsURL
{
  return self->_termsURL;
}

- (void)setTermsURL:(id)a3
{
  objc_storeStrong((id *)&self->_termsURL, a3);
}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
}

- (void)setNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_navigationController, a3);
}

- (id)presentationCompletion
{
  return self->_presentationCompletion;
}

- (void)setPresentationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)presentationCanceled
{
  return self->_presentationCanceled;
}

- (void)setPresentationCanceled:(BOOL)a3
{
  self->_presentationCanceled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentationCompletion, 0);
  objc_destroyWeak((id *)&self->_navigationController);
  objc_storeStrong((id *)&self->_termsURL, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_combinedTermsProvider, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
