@implementation ASDSubscriptionEntitlements

void __128__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler___block_invoke_4(uint64_t a1, void *a2, char a3, char a4, void *a5)
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  char v19;
  char v20;

  v9 = a2;
  v10 = a5;
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __128__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler___block_invoke_5;
  v15[3] = &unk_1E37BE6F0;
  v12 = *(id *)(a1 + 32);
  v17 = v10;
  v18 = v12;
  v19 = a3;
  v20 = a4;
  v16 = v9;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

void __128__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  NSObject *v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __128__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler___block_invoke_2;
    v18[3] = &unk_1E37BDB60;
    v7 = &v19;
    v19 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v18);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(unsigned __int8 *)(a1 + 56);
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __128__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler___block_invoke_4;
    v16[3] = &unk_1E37BE6A0;
    v10 = &v17;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 48);
    v17 = *(id *)(a1 + 40);
    -[NSObject getSubscriptionEntitlementsForSegment:ignoreCaches:requestingBundleId:withReplyHandler:](v8, "getSubscriptionEntitlementsForSegment:ignoreCaches:requestingBundleId:withReplyHandler:", v12, v9, v11, v16);
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __128__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler___block_invoke_6;
    v13[3] = &unk_1E37BDCC0;
    v7 = &v15;
    v15 = *(id *)(a1 + 40);
    v10 = &v14;
    v14 = v5;
    dispatch_async(v8, v13);
  }

}

uint64_t __100__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_withResultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __128__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 40));
}

void __45__ASDSubscriptionEntitlements_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_28;
  _MergedGlobals_28 = (uint64_t)v1;

}

