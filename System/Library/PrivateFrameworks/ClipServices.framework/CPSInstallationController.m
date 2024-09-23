@implementation CPSInstallationController

- (CPSInstallationController)initWithAppInfoFetcher:(id)a3
{
  id v5;
  CPSInstallationController *v6;
  CPSInstallationController *v7;
  uint64_t v8;
  NSMutableDictionary *sessionsByBundleID;
  uint64_t v10;
  NSMutableDictionary *installPromisesBySessionID;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  CPSInstallationController *v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CPSInstallationController;
  v6 = -[CPSInstallationController init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_appInfoFetcher, a3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    sessionsByBundleID = v7->_sessionsByBundleID;
    v7->_sessionsByBundleID = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    installPromisesBySessionID = v7->_installPromisesBySessionID;
    v7->_installPromisesBySessionID = (NSMutableDictionary *)v10;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.ClipServices.clipserviced.CPSInstallationController", v12);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v13;

    v15 = v7;
  }

  return v7;
}

- (void)_prewarmDemoIPAWithBundleID:(id)a3 session:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id WeakRetained;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  CPSInstallationController *v20;
  id v21;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  +[CPSSessionManager sharedManager](CPSSessionManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "legacyInstaller");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "installationControllerWillStartInstall:", self);

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __76__CPSInstallationController__prewarmDemoIPAWithBundleID_session_completion___block_invoke;
  v17[3] = &unk_24C3B9680;
  v18 = v12;
  v19 = v8;
  v20 = self;
  v21 = v9;
  v14 = v9;
  v15 = v8;
  v16 = v12;
  objc_msgSend(v16, "downloadAppWithBundleID:completionHandler:", v10, v17);

}

void __76__CPSInstallationController__prewarmDemoIPAWithBundleID_session_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __76__CPSInstallationController__prewarmDemoIPAWithBundleID_session_completion___block_invoke_cold_1();
  }
  else
  {
    v8 = (void *)a1[4];
    v9 = a1[5];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __76__CPSInstallationController__prewarmDemoIPAWithBundleID_session_completion___block_invoke_2;
    v11[3] = &unk_24C3B9658;
    v10 = (void *)a1[7];
    v11[4] = a1[6];
    v12 = v10;
    objc_msgSend(v8, "installAppWithBundleID:session:completionHandler:", v5, v9, v11);

  }
}

void __76__CPSInstallationController__prewarmDemoIPAWithBundleID_session_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  id v10;

  v6 = a2;
  v7 = a4;
  if (v7)
  {
    v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __76__CPSInstallationController__prewarmDemoIPAWithBundleID_session_completion___block_invoke_2_cold_1();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(WeakRetained, "installationControllerDidInstallPlaceholder:", *(_QWORD *)(a1 + 32));

    v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(v10, "installationController:didUpdateProgress:", *(_QWORD *)(a1 + 32), 0.5);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_placeholderArtworkForSession:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v8;
  uint8_t v9[8];
  id v10;

  objc_msgSend(a3, "applicationIconFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_6;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v3, 8, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v5)
  {
    v6 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CPSInstallationController _placeholderArtworkForSession:].cold.1((uint64_t)v5, v6);
    goto LABEL_5;
  }
  if (!v4)
  {
LABEL_5:

LABEL_6:
    v4 = 0;
    goto LABEL_7;
  }
  v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_20AD44000, v8, OS_LOG_TYPE_INFO, "Uses app icon in prox card as the placeholder icon.", v9, 2u);
  }
LABEL_7:

  return v4;
}

- (id)_asdClipRequestWithSession:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BE04528]);
  objc_msgSend(v4, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "amsDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithDictionary:", v7);

  objc_msgSend(v4, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "canPrefetchEncryptionKey"))
    objc_msgSend(v8, "setPrefetchDecryption:", 1);
  -[CPSInstallationController _placeholderArtworkForSession:](self, "_placeholderArtworkForSession:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPlaceholderArtwork:", v10);

  objc_msgSend(v4, "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSourceURL:", v11);

  objc_msgSend(v9, "analyticsReferrerBundleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInstallSourceBundleID:", v12);

  objc_msgSend(v9, "analyticsLaunchReason");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setReferrerType:", v13);

  return v8;
}

