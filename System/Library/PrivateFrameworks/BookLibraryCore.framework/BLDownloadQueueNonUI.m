@implementation BLDownloadQueueNonUI

- (NSArray)downloads
{
  void *v2;
  void *v3;

  -[BLDownloadQueueNonUI serverProgressObserver](self, "serverProgressObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)reloadFromServerWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  BLDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: Request reload server download queue", v9, 2u);
  }

  if (v4)
    v6 = v4;
  else
    v6 = &unk_24CE8CEF0;
  v7 = (void *)MEMORY[0x2199A44E0](v6);

  -[BLDownloadQueueNonUI serviceProxy](self, "serviceProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadFromServerWithReply:", v7);

}

+ (void)overrideSharedInstance:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v5 = a3;
  if (qword_253DB2078)
  {
    BLDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v6, OS_LOG_TYPE_ERROR, "Attempting to set an overrideInstance when one is already set.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("BLDownloadQueueTooManyInstances"), CFSTR("Attempting to set an overrideInstance when one is already set."));
  }
  objc_storeStrong((id *)&qword_253DB2078, a3);
  objc_msgSend(a1, "innerSharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v5)
  {
    BLDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_ERROR, "You must use the BLDownloadQueue singleton before trying to use the BLDownloadQueueNonUI singleton.", v9, 2u);
    }

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("BLDownloadQueueTooManyInstances"), CFSTR("You must use the BLDownloadQueue singleton before trying to use the BLDownloadQueueNonUI singleton."));
  }

}

- (BLDownloadQueueNonUI)init
{
  BLDownloadQueueNonUI *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BLDownloadQueueNonUI;
  v2 = -[BLDownloadQueueNonUI init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:accountTypes:", v2, 1);

  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BLDownloadQueueNonUI serverProgressObserver](self, "serverProgressObserver");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerObserver:", v4);

}

- (BLDownloadQueueServerProgressObserver)serverProgressObserver
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212CC7EE8;
  block[3] = &unk_24CE8B1F0;
  block[4] = self;
  if (qword_253DB1FD8 != -1)
    dispatch_once(&qword_253DB1FD8, block);
  return (BLDownloadQueueServerProgressObserver *)(id)qword_253DB1FD0;
}

- (BLServiceProxy)serviceProxy
{
  void *v2;
  void *v3;

  -[BLDownloadQueueNonUI serverProgressObserver](self, "serverProgressObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BLServiceProxy *)v3;
}

+ (id)innerSharedInstance
{
  if (qword_253DB2090 != -1)
    dispatch_once(&qword_253DB2090, &unk_24CE8CBB0);
  return (id)qword_253DB2098;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[BLDownloadQueueNonUI serviceProxy](self, "serviceProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shutdown");

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:accountTypes:", self, 1);

  v6.receiver = self;
  v6.super_class = (Class)BLDownloadQueueNonUI;
  -[BLDownloadQueueNonUI dealloc](&v6, sel_dealloc);
}

- (void)_cancelAllPausedDownloads
{
  id v2;

  -[BLDownloadQueueNonUI serverProgressObserver](self, "serverProgressObserver");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAllPausedDownloads");

}

- (void)purchaseWithBuyParameters:(id)a3 storeID:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "numberWithLongLong:", objc_msgSend(a4, "longLongValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLPurchaseRequest requestWithBuyParameters:storeIdentifier:](BLPurchaseRequest, "requestWithBuyParameters:storeIdentifier:", v10, v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[BLDownloadQueueNonUI purchaseWithRequest:completion:](self, "purchaseWithRequest:completion:", v12, v9);
}

- (void)purchaseWithBuyParameters:(id)a3 storeID:(id)a4 isAudiobook:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v6 = a5;
  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = a6;
  v12 = a3;
  objc_msgSend(v10, "numberWithLongLong:", objc_msgSend(a4, "longLongValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLPurchaseRequest requestWithBuyParameters:storeIdentifier:](BLPurchaseRequest, "requestWithBuyParameters:storeIdentifier:", v12, v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setAudiobook:", v6);
  -[BLDownloadQueueNonUI purchaseWithRequest:completion:](self, "purchaseWithRequest:completion:", v14, v11);

}

- (void)purchaseWithBuyParameters:(id)a3 storeID:(id)a4 isAudiobook:(BOOL)a5 userInfo:(id)a6 completion:(id)a7
{
  _BOOL8 v8;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v8 = a5;
  v12 = (void *)MEMORY[0x24BDD16E0];
  v13 = a7;
  v14 = a6;
  v15 = a3;
  objc_msgSend(v12, "numberWithLongLong:", objc_msgSend(a4, "longLongValue"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLPurchaseRequest requestWithBuyParameters:storeIdentifier:](BLPurchaseRequest, "requestWithBuyParameters:storeIdentifier:", v15, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setAudiobook:", v8);
  objc_msgSend(v17, "setAnalyticsInfo:", v14);

  -[BLDownloadQueueNonUI purchaseWithRequest:completion:](self, "purchaseWithRequest:completion:", v17, v13);
}

- (void)_purchaseWithRequest:(id)a3 uiHostProxy:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  BLDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v11, OS_LOG_TYPE_DEBUG, "[DownloadQueue]: purchaseWithBuyParameters:uiManager:", buf, 2u);
  }

  v12 = _os_activity_create(&dword_212C78000, "purchaseWithBuyParameters:uiManager:", MEMORY[0x24BDACB20], OS_ACTIVITY_FLAG_DEFAULT);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_212CC82E8;
  v16[3] = &unk_24CE8CC68;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  os_activity_apply(v12, v16);

}