- (ASDSubscriptionEntitlements)init
{
  void *v3;
  ASDSubscriptionEntitlements *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD handler[4];
  id v27;
  id location[2];

  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ASDSubscriptionEntitlements _initWithServiceBroker:](self, "_initWithServiceBroker:", v3);

  if (v4)
  {
    objc_initWeak(location, v4);
    v4->_newsCacheUpdatedNotificationToken = -1;
    dispatch_get_global_queue(21, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __35__ASDSubscriptionEntitlements_init__block_invoke;
    handler[3] = &unk_1E37BE5E0;
    objc_copyWeak(&v27, location);
    notify_register_dispatch("com.apple.appstored.NewsSubEntitlementsCacheUpdated", &v4->_newsCacheUpdatedNotificationToken, v5, handler);

    v4->_appStoreCacheUpdatedNotificationToken = -1;
    v24[0] = v6;
    v24[1] = 3221225472;
    v24[2] = __35__ASDSubscriptionEntitlements_init__block_invoke_2;
    v24[3] = &unk_1E37BE5E0;
    objc_copyWeak(&v25, location);
    notify_register_dispatch("com.apple.appstored.AppStoreSubEntitlementsCacheUpdated", &v4->_appStoreCacheUpdatedNotificationToken, v5, v24);

    v4->_appStoreArcadeSubscriptionBagUpdatedNotificationToken = -1;
    v22[0] = v6;
    v22[1] = 3221225472;
    v22[2] = __35__ASDSubscriptionEntitlements_init__block_invoke_3;
    v22[3] = &unk_1E37BE5E0;
    objc_copyWeak(&v23, location);
    notify_register_dispatch("com.apple.appstored.ASDArcadeSubscriptionBagUpdatedNotification", &v4->_appStoreArcadeSubscriptionBagUpdatedNotificationToken, v5, v22);

    v4->_appStoreArcadeSubscriptionBagUpdatedNotificationToken = -1;
    v20[0] = v6;
    v20[1] = 3221225472;
    v20[2] = __35__ASDSubscriptionEntitlements_init__block_invoke_4;
    v20[3] = &unk_1E37BE5E0;
    objc_copyWeak(&v21, location);
    notify_register_dispatch("com.apple.appstored.ASDArcadeSubscriptionBagUpdatedNotification", &v4->_appStoreArcadeSubscriptionBagUpdatedNotificationToken, v5, v20);

    v4->_musicCacheUpdatedNotificationToken = -1;
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __35__ASDSubscriptionEntitlements_init__block_invoke_5;
    v18[3] = &unk_1E37BE5E0;
    objc_copyWeak(&v19, location);
    notify_register_dispatch("com.apple.appstored.MusicSubEntitlementsCacheUpdated", &v4->_musicCacheUpdatedNotificationToken, v5, v18);

    v4->_tvCacheUpdatedNotificationToken = -1;
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __35__ASDSubscriptionEntitlements_init__block_invoke_6;
    v16[3] = &unk_1E37BE5E0;
    objc_copyWeak(&v17, location);
    notify_register_dispatch("com.apple.appstored.TVSubEntitlementsCacheUpdated", &v4->_tvCacheUpdatedNotificationToken, v5, v16);

    v4->_iCloudCacheUpdatedNotificationToken = -1;
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __35__ASDSubscriptionEntitlements_init__block_invoke_7;
    v14[3] = &unk_1E37BE5E0;
    objc_copyWeak(&v15, location);
    notify_register_dispatch("com.apple.appstored.iCloudSubEntitlementsCacheUpdated", &v4->_iCloudCacheUpdatedNotificationToken, v5, v14);

    v4->_podcastCacheUpdatedNotificationToken = -1;
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __35__ASDSubscriptionEntitlements_init__block_invoke_8;
    v12[3] = &unk_1E37BE5E0;
    objc_copyWeak(&v13, location);
    notify_register_dispatch("com.apple.appstored.PodcastSubEntitlementsCacheUpdated", &v4->_podcastCacheUpdatedNotificationToken, v5, v12);

    v4->_activityCacheUpdatedNotificationToken = -1;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __35__ASDSubscriptionEntitlements_init__block_invoke_9;
    v10[3] = &unk_1E37BE5E0;
    objc_copyWeak(&v11, location);
    notify_register_dispatch("com.apple.appstored.ActivitySubEntitlementsCacheUpdated", &v4->_activityCacheUpdatedNotificationToken, v5, v10);

    v4->_hwBundleCacheUpdatedNotificationToken = -1;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __35__ASDSubscriptionEntitlements_init__block_invoke_10;
    v8[3] = &unk_1E37BE5E0;
    objc_copyWeak(&v9, location);
    notify_register_dispatch("com.apple.appstored.HWBundleSubEntitlementsCacheUpdated", &v4->_hwBundleCacheUpdatedNotificationToken, v5, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(location);
  }
  return v4;
}

- (id)_initWithServiceBroker:(id)a3
{
  id v5;
  ASDSubscriptionEntitlements *v6;
  ASDSubscriptionEntitlements *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDSubscriptionEntitlements;
  v6 = -[ASDSubscriptionEntitlements init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_serviceBroker, a3);

  return v7;
}

- (void)getSubscriptionEntitlementsForSegment:(unint64_t)a3 ignoreCaches:(BOOL)a4 withResultHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __100__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_withResultHandler___block_invoke;
  v10[3] = &unk_1E37BE6A0;
  v11 = v8;
  v9 = v8;
  -[ASDSubscriptionEntitlements getSubscriptionEntitlementsForSegment:ignoreCaches:withCacheInfoResultHandler:](self, "getSubscriptionEntitlementsForSegment:ignoreCaches:withCacheInfoResultHandler:", a3, v5, v10);

}

- (void)getSubscriptionEntitlementsForSegment:(unint64_t)a3 ignoreCaches:(BOOL)a4 withCacheInfoResultHandler:(id)a5
{
  -[ASDSubscriptionEntitlements getSubscriptionEntitlementsForSegment:ignoreCaches:requestingBundleId:withCacheInfoResultHandler:](self, "getSubscriptionEntitlementsForSegment:ignoreCaches:requestingBundleId:withCacheInfoResultHandler:", a3, a4, 0, a5);
}

