@implementation ADAMSBagManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__ADAMSBagManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken_0 != -1)
    dispatch_once(&sharedInstance__onceToken_0, block);
  return (id)sharedInstance__instance_0;
}

- (BOOL)retrieveIsSponsoredAdsEnabledValueFromAMSBag
{
  void *v2;
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  void *v8;
  char v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  +[ADAMSBagManager createBagForSubProfile](ADAMSBagManager, "createBagForSubProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = dispatch_semaphore_create(0);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  objc_msgSend(v2, "BOOLForKey:", CFSTR("isSponsoredAdsEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valuePromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __63__ADAMSBagManager_retrieveIsSponsoredAdsEnabledValueFromAMSBag__block_invoke;
  v14 = &unk_24D710BD8;
  v16 = &v17;
  v6 = v3;
  v15 = v6;
  objc_msgSend(v5, "addFinishBlock:", &v11);
  v7 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get the 'isSponsoredAdsEnabled' key from the bag in time."), v11, v12, v13, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  v9 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v9;
}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "adprivacydBag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)retrieveLatestPersonalizedAdsConsentVersionFromAMSBag
{
  void *v2;
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  void *v8;
  int64_t v9;
  uint64_t v11;
  uint64_t v12;
  intptr_t (*v13)(uint64_t, void *, void *);
  void *v14;
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  +[ADAMSBagManager createBagForSubProfile](ADAMSBagManager, "createBagForSubProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = dispatch_semaphore_create(0);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  objc_msgSend(v2, "integerForKey:", CFSTR("latestPersonalizedAdsConsentVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valuePromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __72__ADAMSBagManager_retrieveLatestPersonalizedAdsConsentVersionFromAMSBag__block_invoke;
  v14 = &unk_24D710BD8;
  v16 = &v17;
  v6 = v3;
  v15 = v6;
  objc_msgSend(v5, "addFinishBlock:", &v11);
  v7 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get the 'latestPersonalizedAdsConsentVersion' key from the bag in time."), v11, v12, v13, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  v9 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __33__ADAMSBagManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance__instance_0;
  sharedInstance__instance_0 = (uint64_t)v0;

}

+ (NSString)bagSubProfile
{
  if (bagSubProfile_ams_once_token___COUNTER__ != -1)
    dispatch_once(&bagSubProfile_ams_once_token___COUNTER__, &__block_literal_global_4);
  return (NSString *)(id)bagSubProfile_ams_once_object___COUNTER__;
}

void __32__ADAMSBagManager_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)bagSubProfile_ams_once_object___COUNTER__;
  bagSubProfile_ams_once_object___COUNTER__ = (uint64_t)CFSTR("adprivacyd");

}

+ (NSString)bagSubProfileVersion
{
  if (bagSubProfileVersion_ams_once_token___COUNTER__ != -1)
    dispatch_once(&bagSubProfileVersion_ams_once_token___COUNTER__, &__block_literal_global_8_0);
  return (NSString *)(id)bagSubProfileVersion_ams_once_object___COUNTER__;
}

void __39__ADAMSBagManager_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)bagSubProfileVersion_ams_once_object___COUNTER__;
  bagSubProfileVersion_ams_once_object___COUNTER__ = (uint64_t)CFSTR("1");

}

- (BOOL)authenticateAccountThroughAMSOperation:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  void *v11;
  BOOL v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v3 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  v25 = 0;
  v4 = (void *)MEMORY[0x219A08150]();
  v5 = objc_alloc_init(MEMORY[0x24BE08020]);
  objc_msgSend(v5, "setAuthenticationType:", 1);
  objc_msgSend(v5, "setAllowServerDialogs:", 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08038]), "initWithAccount:options:", v3, v5);
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  objc_msgSend(v6, "performAuthentication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __58__ADAMSBagManager_authenticateAccountThroughAMSOperation___block_invoke;
  v17 = &unk_24D710BB0;
  v19 = &v20;
  v9 = v7;
  v18 = v9;
  objc_msgSend(v8, "addFinishBlock:", &v14);

  v10 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v9, v10))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[FILE A RADAR] We failed to authenticate in time."), v14, v15, v16, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  objc_autoreleasePoolPop(v4);
  v12 = v21[5] != 0;
  _Block_object_dispose(&v20, 8);

  return v12;
}