- (void)prewarmClipWithBundleID:(id)a3 session:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __72__CPSInstallationController_prewarmClipWithBundleID_session_completion___block_invoke;
  v15[3] = &unk_24C3B96D0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __72__CPSInstallationController_prewarmClipWithBundleID_session_completion___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id WeakRetained;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id *v20;
  id *v21;
  id *v22;
  void (**v23)(id, void *);
  NSObject *v24;
  uint64_t v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  char v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*((id *)a1[4] + 2), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    (*((void (**)(id, _QWORD))a1[7] + 2))(a1[7], 0);
  }
  else
  {
    objc_msgSend(a1[4], "setDelegate:", a1[6]);
    if (+[CPSClipURL usesDemoMetadata](CPSClipURL, "usesDemoMetadata"))
    {
      objc_msgSend(a1[4], "_prewarmDemoIPAWithBundleID:session:completion:", a1[5], a1[6], a1[7]);
    }
    else
    {
      objc_msgSend(a1[6], "metadata");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      if (!objc_msgSend(v3, "hasUpToDateVersionInstalledOnSystemIsPlaceholder:", &v35) || v35)
      {
        objc_msgSend(v3, "amsDictionary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = objc_alloc(MEMORY[0x24BE04538]);
          objc_msgSend(a1[4], "_asdClipRequestWithSession:", a1[6]);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)objc_msgSend(v9, "initWithRequest:", v10);

          objc_msgSend(v11, "setDelegate:", a1[4]);
          WeakRetained = objc_loadWeakRetained((id *)a1[4] + 5);
          objc_msgSend(WeakRetained, "installationControllerWillStartInstall:", a1[4]);

          objc_msgSend(*((id *)a1[4] + 2), "setObject:forKeyedSubscript:", v11, a1[5]);
          v13 = CPS_LOG_CHANNEL_PREFIXClipServices();
          if (os_signpost_enabled(v13))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_20AD44000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PlaceholderInstall", "Start creating placeholder.", buf, 2u);
          }
          v14 = +[CPSUtilities isNetworkConstrained](CPSUtilities, "isNetworkConstrained");
          v15 = CPS_LOG_CHANNEL_PREFIXClipServices();
          v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
          if (v14)
          {
            if (v16)
            {
              v17 = v15;
              v18 = objc_opt_class();
              v19 = a1[5];
              *(_DWORD *)buf = 138543619;
              v37 = v18;
              v38 = 2113;
              v39 = v19;
              _os_log_impl(&dword_20AD44000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Prewarming with placeholder only for %{private}@", buf, 0x16u);

            }
            v31[0] = MEMORY[0x24BDAC760];
            v31[1] = 3221225472;
            v31[2] = __72__CPSInstallationController_prewarmClipWithBundleID_session_completion___block_invoke_11;
            v31[3] = &unk_24C3B96A8;
            v31[4] = a1[4];
            v20 = &v32;
            v32 = a1[6];
            v21 = &v33;
            v33 = a1[5];
            v22 = &v34;
            v34 = a1[7];
            objc_msgSend(v11, "installPlaceholderWithCompletionHandler:", v31);
          }
          else
          {
            if (v16)
            {
              v24 = v15;
              v25 = objc_opt_class();
              v26 = a1[5];
              *(_DWORD *)buf = 138543619;
              v37 = v25;
              v38 = 2113;
              v39 = v26;
              _os_log_impl(&dword_20AD44000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: Prewarming for %{private}@", buf, 0x16u);

            }
            v27[0] = MEMORY[0x24BDAC760];
            v27[1] = 3221225472;
            v27[2] = __72__CPSInstallationController_prewarmClipWithBundleID_session_completion___block_invoke_13;
            v27[3] = &unk_24C3B96A8;
            v27[4] = a1[4];
            v20 = &v28;
            v28 = a1[6];
            v21 = &v29;
            v29 = a1[5];
            v22 = &v30;
            v30 = a1[7];
            objc_msgSend(v11, "startDownloadWithCompletionHandler:", v27);
          }

        }
        else
        {
          v23 = (void (**)(id, void *))a1[7];
          objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:", 4);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v23[2](v23, v11);
        }

      }
      else
      {
        v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          v5 = v4;
          v6 = objc_opt_class();
          v7 = a1[5];
          *(_DWORD *)buf = 138543619;
          v37 = v6;
          v38 = 2113;
          v39 = v7;
          _os_log_impl(&dword_20AD44000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping prewarm since clip is already installed for %{private}@", buf, 0x16u);

        }
        objc_msgSend(a1[4], "_informDelegateDidInstallPlaceholder:", 0);
        (*((void (**)(void))a1[7] + 2))();
      }

    }
  }
}