- (void)getSubscriptionEntitlementsForSegment:(unint64_t)a3 ignoreCaches:(BOOL)a4 requestingBundleId:(id)a5 withCacheInfoResultHandler:(id)a6
{
  id v10;
  id v11;
  ASDServiceBroker *serviceBroker;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  unint64_t v18;
  BOOL v19;

  v10 = a5;
  v11 = a6;
  serviceBroker = self->_serviceBroker;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __128__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler___block_invoke;
  v15[3] = &unk_1E37BE718;
  v17 = v11;
  v18 = a3;
  v19 = a4;
  v16 = v10;
  v13 = v10;
  v14 = v11;
  -[ASDServiceBroker getIAPHistoryServiceWithCompletionHandler:](serviceBroker, "getIAPHistoryServiceWithCompletionHandler:", v15);

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__ASDSubscriptionEntitlements_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECFFA9F0 != -1)
    dispatch_once(&qword_1ECFFA9F0, block);
  return (id)_MergedGlobals_28;
}

uint64_t __93__ASDSubscriptionEntitlements_getCachedSubscriptionEntitlementsForSegment_withResultHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

uint64_t __87__ASDSubscriptionEntitlements_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

- (void)getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler:(id)a3
{
  id v4;
  ASDServiceBroker *serviceBroker;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  serviceBroker = self->_serviceBroker;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__ASDSubscriptionEntitlements_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler___block_invoke;
  v7[3] = &unk_1E37BE768;
  v8 = v4;
  v6 = v4;
  -[ASDServiceBroker getIAPHistoryServiceWithCompletionHandler:](serviceBroker, "getIAPHistoryServiceWithCompletionHandler:", v7);

}

- (void)getCachedSubscriptionEntitlementsForSegment:(unint64_t)a3 withResultHandler:(id)a4
{
  id v6;
  ASDServiceBroker *serviceBroker;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v6 = a4;
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__ASDSubscriptionEntitlements_getCachedSubscriptionEntitlementsForSegment_withResultHandler___block_invoke;
  v9[3] = &unk_1E37BE740;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  -[ASDServiceBroker getIAPHistoryServiceWithCompletionHandler:](serviceBroker, "getIAPHistoryServiceWithCompletionHandler:", v9);

}

void __87__ASDSubscriptionEntitlements_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  NSObject *v8;
  id *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __87__ASDSubscriptionEntitlements_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler___block_invoke_2;
    v15[3] = &unk_1E37BDB60;
    v7 = &v16;
    v16 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v15);
    v8 = objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __87__ASDSubscriptionEntitlements_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler___block_invoke_4;
    v13[3] = &unk_1E37BE678;
    v9 = &v14;
    v14 = *(id *)(a1 + 32);
    -[NSObject getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler:](v8, "getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler:", v13);
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __87__ASDSubscriptionEntitlements_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler___block_invoke_6;
    v10[3] = &unk_1E37BDCC0;
    v7 = &v12;
    v12 = *(id *)(a1 + 32);
    v9 = &v11;
    v11 = v5;
    dispatch_async(v8, v10);
  }

}

void __93__ASDSubscriptionEntitlements_getCachedSubscriptionEntitlementsForSegment_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  NSObject *v8;
  id *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __93__ASDSubscriptionEntitlements_getCachedSubscriptionEntitlementsForSegment_withResultHandler___block_invoke_2;
    v16[3] = &unk_1E37BDB60;
    v7 = &v17;
    v17 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v16);
    v8 = objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __93__ASDSubscriptionEntitlements_getCachedSubscriptionEntitlementsForSegment_withResultHandler___block_invoke_4;
    v14[3] = &unk_1E37BE678;
    v9 = &v15;
    v10 = *(_QWORD *)(a1 + 40);
    v15 = *(id *)(a1 + 32);
    -[NSObject getCachedSubscriptionEntitlementsForSegment:withReplyHandler:](v8, "getCachedSubscriptionEntitlementsForSegment:withReplyHandler:", v10, v14);
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __93__ASDSubscriptionEntitlements_getCachedSubscriptionEntitlementsForSegment_withResultHandler___block_invoke_6;
    v11[3] = &unk_1E37BDCC0;
    v7 = &v13;
    v13 = *(id *)(a1 + 32);
    v9 = &v12;
    v12 = v5;
    dispatch_async(v8, v11);
  }

}

