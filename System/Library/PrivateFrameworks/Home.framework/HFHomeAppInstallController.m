@implementation HFHomeAppInstallController

+ (id)sharedInstance
{
  if (_MergedGlobals_263 != -1)
    dispatch_once(&_MergedGlobals_263, &__block_literal_global_2_16);
  return (id)qword_1ED3791A0;
}

void __44__HFHomeAppInstallController_sharedInstance__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ED3791A0;
  qword_1ED3791A0 = v0;

}

- (HFHomeAppInstallController)init
{
  HFHomeAppInstallController *v2;
  void *v3;
  uint64_t v4;
  NSMutableSet *statusUpdaters;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HFHomeAppInstallController;
  v2 = -[HFHomeAppInstallController init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:", v2);

    v4 = objc_opt_new();
    statusUpdaters = v2->_statusUpdaters;
    v2->_statusUpdaters = (NSMutableSet *)v4;

    v2->_lastReportedStatus = -[HFHomeAppInstallController _isHomeAppInstalled](v2, "_isHomeAppInstalled") - 1;
  }
  return v2;
}

- (BOOL)_isHomeAppInstalled
{
  void *v2;
  void *v3;
  char v4;

  -[HFHomeAppInstallController appProxy](self, "appProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInstalled");

  return v4;
}

- (int64_t)status
{
  if (-[HFHomeAppInstallController _isHomeAppInstalled](self, "_isHomeAppInstalled"))
    return 0;
  else
    return -[HFHomeAppInstallController lastReportedStatus](self, "lastReportedStatus");
}

- (id)downloadHomeAppWithUpdateBlock:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id location;

  v4 = a3;
  if (-[HFHomeAppInstallController _isHomeAppInstalled](self, "_isHomeAppInstalled"))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v23 = (void *)v5;
    goto LABEL_8;
  }
  -[HFHomeAppInstallController activeHomeAppDownloadFuture](self, "activeHomeAppDownloadFuture");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[HFHomeAppInstallController activeHomeAppDownloadFuture](self, "activeHomeAppDownloadFuture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isFinished");

    if ((v9 & 1) == 0)
    {
      -[HFHomeAppInstallController statusUpdaters](self, "statusUpdaters");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v4, "copy");
      v26 = _Block_copy(v25);
      objc_msgSend(v24, "na_safeAddObject:", v26);

      -[HFHomeAppInstallController activeHomeAppDownloadFuture](self, "activeHomeAppDownloadFuture");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  -[HFHomeAppInstallController statusUpdaters](self, "statusUpdaters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  -[HFHomeAppInstallController statusUpdaters](self, "statusUpdaters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v4, "copy");
  v13 = _Block_copy(v12);
  objc_msgSend(v11, "na_safeAddObject:", v13);

  v14 = (void *)objc_opt_new();
  -[HFHomeAppInstallController setActiveHomeAppDownloadFuture:](self, "setActiveHomeAppDownloadFuture:", v14);

  v15 = objc_alloc(MEMORY[0x1E0CF9DD8]);
  HFHomeAppBundleID();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithBundleID:", v16);
  -[HFHomeAppInstallController setRequest:](self, "setRequest:", v17);

  -[HFHomeAppInstallController request](self, "request");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setUserInitiated:", 1);

  -[HFHomeAppInstallController _dispatchStatusUpdate:](self, "_dispatchStatusUpdate:", 1);
  objc_initWeak(&location, self);
  -[HFHomeAppInstallController request](self, "request");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __61__HFHomeAppInstallController_downloadHomeAppWithUpdateBlock___block_invoke;
  v30[3] = &unk_1EA727818;
  objc_copyWeak(&v31, &location);
  objc_msgSend(v19, "startWithErrorHandler:", v30);

  -[HFHomeAppInstallController request](self, "request");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObserver:", self);

  -[HFHomeAppInstallController activeHomeAppDownloadFuture](self, "activeHomeAppDownloadFuture");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v20;
  v28[1] = 3221225472;
  v28[2] = __61__HFHomeAppInstallController_downloadHomeAppWithUpdateBlock___block_invoke_3;
  v28[3] = &unk_1EA735210;
  objc_copyWeak(&v29, &location);
  objc_msgSend(v22, "addCompletionBlock:", v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v29);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
LABEL_8:

  return v23;
}

void __61__HFHomeAppInstallController_downloadHomeAppWithUpdateBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (v3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__HFHomeAppInstallController_downloadHomeAppWithUpdateBlock___block_invoke_2;
    v7[3] = &unk_1EA727A48;
    objc_copyWeak(&v9, v4);
    v8 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

    objc_destroyWeak(&v9);
  }
  else
  {
    objc_msgSend(WeakRetained, "_dispatchStatusUpdate:", 2);
  }

}

void __61__HFHomeAppInstallController_downloadHomeAppWithUpdateBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "activeHomeAppDownloadFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithError:", *(_QWORD *)(a1 + 32));

}