void __58__ADAMSBagManager_authenticateAccountThroughAMSOperation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  if (a3)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a3, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Performing the Authentication Returned Error: %@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__ADAMSBagManager_retrieveIsSponsoredAdsEnabledValueFromAMSBag__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a3)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a3, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Unable to get the 'isSponsoredAdsEnabled' status from the bag. Error: %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v8, "BOOLValue");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)retrieveIsSponsoredAdsEnabledValueForAdTrackingdFromAMSBag
{
  void *v2;
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  void *v8;
  char v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  +[ADAMSBagManager createBagForSubProfile](ADAMSBagManager, "createBagForSubProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = dispatch_semaphore_create(0);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  objc_msgSend(v2, "BOOLForKey:", CFSTR("isSponsoredAdsEnabledForAdTrackingd"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valuePromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __77__ADAMSBagManager_retrieveIsSponsoredAdsEnabledValueForAdTrackingdFromAMSBag__block_invoke;
  v14 = &unk_24D710BD8;
  v16 = &v17;
  v6 = v3;
  v15 = v6;
  objc_msgSend(v5, "addFinishBlock:", &v11);
  v7 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get the 'isSponsoredAdsEnabledForAdTrackingd' key from the bag in time."), v11, v12, v13, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  v9 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __77__ADAMSBagManager_retrieveIsSponsoredAdsEnabledValueForAdTrackingdFromAMSBag__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a3)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a3, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Unable to get the 'isSponsoredAdsEnabledForAdTrackingd' status from the bag. Error: %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v8, "BOOLValue");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

intptr_t __72__ADAMSBagManager_retrieveLatestPersonalizedAdsConsentVersionFromAMSBag__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a3, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Unable to get 'latestPersonalizedAdsConsentVersion' from the bag. Error: %@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    v7 = 1;
  }
  else
  {
    v7 = objc_msgSend(a2, "integerValue");
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)retrieveJingleRequestURLFromAMSBagWithPartialityKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  dispatch_semaphore_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  dispatch_time_t v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v3 = a3;
  v4 = v3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  v25 = 0;
  if (v3 && objc_msgSend(v3, "length"))
  {
    +[ADAMSBagManager createBagForSubProfile](ADAMSBagManager, "createBagForSubProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = dispatch_semaphore_create(0);
    v7 = v4;
    objc_msgSend(v5, "URLForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valuePromise");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __71__ADAMSBagManager_retrieveJingleRequestURLFromAMSBagWithPartialityKey___block_invoke;
    v16[3] = &unk_24D710C00;
    v19 = &v20;
    v10 = v7;
    v17 = v10;
    v11 = v6;
    v18 = v11;
    objc_msgSend(v9, "addFinishBlock:", v16);
    v12 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v11, v12))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get the URL key from the bag in time."));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

    }
    v14 = (id)v21[5];

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error: Key for AMS bag lookup is empty. Cannot return a value."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();
    v14 = 0;
  }

  _Block_object_dispose(&v20, 8);
  return v14;
}

void __71__ADAMSBagManager_retrieveJingleRequestURLFromAMSBagWithPartialityKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if (v6 || (v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)) == 0)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Unable to get the '%@' key for Jingle from the bag. Error: %@. Falling back to value in user defaults."), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringForKey:", *(_QWORD *)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12 || !objc_msgSend(v12, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to get Jingle URL for request type '%@' from user defaults. File a radar if you see this message!"), *(_QWORD *)(a1 + 32));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  objc_msgSend(v16, "absoluteString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  if (v19)
  {
    objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "absoluteString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setString:forKey:", v21, *(_QWORD *)(a1 + 32));

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
LABEL_10:

}

@end