void __72__CPSInstallationController_prewarmClipWithBundleID_session_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __72__CPSInstallationController_prewarmClipWithBundleID_session_completion___block_invoke_11_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "logID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v10 = 138543875;
    v11 = v7;
    v12 = 2048;
    v13 = v8;
    v14 = 2113;
    v15 = v9;
    _os_log_impl(&dword_20AD44000, v6, OS_LOG_TYPE_INFO, "%{public}@: Completed request for placeholder for session (%p) %{private}@", (uint8_t *)&v10, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __72__CPSInstallationController_prewarmClipWithBundleID_session_completion___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __72__CPSInstallationController_prewarmClipWithBundleID_session_completion___block_invoke_13_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "logID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v10 = 138543875;
    v11 = v7;
    v12 = 2048;
    v13 = v8;
    v14 = 2113;
    v15 = v9;
    _os_log_impl(&dword_20AD44000, v6, OS_LOG_TYPE_INFO, "%{public}@: Started download clip for session (%p) %{private}@", (uint8_t *)&v10, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)installClipWithBundleID:(id)a3 session:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  CPSInstallationController *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke;
  v15[3] = &unk_24C3B9748;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  dispatch_time_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138478083;
    v28 = v3;
    v29 = 2048;
    v30 = v4;
    _os_log_impl(&dword_20AD44000, v2, OS_LOG_TYPE_DEFAULT, "CPSInstallationController: Installing clip with bundleID (%{private}@), session (%p)", buf, 0x16u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 48) + 24);
    objc_msgSend(v5, "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      +[CPSClipURL shouldStallProgress](CPSClipURL, "shouldStallProgress");
    }
    else
    {
      +[CPSPromise promise](CPSPromise, "promise");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(*(_QWORD *)(a1 + 48) + 24);
      objc_msgSend(v6, "uniqueID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, v16);

      if (!+[CPSClipURL shouldStallProgress](CPSClipURL, "shouldStallProgress"))
      {
        objc_msgSend(*(id *)(a1 + 48), "_continueInstallForBundleID:session:completion:", *(_QWORD *)(a1 + 32), v6, *(_QWORD *)(a1 + 56));
        goto LABEL_10;
      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_10:

    goto LABEL_12;
  }
  if (+[CPSClipURL usesDemoMetadata](CPSClipURL, "usesDemoMetadata"))
  {
    +[CPSSessionManager sharedManager](CPSSessionManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "legacyInstaller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stopStallingCurrentInstallation");

    v12 = dispatch_time(0, 300000000);
    v13 = *(_QWORD *)(a1 + 48);
    v14 = *(NSObject **)(v13 + 32);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_16;
    block[3] = &unk_24C3B94A8;
    block[4] = v13;
    dispatch_after(v12, v14, block);
  }
  else
  {
    v17 = *(void **)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "configuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sourceBundleID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_2;
    v22[3] = &unk_24C3B9720;
    v21 = *(void **)(a1 + 56);
    v22[4] = *(_QWORD *)(a1 + 48);
    v25 = v21;
    v23 = *(id *)(a1 + 40);
    v24 = *(id *)(a1 + 32);
    objc_msgSend(v17, "_getClipSessionForBundleID:sourceBundleID:forInstall:completion:", v18, v20, 1, v22);

  }
LABEL_12:

}

void __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_16(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "installationController:didUpdateProgress:", *(_QWORD *)(a1 + 32), 0.9);

  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(v3, "installationController:didFinishWithError:", *(_QWORD *)(a1 + 32), 0);

}