- (void)purchaseWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  BLUIHostServiceNonUI *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(BLUIHostServiceNonUI);
  -[BLDownloadQueueNonUI _purchaseWithRequest:uiHostProxy:completion:](self, "_purchaseWithRequest:uiHostProxy:completion:", v7, v8, v6);

}

- (void)addDownloadWithPurchaseParameters:(id)a3 storeID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[16];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  BLDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v11, OS_LOG_TYPE_DEBUG, "[DownloadQueue]: addDownloadWithPurchaseParameters", buf, 2u);
  }

  v12 = (void *)MEMORY[0x24BDD16E0];
  v13 = objc_msgSend(v9, "longLongValue");

  objc_msgSend(v12, "numberWithLongLong:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLPurchaseRequest requestWithBuyParameters:storeIdentifier:](BLPurchaseRequest, "requestWithBuyParameters:storeIdentifier:", v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_212CC8D00;
  v17[3] = &unk_24CE8CC90;
  v18 = v8;
  v16 = v8;
  -[BLDownloadQueueNonUI purchaseWithRequest:completion:](self, "purchaseWithRequest:completion:", v15, v17);

}

- (void)addDownloadWithPermlink:(id)a3 title:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  BLDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v11, OS_LOG_TYPE_DEBUG, "[DownloadQueue]: addDownloadWithPermlink", buf, 2u);
  }

  if (v10)
    v12 = v10;
  else
    v12 = &unk_24CE8CCD0;
  v13 = (void *)MEMORY[0x2199A44E0](v12);

  +[BLLibrary defaultBookLibrary](BLLibrary, "defaultBookLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v14, "_bookItemFromPermlink:error:", v8, &v27);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v27;

  if (!v15)
  {
    -[BLDownloadQueueNonUI serviceProxy](self, "serviceProxy");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_212CC8FE0;
    v23[3] = &unk_24CE8CCF8;
    v26 = v13;
    v23[4] = self;
    v24 = v8;
    v25 = v9;
    objc_msgSend(v21, "downloadWithPermlink:title:reply:", v24, v25, v23);

    v19 = v26;
LABEL_12:

    goto LABEL_13;
  }
  +[BLLibrary defaultBookLibrary](BLLibrary, "defaultBookLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v16;
  objc_msgSend(v17, "_addBookItemToEduContainer:error:", v15, &v22);
  v18 = v22;

  if (v18)
  {
    BLDefaultLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "permlink");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v20;
      v30 = 2112;
      v31 = v18;
      _os_log_impl(&dword_212C78000, v19, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: addDownloadWithPermlink: could not add permlink to container %@.  It may already exist. Recevied error:  %@", buf, 0x16u);

    }
    v16 = v18;
    goto LABEL_12;
  }
LABEL_13:

}

- (void)addDownloadWithMetadata:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a4;
  v7 = a3;
  BLDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: addDownloadWithMetadata", v9, 2u);
  }

  -[BLDownloadQueueNonUI _addDownloadWithMetadata:isRestore:completion:](self, "_addDownloadWithMetadata:isRestore:completion:", v7, 0, v6);
}

- (void)addRestoreDownloadWithMetadata:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a4;
  v7 = a3;
  BLDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: addRestoreDownloadWithMetadata", v9, 2u);
  }

  -[BLDownloadQueueNonUI _addDownloadWithMetadata:isRestore:completion:](self, "_addDownloadWithMetadata:isRestore:completion:", v7, 1, v6);
}

