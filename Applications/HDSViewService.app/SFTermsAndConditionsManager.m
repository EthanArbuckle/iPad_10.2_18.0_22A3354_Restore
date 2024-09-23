@implementation SFTermsAndConditionsManager

- (SFTermsAndConditionsManager)initWithPresenter:(id)a3 showWarranty:(BOOL)a4
{
  id v7;
  SFTermsAndConditionsManager *v8;
  SFTermsAndConditionsManager *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFTermsAndConditionsManager;
  v8 = -[SFTermsAndConditionsManager init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_showWarranty = a4;
    objc_storeStrong((id *)&v8->_presenter, a3);
  }

  return v9;
}

- (void)activate
{
  RemoteUIController *v3;
  RemoteUIController *termsController;
  void *v5;
  RemoteUIController *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  RemoteUIController *v14;
  RemoteUIController *v15;
  RemoteUIController *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  _QWORD v23[2];
  _QWORD v24[2];

  v3 = (RemoteUIController *)objc_alloc_init((Class)RemoteUIController);
  termsController = self->_termsController;
  self->_termsController = v3;

  -[RemoteUIController setHostViewController:](self->_termsController, "setHostViewController:", self->_presenter);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteUIController loader](self->_termsController, "loader"));
  objc_msgSend(v5, "setAllowNonSecureHTTP:", IsAppleInternalBuild() != 0);

  v6 = self->_termsController;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RUIStyle setupAssistantStyle](RUIStyle, "setupAssistantStyle"));
  -[RemoteUIController setStyle:](v6, "setStyle:", v7);

  -[RemoteUIController setDelegate:](self->_termsController, "setDelegate:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "aa_primaryAppleAccount"));

  v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", &off_1000C70B0, &off_1000C7100, 0);
  v11 = v10;
  if (self->_showWarranty)
    objc_msgSend(v10, "insertObject:atIndex:", &off_1000C70D8, 1);
  if (objc_msgSend(v9, "aa_needsToVerifyTerms"))
    objc_msgSend(v11, "addObject:", &off_1000C7128);
  v23[0] = CFSTR("terms");
  v23[1] = CFSTR("format");
  v24[0] = v11;
  v24[1] = kAAProtocolGenericTermsUIBuddyMLKey;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 2));
  v13 = objc_msgSend(objc_alloc((Class)AAGenericTermsUIRequest), "initWithAccount:parameters:preferPassword:", v9, v12, 0);
  if (v13)
  {
    objc_initWeak(&location, self);
    v14 = self->_termsController;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100005920;
    v20[3] = &unk_1000C1590;
    objc_copyWeak(&v21, &location);
    -[RemoteUIController setHandlerForElementName:handler:](v14, "setHandlerForElementName:handler:", CFSTR("agree"), v20);
    v15 = self->_termsController;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100005968;
    v18[3] = &unk_1000C1590;
    objc_copyWeak(&v19, &location);
    -[RemoteUIController setHandlerForElementName:handler:](v15, "setHandlerForElementName:handler:", CFSTR("disagree"), v18);
    v16 = self->_termsController;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "urlRequest"));
    -[RemoteUIController loadRequest:completion:](v16, "loadRequest:completion:", v17, &stru_1000C15F8);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    -[SFTermsAndConditionsManager loadOfflineTerms](self, "loadOfflineTerms");
  }

}

- (void)_handleAgreeFromObjectModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "clientInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("agreeUrl")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aa_primaryAppleAccount"));

  v8 = objc_msgSend(objc_alloc((Class)AAiCloudTermsAgreeRequest), "initWithURLString:account:", v5, v7);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005B2C;
  v9[3] = &unk_1000C1620;
  v9[4] = self;
  objc_msgSend(v8, "performRequestWithHandler:", v9);

}

- (void)_termsDisagree
{
  -[SFTermsAndConditionsManager dismissTerms:](self, "dismissTerms:", 0);
}

- (void)loadOfflineTerms
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  RemoteUIController *termsController;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizations"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", v13, v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathForResource:ofType:inDirectory:forLocalization:", CFSTR("HomePod_Offline_Terms_Warranty"), CFSTR("xml"), 0, v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v8));
  self->_showingOfflineTerms = 1;
  termsController = self->_termsController;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "resourceURL"));
  -[RemoteUIController loadData:baseURL:](termsController, "loadData:baseURL:", v9, v12);

}

- (void)handleDisagreeButton
{
  -[SFTermsAndConditionsManager dismissTerms:](self, "dismissTerms:", 0);
}

- (void)handleAgreeButton
{
  -[SFTermsAndConditionsManager dismissTerms:](self, "dismissTerms:", 1);
}

- (void)dismissTerms:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void (**v6)(id, _BOOL8);

  v3 = a3;
  v5 = -[RemoteUIController dismissObjectModelsAnimated:completion:](self->_termsController, "dismissObjectModelsAnimated:completion:", 1, 0);
  v6 = (void (**)(id, _BOOL8))objc_claimAutoreleasedReturnValue(-[SFTermsAndConditionsManager completionHandler](self, "completionHandler"));
  v6[2](v6, v3);

}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  if (a4)
    -[SFTermsAndConditionsManager loadOfflineTerms](self, "loadOfflineTerms", a3, a4, a5);
}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v5 = a4;
  v6 = (void *)objc_opt_new(AKAppleIDSession);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appleIDHeadersForRequest:", v5));

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v13, (_QWORD)v21));
        objc_msgSend(v5, "setValue:forHTTPHeaderField:", v14, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[AADeviceInfo userAgentHeader](AADeviceInfo, "userAgentHeader"));
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", v15, CFSTR("User-Agent"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[AADeviceInfo clientInfoHeader](AADeviceInfo, "clientInfoHeader"));
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", v16, CFSTR("X-MMe-Client-Info"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", NSLocaleCountryCode));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "uppercaseString"));
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", v19, CFSTR("X-MMe-Country"));

  return 1;
}

- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void (**v19)(void);
  _QWORD v20[3];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 == (id)1)
    objc_msgSend(v5, "setModalPresentationStyle:", 2);
  if (self->_showingOfflineTerms)
  {
    v8 = objc_alloc((Class)UIBarButtonItem);
    v9 = sub_100006250(CFSTR("TERMS_DISAGREE_BUTTON_TITLE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_msgSend(v8, "initWithTitle:style:target:action:", v10, 0, self, "handleDisagreeButton");

    v12 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v13 = objc_alloc((Class)UIBarButtonItem);
    v14 = sub_100006250(CFSTR("TERMS_AGREE_BUTTON_TITLE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = objc_msgSend(v13, "initWithTitle:style:target:action:", v15, 2, self, "handleAgreeButton");

    objc_msgSend(v5, "setToolbarHidden:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topViewController"));
    v20[0] = v11;
    v20[1] = v12;
    v20[2] = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 3));
    objc_msgSend(v17, "setToolbarItems:animated:", v18, 0);

  }
  v19 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SFTermsAndConditionsManager loadedHandler](self, "loadedHandler"));
  v19[2]();

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)loadedHandler
{
  return self->_loadedHandler;
}

- (void)setLoadedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (RemoteUIController)termsController
{
  return self->_termsController;
}

- (void)setTermsController:(id)a3
{
  objc_storeStrong((id *)&self->_termsController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong(&self->_loadedHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_genericTermsUIViewController, 0);
}

@end