void __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  char v17;

  v5 = a2;
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_3;
  v11[3] = &unk_24C3B96F8;
  v12 = v5;
  v7 = *(id *)(a1 + 56);
  v17 = a3;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v16 = v7;
  v13 = v8;
  v14 = v9;
  v15 = *(id *)(a1 + 48);
  v10 = v5;
  dispatch_async(v6, v11);

}

void __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id *v6;
  id *v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setDelegate:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
    +[CPSPromise promise](CPSPromise, "promise");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    objc_msgSend(*(id *)(a1 + 32), "uniqueID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

    if (+[CPSClipURL shouldStallProgress](CPSClipURL, "shouldStallProgress"))
    {
      v5 = *(void **)(a1 + 32);
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_4;
      v15[3] = &unk_24C3B9228;
      v6 = &v16;
      v16 = *(id *)(a1 + 56);
      v7 = &v17;
      v17 = *(id *)(a1 + 64);
      objc_msgSend(v5, "startDownloadWithCompletionHandler:", v15);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
      objc_msgSend(WeakRetained, "installationControllerWillStartInstall:", *(_QWORD *)(a1 + 40));

      v10 = *(void **)(a1 + 32);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_17;
      v12[3] = &unk_24C3B9228;
      v6 = &v13;
      v13 = *(id *)(a1 + 56);
      v7 = &v14;
      v14 = *(id *)(a1 + 64);
      objc_msgSend(v10, "downloadAndInstallWithCompletionHandler:", v12);
    }

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 64);
    if (*(_BYTE *)(a1 + 72))
    {
      (*(void (**)(_QWORD, _QWORD))(v8 + 16))(*(_QWORD *)(a1 + 64), 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:", 4);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v11);

    }
  }
}

void __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_4_cold_1(a1, v5, v3);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138477827;
    v8 = v6;
    _os_log_impl(&dword_20AD44000, v5, OS_LOG_TYPE_INFO, "ClipSessionManager: startDownload succeeds for bundleID %{private}@", (uint8_t *)&v7, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_17_cold_1(a1, v5, v3);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138477827;
    v8 = v6;
    _os_log_impl(&dword_20AD44000, v5, OS_LOG_TYPE_INFO, "ClipSessionManager: downloadAndInstall succeeds for bundleID %{private}@", (uint8_t *)&v7, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_continueInstallForBundleID:(id)a3 session:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20AD44000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ContinueInstall", "Start continuing install.", buf, 2u);
  }
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __76__CPSInstallationController__continueInstallForBundleID_session_completion___block_invoke;
  v14[3] = &unk_24C3B9770;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v10, "continueInstallWithCompletionHandler:", v14);

}

void __76__CPSInstallationController__continueInstallForBundleID_session_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__CPSInstallationController__continueInstallForBundleID_session_completion___block_invoke_2;
  block[3] = &unk_24C3B9350;
  v8 = v3;
  v9 = v4;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(v5, block);

}

uint64_t __76__CPSInstallationController__continueInstallForBundleID_session_completion___block_invoke_2(_QWORD *a1)
{
  void **v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = (void **)(a1 + 4);
  v3 = a1[4];
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __76__CPSInstallationController__continueInstallForBundleID_session_completion___block_invoke_2_cold_1((uint64_t)a1, v2, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = a1[5];
    v8 = 138477827;
    v9 = v6;
    _os_log_impl(&dword_20AD44000, v5, OS_LOG_TYPE_INFO, "ClipSessionManager: continueInstall succeeds for bundleID %{private}@", (uint8_t *)&v8, 0xCu);
  }
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, void *))(result + 16))(result, *v2);
  return result;
}

