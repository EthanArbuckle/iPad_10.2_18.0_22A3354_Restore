@implementation BDSReadingGoalsServiceClient

+ (id)sharedServiceProxy
{
  if (qword_253F3C700 != -1)
    dispatch_once(&qword_253F3C700, &unk_24F0892F0);
  return (id)qword_253F3C6D0;
}

- (BDSReadingGoalsServiceClient)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BDSReadingGoalsServiceClient *v6;
  uint64_t v7;
  BDSServiceProtocol *serviceProxy;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)BDSReadingGoalsServiceClient;
  v6 = -[BDSReadingGoalsServiceClient init](&v16, sel_init);
  if (v6)
  {
    objc_msgSend_sharedServiceProxy(BDSReadingGoalsServiceClient, v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    serviceProxy = v6->_serviceProxy;
    v6->_serviceProxy = (BDSServiceProtocol *)v7;

    objc_msgSend_defaultCenter(MEMORY[0x24BDD1530], v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v13, v14, (uint64_t)v6, (uint64_t)sel__handleOnRemoteChange_, (uint64_t)CFSTR("com.apple.BDSService.ReadingGoalsService.onRemoteChange"), 0);

  }
  return v6;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  objc_super v8;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD1530], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v6, v7, (uint64_t)self, (uint64_t)CFSTR("com.apple.BDSService.ReadingGoalsService.onRemoteChange"), 0);

  v8.receiver = self;
  v8.super_class = (Class)BDSReadingGoalsServiceClient;
  -[BDSReadingGoalsServiceClient dealloc](&v8, sel_dealloc);
}

- (void)changeBooksFinishedGoalTo:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;

  v6 = a4;
  objc_msgSend_serviceProxy(self, v7, v8, v9, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingGoalsChangeBooksFinishedGoalTo_withCompletion_(v13, v11, a3, (uint64_t)v6, v12);

}

- (void)changeDailyGoalTo:(double)a3 completionHandler:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v6 = a4;
  objc_msgSend_serviceProxy(self, v7, v8, v9, v10);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingGoalsChangeDailyGoalTo_withCompletion_(v14, v11, (uint64_t)v6, v12, v13, a3);

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
  objc_msgSend_readingGoalsClearDataWithCompletion_(v12, v9, (uint64_t)v4, v10, v11);

}

- (void)stateInfoWithCompletionHandler:(id)a3
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
  objc_msgSend_readingGoalsStateInfoWithCompletion_(v12, v9, (uint64_t)v4, v10, v11);

}

+ (void)clearLocalCachedDataWithCompletionHandler:(id)a3
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
  objc_msgSend_sharedServiceProxy(BDSReadingGoalsServiceClient, v4, v5, v6, v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingGoalsClearLocalCachedDataWithCompletion_(v11, v8, (uint64_t)v3, v9, v10);

}

- (void)_handleOnRemoteChange:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t v11[16];

  BDSServiceLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_227D4F000, v4, OS_LOG_TYPE_DEFAULT, "BDSReadingGoalsServiceClient _handleOnRemoteChange", v11, 2u);
  }

  objc_msgSend_onRemoteChange(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    (*(void (**)(uint64_t))(v9 + 16))(v9);

}

- (id)onRemoteChange
{
  return self->_onRemoteChange;
}

- (void)setOnRemoteChange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BDSServiceProtocol)serviceProxy
{
  return self->_serviceProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong(&self->_onRemoteChange, 0);
}

@end
