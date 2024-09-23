@implementation CPSAnalyticsLogger

+ (id)sharedLogger
{
  if (sharedLogger_once != -1)
    dispatch_once(&sharedLogger_once, &__block_literal_global_16);
  return (id)sharedLogger_shared;
}

void __34__CPSAnalyticsLogger_sharedLogger__block_invoke()
{
  NSObject *v0;
  CPSAnalyticsLogger *v1;
  void *v2;
  dispatch_queue_t v3;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("com.apple.ClipServices.Analytics", v0);

  v1 = -[CPSAnalyticsLogger initWithQueue:]([CPSAnalyticsLogger alloc], "initWithQueue:", v3);
  v2 = (void *)sharedLogger_shared;
  sharedLogger_shared = (uint64_t)v1;

}

- (CPSAnalyticsLogger)initWithQueue:(id)a3
{
  id v5;
  CPSAnalyticsLogger *v6;
  CPSAnalyticsLogger *v7;
  CPSAnalyticsLogger *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSAnalyticsLogger;
  v6 = -[CPSAnalyticsLogger init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_analyticsSynchronizationQueue, a3);
    v8 = v7;
  }

  return v7;
}

- (void)didDiscoverClip:(id)a3 event:(id)a4 alreadyInstalled:(BOOL)a5
{
  _BOOL8 v5;
  const __CFString *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v5 = a5;
  v15[2] = *MEMORY[0x24BDAC8D0];
  if (a4)
    v8 = (const __CFString *)a4;
  else
    v8 = &stru_24C3BB3D8;
  v14[0] = CFSTR("launchReason");
  v14[1] = CFSTR("alreadyInstalled");
  v15[0] = v8;
  v9 = (void *)MEMORY[0x24BDD16E0];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "numberWithBool:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPSAnalyticsLogger _sendEventLazyWithName:clipBundleIdentifier:payload:](self, "_sendEventLazyWithName:clipBundleIdentifier:payload:", CFSTR("com.apple.ClipServices.DidDiscoverClip"), v11, v13);
}

- (void)didPresentInvocationCardForClip:(id)a3 adamID:(id)a4 sourceBundleIdentifier:(id)a5 referrerBundleIdentifier:(id)a6 event:(id)a7 url:(id)a8 didShowCardInline:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *analyticsSynchronizationQueue;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = +[CPSUtilities deviceIsLocked](CPSUtilities, "deviceIsLocked");
  objc_msgSend(v20, "cps_fallbackBundleIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAnalyticsLogger recordDidActivateCardWithBundleID:launchReason:deviceLocked:didShowCardInline:isOutOfBoxURL:](self, "recordDidActivateCardWithBundleID:launchReason:deviceLocked:didShowCardInline:isOutOfBoxURL:", v15, v19, v21, a9, v22 != 0);

  if (objc_msgSend(v15, "length")
    && objc_msgSend(v16, "intValue")
    && objc_msgSend(v19, "length")
    && (objc_msgSend(v20, "absoluteString"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v24 = objc_msgSend(v23, "length"),
        v23,
        v24))
  {
    analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __137__CPSAnalyticsLogger_didPresentInvocationCardForClip_adamID_sourceBundleIdentifier_referrerBundleIdentifier_event_url_didShowCardInline___block_invoke;
    v27[3] = &unk_24C3BAC08;
    v28 = v15;
    v29 = v16;
    v30 = v18;
    v31 = v17;
    v32 = v19;
    v33 = v20;
    dispatch_async(analyticsSynchronizationQueue, v27);

  }
  else
  {
    v26 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[CPSAnalyticsLogger didPresentInvocationCardForClip:adamID:sourceBundleIdentifier:referrerBundleIdentifier:event:url:didShowCardInline:].cold.1(v26);
  }

}

void __137__CPSAnalyticsLogger_didPresentInvocationCardForClip_adamID_sourceBundleIdentifier_referrerBundleIdentifier_event_url_didShowCardInline___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __CFString *v3;
  __CFString **v4;
  __CFString *v5;
  id v6;
  id v7;

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE04518]), "initWithClipBundleID:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v7, "setItemID:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 48);
  if (!v2)
    v2 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v7, "setReferralSourceBundleID:", v2);
  v3 = (__CFString *)*(id *)(a1 + 64);
  if ((objc_msgSend(*(id *)(a1 + 64), "isEqualToString:", CFSTR("Safari")) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 64), "isEqualToString:", CFSTR("InApp")))
  {
    v4 = CPSSessionLaunchReasonAnalyticsAppReferral;
    if (!*(_QWORD *)(a1 + 48))
      v4 = CPSSessionLaunchReasonAnalyticsWebReferral;
    v5 = *v4;

    v3 = v5;
  }
  objc_msgSend(v7, "setReferrerType:", v3);
  objc_msgSend(v7, "setSourceURL:", *(_QWORD *)(a1 + 72));
  v6 = objc_alloc_init(MEMORY[0x24BE04520]);
  objc_msgSend(v6, "sendClipCardMetricsEvent:completionHandler:", v7, &__block_literal_global_47_0);

}