- (void)_getClipSessionForBundleID:(id)a3 sourceBundleID:(id)a4 forInstall:(BOOL)a5 completion:(id)a6
{
  id v10;
  CPSAppInfoFetching *appInfoFetcher;
  id v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;

  v10 = a6;
  appInfoFetcher = self->_appInfoFetcher;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __93__CPSInstallationController__getClipSessionForBundleID_sourceBundleID_forInstall_completion___block_invoke;
  v13[3] = &unk_24C3B9798;
  v15 = a5;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  -[CPSAppInfoFetching lookUpClipMetadataByBundleID:sourceBundleID:downloadIconIfNeeded:skipCaching:completionHandler:](appInfoFetcher, "lookUpClipMetadataByBundleID:sourceBundleID:downloadIconIfNeeded:skipCaching:completionHandler:", a3, a4, 0, 0, v13);

}

void __93__CPSInstallationController__getClipSessionForBundleID_sourceBundleID_forInstall_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void (*v7)(void);
  char v8;

  v3 = a2;
  objc_msgSend(v3, "amsDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_9:
    v7();
    goto LABEL_12;
  }
  v8 = 0;
  if (objc_msgSend(v3, "hasUpToDateVersionInstalledOnSystemIsPlaceholder:", &v8)
    && (!*(_BYTE *)(a1 + 48) || !v8))
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_9;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04528]), "initWithDictionary:", v4);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04538]), "initWithRequest:", v5);
    objc_msgSend(v6, "setDelegate:", *(_QWORD *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

LABEL_12:
}

- (void)_cancelClipSessionWithBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__CPSInstallationController__cancelClipSessionWithBundleID_completion___block_invoke;
  block[3] = &unk_24C3B9350;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __71__CPSInstallationController__cancelClipSessionWithBundleID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __71__CPSInstallationController__cancelClipSessionWithBundleID_completion___block_invoke_2;
    v4[3] = &unk_24C3B96A8;
    v4[4] = *(_QWORD *)(a1 + 32);
    v5 = v2;
    v6 = *(id *)(a1 + 40);
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v5, "cancelInstallWithCompletionHandler:", v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __71__CPSInstallationController__cancelClipSessionWithBundleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD block[4];
  id v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __71__CPSInstallationController__cancelClipSessionWithBundleID_completion___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = objc_opt_class();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543875;
    v19 = v7;
    v20 = 2048;
    v21 = v8;
    v22 = 2113;
    v23 = v9;
    _os_log_impl(&dword_20AD44000, v6, OS_LOG_TYPE_INFO, "%{public}@: Successfully canceled session (%p) for %{private}@", buf, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__CPSInstallationController__cancelClipSessionWithBundleID_completion___block_invoke_20;
  block[3] = &unk_24C3B97E8;
  v11 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v15 = v11;
  v16 = v12;
  v17 = v13;
  dispatch_async(v10, block);

}

void __71__CPSInstallationController__cancelClipSessionWithBundleID_completion___block_invoke_20(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;
  id v6;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", *(_QWORD *)(a1 + 32), 1, 0);
  if (objc_msgSend(v2, "isPlaceholder"))
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __71__CPSInstallationController__cancelClipSessionWithBundleID_completion___block_invoke_2_22;
    v4[3] = &unk_24C3B97C0;
    v3 = *(_QWORD *)(a1 + 32);
    v4[4] = *(_QWORD *)(a1 + 40);
    v5 = *(id *)(a1 + 48);
    v6 = *(id *)(a1 + 32);
    +[CPSUtilities uninstallAppWithBundleIdentifier:completion:](CPSUtilities, "uninstallAppWithBundleIdentifier:completion:", v3, v4);

  }
}

void __71__CPSInstallationController__cancelClipSessionWithBundleID_completion___block_invoke_2_22(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __71__CPSInstallationController__cancelClipSessionWithBundleID_completion___block_invoke_2_22_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = objc_opt_class();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = 138543875;
    v11 = v7;
    v12 = 2048;
    v13 = v8;
    v14 = 2113;
    v15 = v9;
    _os_log_impl(&dword_20AD44000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully cleaned up placeholder for session (%p) for %{private}@", (uint8_t *)&v10, 0x20u);

  }
}