void __93__ASDSubscriptionEntitlements_getCachedSubscriptionEntitlementsForSegment_withResultHandler___block_invoke_4(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  char v17;

  v7 = a2;
  v8 = a4;
  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__ASDSubscriptionEntitlements_getCachedSubscriptionEntitlementsForSegment_withResultHandler___block_invoke_5;
  v13[3] = &unk_1E37BE360;
  v10 = *(id *)(a1 + 32);
  v15 = v8;
  v16 = v10;
  v17 = a3;
  v14 = v7;
  v11 = v8;
  v12 = v7;
  dispatch_async(v9, v13);

}

void __87__ASDSubscriptionEntitlements_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler___block_invoke_4(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  char v17;

  v7 = a2;
  v8 = a4;
  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __87__ASDSubscriptionEntitlements_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler___block_invoke_5;
  v13[3] = &unk_1E37BE360;
  v10 = *(id *)(a1 + 32);
  v15 = v8;
  v16 = v10;
  v17 = a3;
  v14 = v7;
  v11 = v8;
  v12 = v7;
  dispatch_async(v9, v13);

}

void __35__ASDSubscriptionEntitlements_init__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("ASDSubscriptionEntitlementsDidChangeNotification"), WeakRetained);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ASDSubscriptionEntitlementsNewsDidChangeNotification"), WeakRetained);

}

void __35__ASDSubscriptionEntitlements_init__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("ASDSubscriptionEntitlementsAppStoreDidChangeNotification"), WeakRetained);

}

void __35__ASDSubscriptionEntitlements_init__block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("ASDArcadeSubscriptionBagDidChangeNotification"), WeakRetained);

}

void __35__ASDSubscriptionEntitlements_init__block_invoke_4(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("ASDArcadeSubscriptionBagDidChangeNotification"), WeakRetained);

}

void __35__ASDSubscriptionEntitlements_init__block_invoke_5(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("ASDSubscriptionEntitlementsMusicDidChangeNotification"), WeakRetained);

}

void __35__ASDSubscriptionEntitlements_init__block_invoke_6(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("ASDSubscriptionEntitlementsTVDidChangeNotification"), WeakRetained);

}

void __35__ASDSubscriptionEntitlements_init__block_invoke_7(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("ASDSubscriptionEntitlementsiCloudDidChangeNotification"), WeakRetained);

}

void __35__ASDSubscriptionEntitlements_init__block_invoke_8(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("ASDSubscriptionEntitlementsPodcastDidChangeNotification"), WeakRetained);

}

void __35__ASDSubscriptionEntitlements_init__block_invoke_9(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("ASDSubscriptionEntitlementsActivityDidChangeNotification"), WeakRetained);

}

void __35__ASDSubscriptionEntitlements_init__block_invoke_10(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("ASDSubscriptionEntitlementsHWBundleDidChangeNotification"), WeakRetained);

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_newsCacheUpdatedNotificationToken);
  notify_cancel(self->_appStoreCacheUpdatedNotificationToken);
  notify_cancel(self->_activityCacheUpdatedNotificationToken);
  notify_cancel(self->_musicCacheUpdatedNotificationToken);
  notify_cancel(self->_tvCacheUpdatedNotificationToken);
  notify_cancel(self->_iCloudCacheUpdatedNotificationToken);
  notify_cancel(self->_podcastCacheUpdatedNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)ASDSubscriptionEntitlements;
  -[ASDSubscriptionEntitlements dealloc](&v3, sel_dealloc);
}

- (void)setSubscriptionEntitlementsWithDictionary:(id)a3 forAccountID:(id)a4
{
  id v6;
  id v7;
  ASDServiceBroker *serviceBroker;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serviceBroker = self->_serviceBroker;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__ASDSubscriptionEntitlements_setSubscriptionEntitlementsWithDictionary_forAccountID___block_invoke;
  v11[3] = &unk_1E37BE628;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[ASDServiceBroker getIAPHistoryServiceWithCompletionHandler:](serviceBroker, "getIAPHistoryServiceWithCompletionHandler:", v11);

}

