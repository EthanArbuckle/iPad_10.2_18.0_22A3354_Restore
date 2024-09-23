@implementation BDSNBPinningManager

- (BDSNBPinningManager)init
{
  BDSNBPinningManager *v2;
  BDSServiceProxy *v3;
  BDSServiceProxy *serviceProxy;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BDSNBPinningManager;
  v2 = -[BDSNBPinningManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(BDSServiceProxy);
    serviceProxy = v2->_serviceProxy;
    v2->_serviceProxy = v3;

  }
  return v2;
}

- (void)fetchMostRecentAudiobookWithCompletion:(id)a3
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
  objc_msgSend_fetchMostRecentAudiobookWithCompletion_(v12, v9, (uint64_t)v4, v10, v11);

}

- (id)updateWantToReadAndReadingNowWithJaliscoUpdateSuccessful:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;

  v4 = a3;
  v6 = a4;
  objc_msgSend_serviceProxy(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateWantToReadAndReadingNowWithJaliscoUpdateSuccessful_completion_(v11, v12, v4, (uint64_t)v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)updateWantToReadWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateWantToReadWithCompletion_(v9, v10, (uint64_t)v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)updateReadingNowWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateReadingNowWithCompletion_(v9, v10, (uint64_t)v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)updateBitrateForItemWithAdamID:(id)a3 completion:(id)a4
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
  objc_msgSend_updateBitrateForItemWithAdamID_completion_(v14, v12, (uint64_t)v7, (uint64_t)v6, v13);

}

- (void)audiobookStoreEnabledWithCompletion:(id)a3
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
  objc_msgSend_audiobookStoreEnabledWithCompletion_(v12, v9, (uint64_t)v4, v10, v11);

}

- (BDSServiceProxy)serviceProxy
{
  return self->_serviceProxy;
}

- (void)setServiceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

@end