- (id)_bundleIDFromSession:(id)a3
{
  id v4;
  NSMutableDictionary *sessionsByBundleID;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  sessionsByBundleID = self->_sessionsByBundleID;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__CPSInstallationController__bundleIDFromSession___block_invoke;
  v9[3] = &unk_24C3B9810;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sessionsByBundleID, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __50__CPSInstallationController__bundleIDFromSession___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  objc_msgSend(a3, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_doneWithSession:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CPSInstallationController *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__CPSInstallationController__doneWithSession_error___block_invoke;
  block[3] = &unk_24C3B97E8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __52__CPSInstallationController__doneWithSession_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_bundleIDFromSession:", *(_QWORD *)(a1 + 32));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setObject:forKeyedSubscript:", 0, v8);
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  objc_msgSend(*(id *)(a1 + 32), "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  objc_msgSend(*(id *)(a1 + 32), "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v6);

  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v4, "finishWithError:");
  else
    objc_msgSend(v4, "finish");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
  objc_msgSend(WeakRetained, "installationController:didFinishWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (BOOL)stopStallingCurrentInstallation
{
  NSMutableDictionary *sessionsByBundleID;
  _QWORD v4[5];

  sessionsByBundleID = self->_sessionsByBundleID;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__CPSInstallationController_stopStallingCurrentInstallation__block_invoke;
  v4[3] = &unk_24C3B9838;
  v4[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sessionsByBundleID, "enumerateKeysAndObjectsUsingBlock:", v4);
  return 1;
}

uint64_t __60__CPSInstallationController_stopStallingCurrentInstallation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_continueInstallForBundleID:session:completion:", a2, a3, 0);
}

- (void)clipSession:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE044A8]))
  {
    v9 = objc_msgSend(v7, "code");

    if (v9 == 907)
    {
      v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        v17 = 138543618;
        v18 = objc_opt_class();
        v19 = 2048;
        v20 = v6;
        _os_log_impl(&dword_20AD44000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Session (%p) User Canceled.", (uint8_t *)&v17, 0x16u);

      }
      objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:", 8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPSInstallationController _doneWithSession:error:](self, "_doneWithSession:error:", v6, v12);

      goto LABEL_10;
    }
  }
  else
  {

  }
  v13 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = v13;
    v15 = objc_opt_class();
    objc_msgSend(v7, "cps_privacyPreservingDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v15;
    v19 = 2048;
    v20 = v6;
    v21 = 2114;
    v22 = v16;
    _os_log_error_impl(&dword_20AD44000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Session (%p) failed: %{public}@", (uint8_t *)&v17, 0x20u);

  }
  -[CPSInstallationController _doneWithSession:error:](self, "_doneWithSession:error:", v6, v7);
LABEL_10:

}

- (void)clipSession:(id)a3 didUpdateProgress:(double)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id WeakRetained;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v10 = 138543874;
    v11 = objc_opt_class();
    v12 = 2048;
    v13 = v6;
    v14 = 2048;
    v15 = a4;
    _os_log_impl(&dword_20AD44000, v8, OS_LOG_TYPE_INFO, "%{public}@: Updated progress for session (%p): %f", (uint8_t *)&v10, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "installationController:didUpdateProgress:", self, a4);

}

- (void)clipSessionDidCompleteSuccessfully:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v8 = 138543618;
    v9 = objc_opt_class();
    v10 = 2048;
    v11 = v4;
    _os_log_impl(&dword_20AD44000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully completed session (%p)", (uint8_t *)&v8, 0x16u);

  }
  -[CPSInstallationController _doneWithSession:error:](self, "_doneWithSession:error:", v4, 0);
  v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_20AD44000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ContinueInstall", "End continuing install enableTelemetry=YES ", (uint8_t *)&v8, 2u);
  }

}

- (void)clipSessionDidInstallPlaceholder:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v8 = 138543618;
    v9 = objc_opt_class();
    v10 = 2048;
    v11 = v4;
    _os_log_impl(&dword_20AD44000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully installed placeholder (%p)", (uint8_t *)&v8, 0x16u);

  }
  -[CPSInstallationController _informDelegateDidInstallPlaceholder:](self, "_informDelegateDidInstallPlaceholder:", v4);
  v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_20AD44000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PlaceholderInstall", "End creating placeholder.", (uint8_t *)&v8, 2u);
  }

}