void __86__ASDSubscriptionEntitlements_setSubscriptionEntitlementsWithDictionary_forAccountID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    ASDLogHandleForCategory(12);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = v6;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "Error setting subscription entitlements: %{public}@", (uint8_t *)&v9, 0xCu);
    }

  }
  else if (v5)
  {
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSubscriptionEntitlementsWithDictionary:forAccountID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __86__ASDSubscriptionEntitlements_setSubscriptionEntitlementsWithDictionary_forAccountID___block_invoke_33(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    ASDLogHandleForCategory(12);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_error_impl(&dword_19A03B000, v3, OS_LOG_TYPE_ERROR, "Error getting subscription entitlements remote object proxy: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)setSubscriptionEntitlementsWithDictionary:(id)a3 forAccountID:(id)a4 segment:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  ASDServiceBroker *serviceBroker;
  _QWORD v12[4];
  id v13;
  id v14;
  unint64_t v15;

  v8 = a3;
  v9 = a4;
  if (__IsDaemon)
  {
    -[objc_class sharedInstance](NSClassFromString(CFSTR("SubscriptionEntitlementsCoordinator")), "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCachedSubscriptionEntitlements:forAccountID:segment:", v8, v9, a5);

  }
  else
  {
    serviceBroker = self->_serviceBroker;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __94__ASDSubscriptionEntitlements_setSubscriptionEntitlementsWithDictionary_forAccountID_segment___block_invoke;
    v12[3] = &unk_1E37BE650;
    v13 = v8;
    v14 = v9;
    v15 = a5;
    -[ASDServiceBroker getIAPHistoryServiceWithCompletionHandler:](serviceBroker, "getIAPHistoryServiceWithCompletionHandler:", v12);

  }
}

void __94__ASDSubscriptionEntitlements_setSubscriptionEntitlementsWithDictionary_forAccountID_segment___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    ASDLogHandleForCategory(12);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = v6;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "Error setting subscription entitlements: %{public}@", (uint8_t *)&v9, 0xCu);
    }

  }
  else if (v5)
  {
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_39);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSubscriptionEntitlementsWithDictionary:forAccountID:segment:", a1[4], a1[5], a1[6]);

  }
}

void __94__ASDSubscriptionEntitlements_setSubscriptionEntitlementsWithDictionary_forAccountID_segment___block_invoke_38(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    ASDLogHandleForCategory(12);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_error_impl(&dword_19A03B000, v3, OS_LOG_TYPE_ERROR, "Error getting subscription entitlements remote object proxy: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)getSubscriptionEntitlementsForActiveAccountWithResultHandler:(id)a3
{
  -[ASDSubscriptionEntitlements getSubscriptionEntitlementsIgnoreCaches:forActiveAccountWithResultHandler:](self, "getSubscriptionEntitlementsIgnoreCaches:forActiveAccountWithResultHandler:", 0, a3);
}

- (void)getSubscriptionEntitlementsForActiveAccountWithResultAndExpiryHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __101__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForActiveAccountWithResultAndExpiryHandler___block_invoke;
  v6[3] = &unk_1E37BE678;
  v7 = v4;
  v5 = v4;
  -[ASDSubscriptionEntitlements getSubscriptionEntitlementsIgnoreCaches:forActiveAccountWithResultAndExpiryHandler:]((uint64_t)self, 0, v6);

}

void __101__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForActiveAccountWithResultAndExpiryHandler___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  char v17;

  v7 = a2;
  v8 = a4;
  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __101__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForActiveAccountWithResultAndExpiryHandler___block_invoke_2;
  v13[3] = &unk_1E37BE360;
  v10 = *(id *)(a1 + 32);
  v15 = v8;
  v16 = v10;
  v17 = a3;
  v14 = v7;
  v11 = v8;
  v12 = v7;
  dispatch_async(v9, v13);

}

uint64_t __101__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForActiveAccountWithResultAndExpiryHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

