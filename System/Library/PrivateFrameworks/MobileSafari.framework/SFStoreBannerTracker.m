@implementation SFStoreBannerTracker

void __37__SFStoreBannerTracker_sharedTracker__block_invoke()
{
  SFStoreBannerTracker *v0;
  void *v1;

  v0 = objc_alloc_init(SFStoreBannerTracker);
  v1 = (void *)sharedTracker_sharedTracker;
  sharedTracker_sharedTracker = (uint64_t)v0;

}

+ (id)sharedTracker
{
  if (sharedTracker_once != -1)
    dispatch_once(&sharedTracker_once, &__block_literal_global_21);
  return (id)sharedTracker_sharedTracker;
}

- (id)categoryName
{
  return CFSTR("StoreBannerTracker");
}

- (int64_t)basis
{
  return 1;
}

- (BOOL)shouldBlockForIdentifier:(id)a3 withDismissCount:(unint64_t)a4
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  if (!a4)
    return 0;
  if (a4 != 1)
    return 1;
  v4 = (objc_class *)MEMORY[0x1E0CA5870];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = objc_msgSend(v5, "integerValue");

  v8 = (void *)objc_msgSend(v6, "initWithStoreItemIdentifier:error:", v7, 0);
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "applicationState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isInstalled"))
      v11 = objc_msgSend(v10, "isRestricted");
    else
      v11 = 1;

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)isProductBannerBlocked:(id)a3 forHost:(id)a4 completion:(id)a5
{
  void (**v8)(id, uint64_t);
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = (void (**)(id, uint64_t))a5;
  v9 = (void *)MEMORY[0x1E0C99D68];
  v10 = a4;
  objc_msgSend(v9, "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SFStoreBannerTracker canUpdateProductID:forHost:time:](self, "canUpdateProductID:forHost:time:", v14, v10, v11);

  if (v12)
  {
    objc_msgSend(v14, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSBannerTracker isBannerBlockedForIdentifier:completion:](self, "isBannerBlockedForIdentifier:completion:", v13, v8);

  }
  else
  {
    v8[2](v8, 1);
  }

}

- (void)blockProductBanner:(id)a3
{
  id v4;

  objc_msgSend(a3, "stringValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSBannerTracker blockBannerForIdentifier:](self, "blockBannerForIdentifier:", v4);

}

- (BOOL)canUpdateProductID:(id)a3 forHost:(id)a4 time:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableDictionary *hostToBannerRecordMap;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  SFBannerRecord *v14;
  SFBannerRecord *v15;
  char v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  hostToBannerRecordMap = self->_hostToBannerRecordMap;
  if (!hostToBannerRecordMap)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v13 = self->_hostToBannerRecordMap;
    self->_hostToBannerRecordMap = v12;

    hostToBannerRecordMap = self->_hostToBannerRecordMap;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](hostToBannerRecordMap, "objectForKeyedSubscript:", v9);
  v14 = (SFBannerRecord *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = v14;
    v16 = -[SFBannerRecord updateProductID:time:](v14, "updateProductID:time:", v8, v10);
  }
  else
  {
    v15 = -[SFBannerRecord initWithProductID:time:]([SFBannerRecord alloc], "initWithProductID:time:", v8, v10);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_hostToBannerRecordMap, "setObject:forKeyedSubscript:", v15, v9);
    v16 = 1;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostToBannerRecordMap, 0);
}

@end