void __137__CPSAnalyticsLogger_didPresentInvocationCardForClip_adamID_sourceBundleIdentifier_referrerBundleIdentifier_event_url_didShowCardInline___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __137__CPSAnalyticsLogger_didPresentInvocationCardForClip_adamID_sourceBundleIdentifier_referrerBundleIdentifier_event_url_didShowCardInline___block_invoke_2_cold_1(v5, v4);
  }

}

- (void)recordDidInstallWithBundleID:(id)a3 succeeded:(BOOL)a4
{
  NSObject *analyticsSynchronizationQueue;
  _QWORD v5[5];
  BOOL v6;

  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __61__CPSAnalyticsLogger_recordDidInstallWithBundleID_succeeded___block_invoke;
  v5[3] = &unk_24C3BAC30;
  v5[4] = self;
  v6 = a4;
  dispatch_async(analyticsSynchronizationQueue, v5);
}

void __61__CPSAnalyticsLogger_recordDidInstallWithBundleID_succeeded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_51_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(v2, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = *(void **)(a1 + 32);
  v10[0] = CFSTR("success");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("totalClips");
  v11[0] = v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sendEventLazyWithName:clipBundleIdentifier:payload:", CFSTR("com.apple.ClipServices.DidInstallClip"), 0, v9);

}

BOOL __61__CPSAnalyticsLogger_recordDidInstallWithBundleID_succeeded___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "appClipMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)didUseClip:(id)a3 atLatitude:(double)a4 longitude:(double)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("latitude");
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a3;
  objc_msgSend(v8, "numberWithDouble:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("longitude");
  v14[0] = v10;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAnalyticsLogger _sendEventLazyWithName:clipBundleIdentifier:payload:](self, "_sendEventLazyWithName:clipBundleIdentifier:payload:", CFSTR("com.apple.ClipServices.DidUseClipAtLocation"), v9, v12);

}

- (void)didUpgradeToFullAppFromClip:(id)a3
{
  -[CPSAnalyticsLogger _sendEventLazyWithName:clipBundleIdentifier:payload:](self, "_sendEventLazyWithName:clipBundleIdentifier:payload:", CFSTR("com.apple.ClipServices.DidUpgradeToFullAppFromClip"), a3, 0);
}

- (void)didAgeOutClip:(id)a3
{
  -[CPSAnalyticsLogger _sendEventLazyWithName:clipBundleIdentifier:payload:](self, "_sendEventLazyWithName:clipBundleIdentifier:payload:", CFSTR("com.apple.ClipServices.DidAgeOutClip"), a3, 0);
}

- (void)didManuallyDeleteClip:(id)a3 withEvent:(int64_t)a4
{
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("delete specific clip");
  if (a4 != 1)
    v5 = CFSTR("unspecified");
  if (a4 == 2)
    v5 = CFSTR("clear all clips");
  v9 = CFSTR("event");
  v10[0] = v5;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = v5;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPSAnalyticsLogger _sendEventLazyWithName:clipBundleIdentifier:payload:](self, "_sendEventLazyWithName:clipBundleIdentifier:payload:", CFSTR("com.apple.ClipServices.DidManuallyDeleteClip"), 0, v8);
}