- (void)getSubscriptionEntitlementsIgnoreCaches:(void *)a3 forActiveAccountWithResultAndExpiryHandler:
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  char v10;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    v7 = *(void **)(a1 + 8);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __114__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultAndExpiryHandler___block_invoke;
    v8[3] = &unk_1E37BE6C8;
    v9 = v5;
    v10 = a2;
    objc_msgSend(v7, "getIAPHistoryServiceWithCompletionHandler:", v8);

  }
}

- (void)getSubscriptionEntitlementsIgnoreCaches:(BOOL)a3 forActiveAccountWithResultHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __105__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultHandler___block_invoke;
  v8[3] = &unk_1E37BE678;
  v9 = v6;
  v7 = v6;
  -[ASDSubscriptionEntitlements getSubscriptionEntitlementsIgnoreCaches:forActiveAccountWithResultAndExpiryHandler:]((uint64_t)self, a3, v8);

}

void __105__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v6 = a2;
  v7 = a4;
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultHandler___block_invoke_2;
  block[3] = &unk_1E37BDF10;
  v9 = *(id *)(a1 + 32);
  v14 = v7;
  v15 = v9;
  v13 = v6;
  v10 = v7;
  v11 = v6;
  dispatch_async(v8, block);

}

uint64_t __105__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __114__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultAndExpiryHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  NSObject *v8;
  uint64_t v9;
  id *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __114__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultAndExpiryHandler___block_invoke_2;
    v16[3] = &unk_1E37BDB60;
    v7 = &v17;
    v17 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v16);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(unsigned __int8 *)(a1 + 40);
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __114__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultAndExpiryHandler___block_invoke_4;
    v14[3] = &unk_1E37BE6A0;
    v10 = &v15;
    v15 = *(id *)(a1 + 32);
    -[NSObject getSubscriptionEntitlementsForSegment:ignoreCaches:requestingBundleId:withReplyHandler:](v8, "getSubscriptionEntitlementsForSegment:ignoreCaches:requestingBundleId:withReplyHandler:", 0, v9, 0, v14);
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __114__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultAndExpiryHandler___block_invoke_6;
    v11[3] = &unk_1E37BDCC0;
    v7 = &v13;
    v13 = *(id *)(a1 + 32);
    v10 = &v12;
    v12 = v5;
    dispatch_async(v8, v11);
  }

}

void __114__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultAndExpiryHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __114__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultAndExpiryHandler___block_invoke_3;
  v7[3] = &unk_1E37BDCC0;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __114__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultAndExpiryHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

void __114__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultAndExpiryHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, char a4, void *a5)
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  char v18;

  v8 = a2;
  v9 = a5;
  dispatch_get_global_queue(0, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __114__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultAndExpiryHandler___block_invoke_5;
  v14[3] = &unk_1E37BE360;
  v11 = *(id *)(a1 + 32);
  v16 = v9;
  v17 = v11;
  v18 = a4;
  v15 = v8;
  v12 = v9;
  v13 = v8;
  dispatch_async(v10, v14);

}

uint64_t __114__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultAndExpiryHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

uint64_t __114__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultAndExpiryHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

void __128__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __128__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler___block_invoke_3;
  v7[3] = &unk_1E37BDCC0;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __128__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __128__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, 0, *(_QWORD *)(a1 + 32));
}

void __93__ASDSubscriptionEntitlements_getCachedSubscriptionEntitlementsForSegment_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __93__ASDSubscriptionEntitlements_getCachedSubscriptionEntitlementsForSegment_withResultHandler___block_invoke_3;
  v7[3] = &unk_1E37BDCC0;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __93__ASDSubscriptionEntitlements_getCachedSubscriptionEntitlementsForSegment_withResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __93__ASDSubscriptionEntitlements_getCachedSubscriptionEntitlementsForSegment_withResultHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

void __87__ASDSubscriptionEntitlements_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__ASDSubscriptionEntitlements_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler___block_invoke_3;
  v7[3] = &unk_1E37BDCC0;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __87__ASDSubscriptionEntitlements_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __87__ASDSubscriptionEntitlements_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBroker, 0);
}

@end