- (void)pauseDownloadWithID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v6 = a4;
  v7 = a3;
  BLDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: pauseDownloadWithID", v12, 2u);
  }

  if (v6)
    v9 = v6;
  else
    v9 = &unk_24CE8CD18;
  v10 = (void *)MEMORY[0x2199A44E0](v9);

  -[BLDownloadQueueNonUI serviceProxy](self, "serviceProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pauseDownloadWithID:withReply:", v7, v10);

}

- (void)resumeDownloadWithID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  BLDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: resumeDownloadWithID", buf, 2u);
  }

  if (v7)
    v9 = v7;
  else
    v9 = &unk_24CE8CD38;
  v10 = (void *)MEMORY[0x2199A44E0](v9);

  -[BLDownloadQueueNonUI serviceProxy](self, "serviceProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_212CC96AC;
  v14[3] = &unk_24CE8CD88;
  v15 = v6;
  v16 = v10;
  v14[4] = self;
  v12 = v6;
  v13 = v10;
  objc_msgSend(v11, "resumeDownloadWithID:withReply:", v12, v14);

}

- (void)cancelDownloadWithID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  v6 = a4;
  v7 = a3;
  BLDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: cancelDownloadWithID", v13, 2u);
  }

  if (v6)
    v9 = v6;
  else
    v9 = &unk_24CE8CDA8;
  v10 = (void *)MEMORY[0x2199A44E0](v9);

  -[BLDownloadQueueNonUI serviceProxy](self, "serviceProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cancelDownloadWithID:withReply:", v7, v10);

  -[BLDownloadQueueNonUI serverProgressObserver](self, "serverProgressObserver");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "notifyDidCompleteForDownloadID:", v7);

}

+ (void)cancelAllActiveDownloads
{
  NSObject *v2;
  BLServiceProxy *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  BLDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v2, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: Cancelling all active book downloads.", buf, 2u);
  }

  v10 = 0;
  v3 = -[BLServiceProxy initWithError:]([BLServiceProxy alloc], "initWithError:", &v10);
  v4 = v10;
  if (v4)
  {
    BLDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_ERROR, "[DownloadQueue]: Error encountered creating service proxy: %@", buf, 0xCu);
    }

  }
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_212CC9D70;
  v8[3] = &unk_24CE8CC18;
  v9 = v6;
  v7 = v6;
  -[BLServiceProxy cancelAllActiveDownloadsWithReply:](v3, "cancelAllActiveDownloadsWithReply:", v8);
  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

}

+ (void)prepareForRemoveApp
{
  NSObject *v2;
  BLServiceProxy *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[4];
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  BLDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v2, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: prepareForRemoveApp", buf, 2u);
  }

  v9 = 0;
  v3 = -[BLServiceProxy initWithError:]([BLServiceProxy alloc], "initWithError:", &v9);
  v4 = v9;
  if (v4)
  {
    BLDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_ERROR, "[DownloadQueue]: Error encountered creating service proxy: %@", buf, 0xCu);
    }
  }
  else
  {
    v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = sub_212CC9FE8;
    v7[3] = &unk_24CE8CC18;
    v8 = v6;
    v5 = v6;
    -[BLServiceProxy prepareForRemoveAppWithReply:](v3, "prepareForRemoveAppWithReply:", v7);
    dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  }
}

- (void)addDownloadsWithMetadata:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v6 = a4;
  v7 = a3;
  BLDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: addDownloadsWithMetadata:", v12, 2u);
  }

  if (v6)
    v9 = v6;
  else
    v9 = &unk_24CE8CDE8;
  v10 = (void *)MEMORY[0x2199A44E0](v9);

  -[BLDownloadQueueNonUI serviceProxy](self, "serviceProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestDownloadsWithMetadata:areRestore:reply:", v7, 0, v10);

}

- (void)addRestoreDownloadsWithMetadata:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v6 = a4;
  v7 = a3;
  BLDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: addRestoreDownloadsWithMetadata:", v12, 2u);
  }

  if (v6)
    v9 = v6;
  else
    v9 = &unk_24CE8CE08;
  v10 = (void *)MEMORY[0x2199A44E0](v9);

  -[BLDownloadQueueNonUI serviceProxy](self, "serviceProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestDownloadsWithMetadata:areRestore:reply:", v7, 1, v10);

}

- (void)addDownloadsWithRestoreContentRequestItems:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v6 = a4;
  v7 = a3;
  BLDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_DEBUG, "[DownloadQueue]: addDownloadsWithRestoreContentRequestItems:", v12, 2u);
  }

  if (v6)
    v9 = v6;
  else
    v9 = &unk_24CE8CE28;
  v10 = (void *)MEMORY[0x2199A44E0](v9);

  -[BLDownloadQueueNonUI serviceProxy](self, "serviceProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestDownloadsWithRestoreContentRequestItems:reply:", v7, v10);

}