- (void)didCancelInterstitialForClip:(id)a3 withEvent:(int64_t)a4 didShowCardInline:(BOOL)a5
{
  _BOOL8 v5;
  const __CFString *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v5 = a5;
  v13[2] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("event");
  if ((unint64_t)(a4 - 1) > 2)
    v7 = CFSTR("unspecified");
  else
    v7 = *(&off_24C3BAC78 + a4 - 1);
  v13[0] = v7;
  v12[1] = CFSTR("didShowCardInline");
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a3;
  objc_msgSend(v8, "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAnalyticsLogger _sendEventLazyWithName:clipBundleIdentifier:payload:](self, "_sendEventLazyWithName:clipBundleIdentifier:payload:", CFSTR("com.apple.ClipServices.DidCancelInterstitial"), v9, v11);

}

- (void)recordClientClipRequestWithBundleID:(id)a3 launchReason:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10 = CFSTR("launchReason");
  v11[0] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPSAnalyticsLogger _sendEventLazyWithName:clipBundleIdentifier:payload:](self, "_sendEventLazyWithName:clipBundleIdentifier:payload:", CFSTR("com.apple.ClipServices.ClientDidRequestClip"), v8, v9);
}

- (void)recordClientMetadataRequestWithBundleID:(id)a3 launchReason:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10 = CFSTR("launchReason");
  v11[0] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPSAnalyticsLogger _sendEventLazyWithName:clipBundleIdentifier:payload:](self, "_sendEventLazyWithName:clipBundleIdentifier:payload:", CFSTR("com.apple.ClipServices.ClientDidRequestMetadata"), v8, v9);
}

- (void)recordDidActivateCardWithBundleID:(id)a3 launchReason:(id)a4 deviceLocked:(BOOL)a5 didShowCardInline:(BOOL)a6 isOutOfBoxURL:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  _QWORD v20[5];

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v20[4] = *MEMORY[0x24BDAC8D0];
  v20[0] = a4;
  v19[0] = CFSTR("launchReason");
  v19[1] = CFSTR("deviceLocked");
  v12 = (void *)MEMORY[0x24BDD16E0];
  v13 = a4;
  v14 = a3;
  objc_msgSend(v12, "numberWithBool:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v15;
  v19[2] = CFSTR("didShowCardInline");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v16;
  v19[3] = CFSTR("isOutOfBoxURL");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPSAnalyticsLogger _sendEventLazyWithName:clipBundleIdentifier:payload:](self, "_sendEventLazyWithName:clipBundleIdentifier:payload:", CFSTR("com.apple.ClipServices.DidActivateCard"), v14, v18);
}

- (void)recordDidTapOpenButtonInCardWithBundleID:(id)a3 metadata:(id)a4 launchReason:(id)a5 launchOptions:(id)a6 didShowCardInline:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  _QWORD v25[5];

  v7 = a7;
  v25[4] = *MEMORY[0x24BDAC8D0];
  v11 = a6;
  v25[0] = a5;
  v24[0] = CFSTR("launchReason");
  v24[1] = CFSTR("locationConfirmation");
  v22 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_msgSend(v12, "clipRequestsLocationConfirmationPermission");
  if (v14)
  {
    objc_msgSend(v11, "locationConfirmationGranted");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  stringForUserDecision(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v16;
  v24[2] = CFSTR("ephemeralNotification");
  v17 = objc_msgSend(v12, "clipRequestsNotificationPermission");

  if (v17)
  {
    objc_msgSend(v11, "userNotificationGranted");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  stringForUserDecision(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v19;
  v24[3] = CFSTR("didShowCardInline");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPSAnalyticsLogger _sendEventLazyWithName:clipBundleIdentifier:payload:](self, "_sendEventLazyWithName:clipBundleIdentifier:payload:", CFSTR("com.apple.ClipServices.DidTapOpenButtonInCard"), v13, v21);
  if (v17)

  if (v14)
}

- (void)recordDidShowErrorWithBundleID:(id)a3 place:(id)a4 errorCode:(int64_t)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("place");
  v13[1] = CFSTR("errorCode");
  v14[0] = a4;
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "numberWithInteger:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPSAnalyticsLogger _sendEventLazyWithName:clipBundleIdentifier:payload:](self, "_sendEventLazyWithName:clipBundleIdentifier:payload:", CFSTR("com.apple.ClipServices.DidShowError"), v10, v12);
}

- (void)recordDidTapAppStoreBannerWithBundleID:(id)a3
{
  -[CPSAnalyticsLogger _sendEventLazyWithName:clipBundleIdentifier:payload:](self, "_sendEventLazyWithName:clipBundleIdentifier:payload:", CFSTR("com.apple.ClipServices.DidTapAppStoreBanner"), a3, 0);
}

- (void)recordDidShowLocationConsentWithBundleID:(id)a3 response:(unint64_t)a4
{
  const __CFString *v5;
  void *v6;
  id v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = CFSTR("locationConfirmationResponse");
  if (a4 - 1 > 2)
    v5 = CFSTR("unknown");
  else
    v5 = *(&off_24C3BAC90 + a4 - 1);
  v10[0] = v5;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSAnalyticsLogger _sendEventLazyWithName:clipBundleIdentifier:payload:](self, "_sendEventLazyWithName:clipBundleIdentifier:payload:", CFSTR("com.apple.ClipServices.DidShowLocationConsent"), v7, v8);

}