void __61__HFHomeAppInstallController_downloadHomeAppWithUpdateBlock___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "_isHomeAppInstalled"))
    objc_msgSend(WeakRetained, "_dispatchStatusUpdate:", 0);
  objc_msgSend(WeakRetained, "_cleanup");

}

- (LSApplicationProxy)appProxy
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CA5860];
  HFHomeAppBundleID();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationProxyForIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (LSApplicationProxy *)v4;
}

- (void)applicationsWillInstall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  -[HFHomeAppInstallController appProxy](self, "appProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HFAppProxiesContainsAppProxyWithIdentifier(v4, v6);

  if (v7)
    -[HFHomeAppInstallController _dispatchStatusUpdate:](self, "_dispatchStatusUpdate:", 3);
}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;

  v4 = a3;
  -[HFHomeAppInstallController appProxy](self, "appProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HFAppProxiesContainsAppProxyWithIdentifier(v4, v6);

  if (v7)
  {
    -[HFHomeAppInstallController activeHomeAppDownloadFuture](self, "activeHomeAppDownloadFuture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__HFHomeAppInstallController_applicationsDidInstall___block_invoke;
    block[3] = &unk_1EA727DD8;
    v11 = v8;
    v9 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __53__HFHomeAppInstallController_applicationsDidInstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

- (void)applicationsDidFailToInstall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;

  v4 = a3;
  -[HFHomeAppInstallController appProxy](self, "appProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HFAppProxiesContainsAppProxyWithIdentifier(v4, v6);

  if (v7)
  {
    -[HFHomeAppInstallController _dispatchStatusUpdate:](self, "_dispatchStatusUpdate:", -1);
    -[HFHomeAppInstallController activeHomeAppDownloadFuture](self, "activeHomeAppDownloadFuture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__HFHomeAppInstallController_applicationsDidFailToInstall___block_invoke;
    block[3] = &unk_1EA727DD8;
    v11 = v8;
    v9 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __59__HFHomeAppInstallController_applicationsDidFailToInstall___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "na_genericError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  -[HFHomeAppInstallController appProxy](self, "appProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HFAppProxiesContainsAppProxyWithIdentifier(v4, v6);

  if (v7)
    -[HFHomeAppInstallController _dispatchStatusUpdate:](self, "_dispatchStatusUpdate:", -1);
}

- (void)request:(id)a3 didCompleteWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  HFHomeAppInstallController *v11;

  v6 = a4;
  v7 = a3;
  -[HFHomeAppInstallController request](self, "request");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__HFHomeAppInstallController_request_didCompleteWithError___block_invoke;
    v9[3] = &unk_1EA727188;
    v10 = v6;
    v11 = self;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
}

void __59__HFHomeAppInstallController_request_didCompleteWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "activeHomeAppDownloadFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    objc_msgSend(v3, "finishWithError:", *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(v3, "finishWithNoResult");

}

- (void)_dispatchStatusUpdate:(int64_t)a3
{
  void (**v4)(_QWORD);
  _QWORD aBlock[4];
  id v6[2];
  id location;

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__HFHomeAppInstallController__dispatchStatusUpdate___block_invoke;
  aBlock[3] = &unk_1EA7352F0;
  objc_copyWeak(v6, &location);
  v6[1] = (id)a3;
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v4[2](v4);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __52__HFHomeAppInstallController__dispatchStatusUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "lastReportedStatus") != *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(WeakRetained, "setLastReportedStatus:");
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    objc_msgSend(WeakRetained, "statusUpdaters", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++) + 16))();
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)_cleanup
{
  void *v3;
  void *v4;

  -[HFHomeAppInstallController setActiveHomeAppDownloadFuture:](self, "setActiveHomeAppDownloadFuture:", 0);
  -[HFHomeAppInstallController request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObserver:", 0);

  -[HFHomeAppInstallController setRequest:](self, "setRequest:", 0);
  -[HFHomeAppInstallController statusUpdaters](self, "statusUpdaters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[HFHomeAppInstallController setLastReportedStatus:](self, "setLastReportedStatus:", -[HFHomeAppInstallController _isHomeAppInstalled](self, "_isHomeAppInstalled") - 1);
}

- (NAFuture)activeHomeAppDownloadFuture
{
  return self->_activeHomeAppDownloadFuture;
}

- (void)setActiveHomeAppDownloadFuture:(id)a3
{
  objc_storeStrong((id *)&self->_activeHomeAppDownloadFuture, a3);
}

- (ASDSystemAppRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (int64_t)lastReportedStatus
{
  return self->_lastReportedStatus;
}

- (void)setLastReportedStatus:(int64_t)a3
{
  self->_lastReportedStatus = a3;
}

- (NSMutableSet)statusUpdaters
{
  return self->_statusUpdaters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusUpdaters, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_activeHomeAppDownloadFuture, 0);
}

@end