- (void)addDownloadsWithManifestRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  BLDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: addDownloadsWithManifestRequest:completion: for manifestRequest: %@", buf, 0xCu);
  }

  v9 = _os_activity_create(&dword_212C78000, "addDownloadsWithManifestRequest:completion:", MEMORY[0x24BDACB20], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212CCA460;
  block[3] = &unk_24CE8CE90;
  v13 = v6;
  v14 = v7;
  block[4] = self;
  v10 = v6;
  v11 = v7;
  os_activity_apply(v9, block);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BLDownloadQueueNonUI serverProgressObserver](self, "serverProgressObserver");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (void)addDownloadWithPurchaseParameters:(id)a3 completion:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  BLDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_212C78000, v4, OS_LOG_TYPE_ERROR, "This method is not implemented. Please file a radar.", v5, 2u);
  }

}

- (void)cancelAllActiveDownloadsWithCompletion:(id)a3
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("This method is deprecated and going away. See <rdar://problem/34630469>"));
}

- (void)processAutomaticDownloadsWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  BLDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: processAutomaticDownloadsWithReply", v9, 2u);
  }

  if (v4)
    v6 = v4;
  else
    v6 = &unk_24CE8CEB0;
  v7 = (void *)MEMORY[0x2199A44E0](v6);

  -[BLDownloadQueueNonUI serviceProxy](self, "serviceProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processAutomaticDownloadsWithReply:", v7);

}

- (void)restartDownloadWithID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v6 = a4;
  v7 = a3;
  BLDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: restartDownloadWithID", v12, 2u);
  }

  if (v6)
    v9 = v6;
  else
    v9 = &unk_24CE8CED0;
  v10 = (void *)MEMORY[0x2199A44E0](v9);

  -[BLDownloadQueueNonUI serviceProxy](self, "serviceProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "restartDownloadWithID:withReply:", v7, v10);

}

- (void)_addDownloadWithMetadata:(id)a3 isRestore:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  BLDownloadMetadata *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v5 = a4;
  if (a5)
    v7 = a5;
  else
    v7 = &unk_24CE8CF10;
  v8 = a3;
  v9 = (void *)MEMORY[0x2199A44E0](v7);
  v10 = -[BLDownloadMetadata initWithDictionary:]([BLDownloadMetadata alloc], "initWithDictionary:", v8);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[BLDownloadMetadata itemIdentifier](v10, "itemIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[BLDownloadMetadata collectionIdentifier](v10, "collectionIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata kind](v10, "kind");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLDownloadQueueNonUI serviceProxy](self, "serviceProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_212CCA8D0;
  v19[3] = &unk_24CE8CF38;
  v22 = v13;
  v23 = v9;
  v19[4] = self;
  v20 = v11;
  v21 = v12;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v9;
  objc_msgSend(v14, "requestDownloadWithMetadata:isRestore:reply:", v8, v5, v19);

}

- (id)_stringFromObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!v3)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      BUDynamicCast();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringValue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    BLDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412546;
      v10 = v3;
      v11 = 2112;
      v12 = (id)objc_opt_class();
      v7 = v12;
      _os_log_impl(&dword_212C78000, v6, OS_LOG_TYPE_ERROR, "The object [%@] of class: [%@] could not be converted to neither an NSString nor an NSNumber", (uint8_t *)&v9, 0x16u);

    }
LABEL_9:
    v4 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  BUDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v4;
}

- (id)_numberFromObject:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!v3)
  {
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BLDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = v3;
      v10 = 2112;
      v11 = (id)objc_opt_class();
      v6 = v11;
      _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_ERROR, "The object [%@] of class: [%@] could not be converted to an NSNumber", (uint8_t *)&v8, 0x16u);

    }
    goto LABEL_7;
  }
  objc_opt_class();
  BUDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v4;
}

- (id)_dateFromObject:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!v3)
  {
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BLDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = v3;
      v10 = 2112;
      v11 = (id)objc_opt_class();
      v6 = v11;
      _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_ERROR, "The object [%@] of class: [%@] could not be converted to an NSDate", (uint8_t *)&v8, 0x16u);

    }
    goto LABEL_7;
  }
  objc_opt_class();
  BUDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v4;
}

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  uint8_t v8[16];
  uint64_t v9;
  uint64_t v10;

  if (a4 - 101 <= 1)
  {
    v9 = v4;
    v10 = v5;
    BLServiceLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: Account Changed.  Cancelling paused downloads", v8, 2u);
    }

    -[BLDownloadQueueNonUI _cancelAllPausedDownloads](self, "_cancelAllPausedDownloads");
  }
}

@end
