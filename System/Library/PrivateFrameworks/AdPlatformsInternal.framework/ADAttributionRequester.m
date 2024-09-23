@implementation ADAttributionRequester

void __45__ADAttributionRequester_setStocksAdEnabled___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("IDs have been set by request of Stock's enablement call."));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _ADLog();

}

- (void)setServerToTest:(int64_t)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[NSXPCConnection valueForEntitlement:](self->_connection, "valueForEntitlement:", CFSTR("com.apple.private.iad.news-client"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Received request to change AdServer environment."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    switch(a3)
    {
      case 1:
        objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setString:forKey:", CFSTR("https://iad2v1-iadsdk.iad.apple.com/adserver"), CFSTR("AdServerURL"));

        objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = CFSTR("https://iad2v1-cf.iad.apple.com/adserver");
        break;
      case 2:
        objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setString:forKey:", CFSTR("https://iad2v2-iadsdk.iad.apple.com/adserver"), CFSTR("AdServerURL"));

        objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = CFSTR("https://iad2v2-cf.iad.apple.com/adserver");
        break;
      case 3:
        objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setString:forKey:", CFSTR("https://iad2v3-iadsdk.iad.apple.com/adserver"), CFSTR("AdServerURL"));

        objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = CFSTR("https://iad2v3-cf.iad.apple.com/adserver");
        break;
      case 4:
        objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setString:forKey:", CFSTR("https://iad2v4-iadsdk.iad.apple.com/adserver"), CFSTR("AdServerURL"));

        objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = CFSTR("https://iad2v4-cf.iad.apple.com/adserver");
        break;
      case 5:
        objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setString:forKey:", CFSTR("https://iad2v5-iadsdk.iad.apple.com/adserver"), CFSTR("AdServerURL"));

        objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = CFSTR("https://iad2v5-cf.iad.apple.com/adserver");
        break;
      default:
        objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setString:forKey:", CFSTR("https://iadsdk.apple.com/adserver"), CFSTR("AdServerURL"));

        objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = CFSTR("https://cf.iadsdk.apple.com/adserver");
        break;
    }
    objc_msgSend(v8, "setString:forKey:", v10, CFSTR("ConfigurationAdServerURL"));

    objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBool:forKey:", 1, CFSTR("ForceExpireConfiguration"));

    objc_msgSend(MEMORY[0x24BE02228], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setConfigurationExpirationTime:", 0);

    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("ForceExpireConfiguration"), CFSTR("com.apple.AdLib"), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: A request to change AdServer environment was made from a non-entitled caller."));
    v18 = (id)objc_claimAutoreleasedReturnValue();
    _ADLog();
  }

}

- (void)setStocksAdEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  char v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[NSXPCConnection valueForEntitlement:](self->_connection, "valueForEntitlement:", CFSTR("com.apple.private.iad.news-client"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: A request to change Stocks Ad enablement was made from a non-entitled caller."));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    _ADLog();
    goto LABEL_7;
  }
  v6 = CFSTR("disable");
  if (v3)
    v6 = CFSTR("enable");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Received request to %@ Ads in Stocks."), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBool:forKey:", v3, CFSTR("StocksEnabled"));

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iTunesAccountDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDSID:completionHandler:", v10, &__block_literal_global);

LABEL_7:
  }
}

- (ADAttributionRequester)initWithConnection:(id)a3 bundleID:(id)a4 transactionID:(id)a5
{
  id v9;
  id v10;
  id v11;
  ADAttributionRequester *v12;
  ADAttributionRequester *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)ADAttributionRequester;
  v12 = -[ADAttributionRequester init](&v24, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundleID, a4);
    objc_storeStrong((id *)&v13->_transactionToken, a5);
    objc_storeStrong((id *)&v13->_connection, a3);
    -[NSXPCConnection setExportedObject:](v13->_connection, "setExportedObject:", v13);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E56A38);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v13->_connection, "setExportedInterface:", v14);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E56A38);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v13->_connection, "setRemoteObjectInterface:", v15);

    objc_initWeak(&location, v13);
    v16 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __68__ADAttributionRequester_initWithConnection_bundleID_transactionID___block_invoke;
    v21[3] = &unk_24D655F20;
    objc_copyWeak(&v22, &location);
    -[NSXPCConnection setInvalidationHandler:](v13->_connection, "setInvalidationHandler:", v21);
    v19[0] = v16;
    v19[1] = 3221225472;
    v19[2] = __68__ADAttributionRequester_initWithConnection_bundleID_transactionID___block_invoke_2;
    v19[3] = &unk_24D655F20;
    objc_copyWeak(&v20, &location);
    -[NSXPCConnection setInterruptionHandler:](v13->_connection, "setInterruptionHandler:", v19);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Accepted connection from Attribution Client."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    -[NSXPCConnection resume](v13->_connection, "resume");
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __68__ADAttributionRequester_initWithConnection_bundleID_transactionID___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x24BDD17C8];
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "bundleID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("XPC connection invalidated for %@. Lost connection from Attribution Client."), v3, v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("XPC connection invalidated with nil ADAttributionRequester. Lost connection from Attribution Client."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();
  }

}