- (void)recordDidOpenAppClipWithBundleID:(id)a3 launchReason:(id)a4 didShowCard:(BOOL)a5 didOpenFullApp:(BOOL)a6 didInstallAppClip:(BOOL)a7 isOutOfBoxURL:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  const __CFString *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[6];

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v11 = a5;
  v24[5] = *MEMORY[0x24BDAC8D0];
  v14 = CFSTR("Other");
  if (a4)
    v14 = (const __CFString *)a4;
  v24[0] = v14;
  v23[0] = CFSTR("launchReason");
  v23[1] = CFSTR("showedCard");
  v15 = (void *)MEMORY[0x24BDD16E0];
  v16 = a4;
  v17 = a3;
  objc_msgSend(v15, "numberWithBool:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v18;
  v23[2] = CFSTR("openedFullApp");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v19;
  v23[3] = CFSTR("installedAppClip");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v20;
  v23[4] = CFSTR("isOutOfBoxURL");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPSAnalyticsLogger _sendEventLazyWithName:clipBundleIdentifier:payload:](self, "_sendEventLazyWithName:clipBundleIdentifier:payload:", CFSTR("com.apple.ClipServices.DidOpenAppClip"), v17, v22);
}

- (void)recordReportProblemStepCompletedWithBundleID:(id)a3 problemLabel:(id)a4 event:(int64_t)a5
{
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  if (a4)
    v7 = (const __CFString *)a4;
  else
    v7 = CFSTR("null");
  v13[0] = CFSTR("problemLabel");
  v13[1] = CFSTR("event");
  v14[0] = v7;
  if ((unint64_t)a5 > 5)
    v8 = 0;
  else
    v8 = (uint64_t)*(&off_24C3BACA8 + a5);
  v14[1] = v8;
  v9 = (void *)MEMORY[0x24BDBCE70];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPSAnalyticsLogger _sendEventLazyWithName:clipBundleIdentifier:payload:](self, "_sendEventLazyWithName:clipBundleIdentifier:payload:", CFSTR("com.apple.ClipServices.ReportProblemStepCompleted"), v11, v12);
}

- (void)_sendEventLazyWithName:(id)a3 clipBundleIdentifier:(id)a4 payload:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *analyticsSynchronizationQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__CPSAnalyticsLogger__sendEventLazyWithName_clipBundleIdentifier_payload___block_invoke;
  block[3] = &unk_24C3B97E8;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(analyticsSynchronizationQueue, block);

}

void __74__CPSAnalyticsLogger__sendEventLazyWithName_clipBundleIdentifier_payload___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  AnalyticsSendEventLazy();

}

id __74__CPSAnalyticsLogger__sendEventLazyWithName_clipBundleIdentifier_payload___block_invoke_2(uint64_t a1)
{
  const __CFString *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = CFSTR("null");
  if (*(_QWORD *)(a1 + 32))
    v2 = *(const __CFString **)(a1 + 32);
  v6 = CFSTR("clipBundleIdentifier");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (objc_msgSend(*(id *)(a1 + 40), "count"))
    objc_msgSend(v4, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsSynchronizationQueue, 0);
}

- (void)didPresentInvocationCardForClip:(os_log_t)log adamID:sourceBundleIdentifier:referrerBundleIdentifier:event:url:didShowCardInline:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20AD44000, log, OS_LOG_TYPE_ERROR, "Unable to log app clip card metrics due to invalid parameters", v1, 2u);
}

void __137__CPSAnalyticsLogger_didPresentInvocationCardForClip_adamID_sourceBundleIdentifier_referrerBundleIdentifier_event_url_didShowCardInline___block_invoke_2_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "cps_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_20AD44000, v3, OS_LOG_TYPE_ERROR, "Unable to send app clip card metrics due to error %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
