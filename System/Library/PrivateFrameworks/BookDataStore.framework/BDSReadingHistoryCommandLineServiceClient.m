@implementation BDSReadingHistoryCommandLineServiceClient

+ (id)sharedServiceProxy
{
  if (qword_253F3C6F8 != -1)
    dispatch_once(&qword_253F3C6F8, &unk_24F089168);
  return (id)qword_253F3C6C8;
}

- (BDSReadingHistoryCommandLineServiceClient)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BDSReadingHistoryCommandLineServiceClient *v6;
  uint64_t v7;
  BDSServiceProtocol *serviceProxy;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BDSReadingHistoryCommandLineServiceClient;
  v6 = -[BDSReadingHistoryCommandLineServiceClient init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend_sharedServiceProxy(BDSReadingHistoryCommandLineServiceClient, v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    serviceProxy = v6->_serviceProxy;
    v6->_serviceProxy = (BDSServiceProtocol *)v7;

  }
  return v6;
}

- (void)clearDataWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingHistoryClearDataWithCompletion_(v12, v9, (uint64_t)v4, v10, v11);

}

- (void)clearDate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend_serviceProxy(self, v8, v9, v10, v11);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingHistoryClearDate_withCompletion_(v14, v12, (uint64_t)v7, (uint64_t)v6, v13);

}

- (void)clearTodayWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingHistoryClearTodayWithCompletion_(v12, v9, (uint64_t)v4, v10, v11);

}

- (void)incrementWithDate:(id)a3 by:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  id v15;

  v8 = a5;
  v9 = a3;
  objc_msgSend_serviceProxy(self, v10, v11, v12, v13);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingHistoryIncrementWithDate_by_withCompletion_(v15, v14, (uint64_t)v9, a4, (uint64_t)v8);

}

- (void)readingHistoryStateInfoWithRangeStart:(id)a3 rangeEnd:(id)a4 currentTime:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  id v19;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend_serviceProxy(self, v14, v15, v16, v17);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingHistoryReadingHistoryStateInfoWithRangeStart_rangeEnd_currentTime_withCompletion_(v19, v18, (uint64_t)v13, (uint64_t)v12, (uint64_t)v11, v10);

}

- (void)serviceStatusInfoWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingHistoryServiceStatusInfoWithCompletion_(v12, v9, (uint64_t)v4, v10, v11);

}

- (void)backupWithName:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend_serviceProxy(self, v8, v9, v10, v11);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingHistoryBackupWithName_completion_(v14, v12, (uint64_t)v7, (uint64_t)v6, v13);

}

- (void)listBackupWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingHistoryListBackupWithCompletion_(v12, v9, (uint64_t)v4, v10, v11);

}

- (void)restoreWithName:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend_serviceProxy(self, v8, v9, v10, v11);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingHistoryRestoreWithName_completion_(v14, v12, (uint64_t)v7, (uint64_t)v6, v13);

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