- (void)_informDelegateDidInstallPlaceholder:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "installationControllerDidInstallPlaceholder:", self);

}

- (CPSInstallationControllerDelegate)delegate
{
  return (CPSInstallationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_installPromisesBySessionID, 0);
  objc_storeStrong((id *)&self->_sessionsByBundleID, 0);
  objc_storeStrong((id *)&self->_appInfoFetcher, 0);
}

void __76__CPSInstallationController__prewarmDemoIPAWithBundleID_session_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1_0(&dword_20AD44000, v0, (uint64_t)v0, "An error occurred when download IPA for %{private}@; error: %@",
    v1);
  OUTLINED_FUNCTION_3_0();
}

void __76__CPSInstallationController__prewarmDemoIPAWithBundleID_session_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1_0(&dword_20AD44000, v0, (uint64_t)v0, "An error occurred when installing IPA for %{private}@; error: %@",
    v1);
  OUTLINED_FUNCTION_3_0();
}

- (void)_placeholderArtworkForSession:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_20AD44000, a2, OS_LOG_TYPE_ERROR, "Fail to read placeholder icon: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3_0();
}

void __72__CPSInstallationController_prewarmClipWithBundleID_session_completion___block_invoke_11_cold_1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0(v3, v4);
  OUTLINED_FUNCTION_5_0();
  objc_msgSend(*(id *)(v1 + 40), "logID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "cps_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_20AD44000, v7, v8, "%{public}@: Failed to install placeholder for session (%p) for %{private}@: %{public}@", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_2_1();
}

void __72__CPSInstallationController_prewarmClipWithBundleID_session_completion___block_invoke_13_cold_1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0(v3, v4);
  OUTLINED_FUNCTION_5_0();
  objc_msgSend(*(id *)(v1 + 40), "logID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "cps_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_20AD44000, v7, v8, "%{public}@: Failed to start download session (%p) for %{private}@: %{public}@", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_2_1();
}

void __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_4_cold_1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v4 = OUTLINED_FUNCTION_11(a1, a2);
  objc_msgSend(a3, "cps_privacyPreservingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_20AD44000, v4, v6, "ClipSessionManager: startDownload failed for bundleID %{private}@ with error: %{public}@", v7);

  OUTLINED_FUNCTION_5();
}

void __72__CPSInstallationController_installClipWithBundleID_session_completion___block_invoke_17_cold_1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v4 = OUTLINED_FUNCTION_11(a1, a2);
  objc_msgSend(a3, "cps_privacyPreservingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_20AD44000, v4, v6, "ClipSessionManager: downloadAndInstall failed for bundleID %{private}@ with error: %{public}@", v7);

  OUTLINED_FUNCTION_5();
}

void __76__CPSInstallationController__continueInstallForBundleID_session_completion___block_invoke_2_cold_1(uint64_t a1, void **a2, void *a3)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = a3;
  objc_msgSend(v3, "cps_privacyPreservingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_20AD44000, v4, v6, "ClipSessionManager: continueInstall failed for bundleID %{private}@ with error: %{public}@", v7);

  OUTLINED_FUNCTION_5();
}

void __71__CPSInstallationController__cancelClipSessionWithBundleID_completion___block_invoke_2_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0(v2, v3);
  OUTLINED_FUNCTION_5_0();
  objc_msgSend(v0, "cps_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_20AD44000, v5, v6, "%{public}@: Failed to cancel session (%p) for %{private}@: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_1();
}

void __71__CPSInstallationController__cancelClipSessionWithBundleID_completion___block_invoke_2_22_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0(v2, v3);
  OUTLINED_FUNCTION_5_0();
  objc_msgSend(v0, "cps_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_20AD44000, v5, v6, "%{public}@: Failed to clean up placeholder for session (%p) for %{private}@: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_1();
}

@end