- (NSString)bundleID
{
  return self->_bundleID;
}

void __68__ADAttributionRequester_initWithConnection_bundleID_transactionID___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x24BDD17C8];
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "bundleID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("XPC connection interrupted for %@. Lost connection from Attribution Client."), v3, v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("XPC connection interrupted with nil ADAttributionRequester. Lost connection from Attribution Client."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();
  }

}

- (BOOL)_isAppTrackingAuthorized
{
  void *v2;
  void *v3;
  int v4;

  -[ADAttributionRequester connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "auditToken");
  v4 = TCCAccessPreflightWithAuditToken();

  return v4 == 0;
}

- (void)requestAttributionDetails:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  char v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, _QWORD))a3;
  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAccountRestricted");

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE639A0]);

  if ((v6 & 1) != 0 || v8)
  {
    v23 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("The app is not authorized for ad tracking"), &stru_24D656170, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ADClientErrorDomain"), 1, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BDD17C8];
    v17 = CFSTR("The app's TCC tracking status is restricted. Attribution can not be provided.");
  }
  else
  {
    if (-[ADAttributionRequester _isAppTrackingAuthorized](self, "_isAppTrackingAuthorized"))
    {
      if (v4)
      {
        v9 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(&unk_24D656FB8, "AD_jsonString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("Sanitized attribution response: %@"), v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog();

        v4[2](v4, &unk_24D656FB8, 0);
      }
      goto LABEL_11;
    }
    v21 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("The app is not authorized for ad tracking"), &stru_24D656170, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ADClientErrorDomain"), 1, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BDD17C8];
    v17 = CFSTR("The app's TCC tracking status is denied. Attribution can not be provided.");
  }
  objc_msgSend(v16, "stringWithFormat:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  if (v4)
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v15);

LABEL_11:
}

- (void)beginAttributionRequest:(id)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  ADAttributionRequester *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __75__ADAttributionRequester_beginAttributionRequest_reason_completionHandler___block_invoke;
  v14[3] = &unk_24D655F48;
  v15 = v8;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v11 = v9;
  v12 = v10;
  v13 = v8;
  -[ADAttributionRequester requestAttributionDetails:](self, "requestAttributionDetails:", v14);

}

void __75__ADAttributionRequester_beginAttributionRequest_reason_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BE02258], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeWatchdogWithToken:", *(_QWORD *)(a1 + 32));

  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v10, v5);
  releaseXPCTransaction();
  +[ADAttributionService sharedInstance](ADAttributionService, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "transactionToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeClientForToken:", v9);

}

- (void)requestAttributionDetailsWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  __CFString *v14;
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Handling Attribution Request."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  v16 = CFSTR("AttributingBundleID");
  -[ADAttributionRequester bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  if (v4)
  {
    takeXPCTransaction();
    objc_msgSend(MEMORY[0x24BE02258], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createNewWatchdog:withTimer:", CFSTR("Attribution Request in progress"), 1800);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE02228], "workQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __61__ADAttributionRequester_requestAttributionDetailsWithBlock___block_invoke;
    v12[3] = &unk_24D655F70;
    v12[4] = self;
    v13 = v9;
    v14 = CFSTR("com.apple.adprivacyd Attribution Request in Progress");
    v15 = v4;
    v11 = v9;
    objc_msgSend(v10, "addOperationWithBlock:", v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: A completionHandler was not passed in on the attribution request."));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    _ADLog();
  }

}

void __61__ADAttributionRequester_requestAttributionDetailsWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD);
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;

  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __61__ADAttributionRequester_requestAttributionDetailsWithBlock___block_invoke_2;
  v11 = &unk_24D655F70;
  v2 = *(void **)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v2;
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v3 = (void (**)(_QWORD))MEMORY[0x219A03E08](&v8);
  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance", v8, v9, v10, v11, v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "reconcileInProgress");

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Attribution Request made while reconcile is in progress. Postponing."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performOperationAfterReconcile:", v3);

  }
  else
  {
    v3[2](v3);
  }

}

void __61__ADAttributionRequester_requestAttributionDetailsWithBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeDSIDRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "beginAttributionRequest:reason:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No Active DSID Record. Set the DSID for the current user."));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "iTunesAccountDSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __61__ADAttributionRequester_requestAttributionDetailsWithBlock___block_invoke_3;
    v9[3] = &unk_24D655F70;
    v8 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v8;
    v11 = *(id *)(a1 + 48);
    v12 = *(id *)(a1 + 56);
    objc_msgSend(v5, "setDSID:completionHandler:", v7, v9);

  }
}

uint64_t __61__ADAttributionRequester_requestAttributionDetailsWithBlock___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "beginAttributionRequest:reason:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSNumber)transactionToken
{
  return self->_transactionToken;
}

- (void)setTransactionToken:(id)a3
{
  objc_storeStrong((id *)&self->_transactionToken, a3);
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_transactionToken, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
