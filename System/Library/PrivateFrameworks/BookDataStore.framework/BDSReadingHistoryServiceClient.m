@implementation BDSReadingHistoryServiceClient

- (BDSReadingHistoryServiceClient)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BDSReadingHistoryServiceClient *v6;
  uint64_t v7;
  BDSServiceProtocol *serviceProxy;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BDSReadingHistoryServiceClient;
  v6 = -[BDSReadingHistoryServiceClient init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend_sharedServiceProxy(BDSReadingHistoryServiceClient, v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    serviceProxy = v6->_serviceProxy;
    v6->_serviceProxy = (BDSServiceProtocol *)v7;

  }
  return v6;
}

+ (id)sharedServiceProxy
{
  if (qword_253F3C708 != -1)
    dispatch_once(&qword_253F3C708, &unk_24F089F38);
  return (id)qword_253F3C6D8;
}

- (void)handleSyncFileChangeWithSyncVersionInfo:(id)a3 updateInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend_serviceProxy(self, v11, v12, v13, v14);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingHistoryHandleSyncFileChangeWithSyncVersionInfo_updateInfo_completion_(v16, v15, (uint64_t)v10, (uint64_t)v9, (uint64_t)v8);

}

+ (void)clearDefaultsCachedDataWithCompletionHandler:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v3 = a3;
  objc_msgSend_sharedServiceProxy(BDSReadingHistoryServiceClient, v4, v5, v6, v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingHistoryClearDefaultsCachedDataWithCompletion_(v11, v8, (uint64_t)v3, v9, v10);

}

- (void)bookWidgetReadingHistoryStateInfoWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  BDSReadingHistoryStateEstimator *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BDSWidgetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v46) = 0;
    _os_log_impl(&dword_227D4F000, v5, OS_LOG_TYPE_DEFAULT, "BDSReadingHistoryServiceClient bookWidgetReadingHistoryStateInfo reading file.", (uint8_t *)&v46, 2u);
  }

  objc_msgSend_sharedInstance(BDSBookWidgetReadingHistoryDataFile, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_load(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  BDSWidgetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      LOWORD(v46) = 0;
      _os_log_impl(&dword_227D4F000, v16, OS_LOG_TYPE_DEFAULT, "BDSReadingHistoryServiceClient bookWidgetReadingHistoryStateInfo - Compute from saved data", (uint8_t *)&v46, 2u);
    }

    v18 = objc_alloc_init(BDSReadingHistoryStateEstimator);
    objc_msgSend_stateInfo(v15, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_estimateCurrentStateInfoWithExistingStateInfo_(v18, v24, (uint64_t)v23, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    BDSWidgetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v46 = 138412290;
      v47 = v27;
      _os_log_impl(&dword_227D4F000, v28, OS_LOG_TYPE_DEFAULT, "BDSReadingHistoryServiceClient bookWidgetReadingHistoryStateInfo - Return %@", (uint8_t *)&v46, 0xCu);
    }

    if (v27)
    {
      v29 = _Block_copy(v4);
      v30 = v29;
      if (v29)
        (*((void (**)(void *, void *, uint64_t))v29 + 2))(v29, v27, 1);
    }
    else
    {
      BDSWidgetLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        sub_227E5A610(v38);

      objc_msgSend_serviceProxy(self, v39, v40, v41, v42);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bookWidgetReadingHistoryStateInfoWithCompletion_(v30, v43, (uint64_t)v4, v44, v45);
    }

  }
  else
  {
    if (v17)
    {
      LOWORD(v46) = 0;
      _os_log_impl(&dword_227D4F000, v16, OS_LOG_TYPE_DEFAULT, "BDSReadingHistoryServiceClient bookWidgetReadingHistoryStateInfo - Cannot load saved data, fallback to XPC call", (uint8_t *)&v46, 2u);
    }

    objc_msgSend_serviceProxy(self, v31, v32, v33, v34);
    v18 = (BDSReadingHistoryStateEstimator *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bookWidgetReadingHistoryStateInfoWithCompletion_(v18, v35, (uint64_t)v4, v36, v37);
  }

}

- (BDSServiceProtocol)serviceProxy
{
  return self->_serviceProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

@end
