@implementation NMSMusicCatalogRecommendationsUpdater

- (NMSMusicCatalogRecommendationsUpdater)init
{
  NMSMusicCatalogRecommendationsUpdater *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NRPairedDeviceRegistry *pairedDeviceRegistry;
  uint64_t v7;
  NMSSubscriptionManager *subscriptionManager;
  uint64_t v9;
  ICPrivacyInfo *privacyInfo;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NMSMusicCatalogRecommendationsUpdater;
  v2 = -[NMSMusicCatalogRecommendationsUpdater init](&v12, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.NanoMusicSync.NMSMusicCatalogRecommendationsUpdater", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    pairedDeviceRegistry = v2->_pairedDeviceRegistry;
    v2->_pairedDeviceRegistry = (NRPairedDeviceRegistry *)v5;

    +[NMSSubscriptionManager sharedManager](NMSSubscriptionManager, "sharedManager");
    v7 = objc_claimAutoreleasedReturnValue();
    subscriptionManager = v2->_subscriptionManager;
    v2->_subscriptionManager = (NMSSubscriptionManager *)v7;

    objc_msgSend(MEMORY[0x24BEC8920], "sharedPrivacyInfo");
    v9 = objc_claimAutoreleasedReturnValue();
    privacyInfo = v2->_privacyInfo;
    v2->_privacyInfo = (ICPrivacyInfo *)v9;

  }
  return v2;
}

- (void)beginAutomaticContentUpdating
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__NMSMusicCatalogRecommendationsUpdater_beginAutomaticContentUpdating__block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __70__NMSMusicCatalogRecommendationsUpdater_beginAutomaticContentUpdating__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__handlePairedDeviceRegistryDeviceDidPairNotification_, *MEMORY[0x24BE6B440], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__handleSubscriptionStatusDidChangeNotification_, CFSTR("NMSSubscriptionStatusDidChangeNotification"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  v6 = *MEMORY[0x24BEC8600];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__NMSMusicCatalogRecommendationsUpdater_beginAutomaticContentUpdating__block_invoke_2;
  v11[3] = &unk_24D648298;
  v11[4] = v4;
  objc_msgSend(v5, "beginObservingPrivacyAcknowledgementForIdentifier:handler:", v6, v11);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  return objc_msgSend(*(id *)(a1 + 32), "_scheduleNextUpdateIfNeeded");
}

uint64_t __70__NMSMusicCatalogRecommendationsUpdater_beginAutomaticContentUpdating__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePrivacyAcknowledgementDidChangeForIdentifier:isPrivacyAcknowledgementRequired:", a2, a3);
}

- (void)endAutomaticContentUpdating
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__NMSMusicCatalogRecommendationsUpdater_endAutomaticContentUpdating__block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(queue, block);
}

void __68__NMSMusicCatalogRecommendationsUpdater_endAutomaticContentUpdating__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BE6B440], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), CFSTR("NMSSubscriptionStatusDidChangeNotification"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "endObservingPrivacyAcknowledgementForIdentifier:withToken:", *MEMORY[0x24BEC8600], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "invalidate");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = 0;

}

- (void)_handlePairedDeviceRegistryDeviceDidPairNotification:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  NMLogForCategory(5);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216E27000, v4, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Received device did pair notification.", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __94__NMSMusicCatalogRecommendationsUpdater__handlePairedDeviceRegistryDeviceDidPairNotification___block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __94__NMSMusicCatalogRecommendationsUpdater__handlePairedDeviceRegistryDeviceDidPairNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleNextUpdateIfNeeded");
}

- (void)_handleSubscriptionStatusDidChangeNotification:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  NMLogForCategory(5);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216E27000, v4, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Received subscription did change notification.", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__NMSMusicCatalogRecommendationsUpdater__handleSubscriptionStatusDidChangeNotification___block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __88__NMSMusicCatalogRecommendationsUpdater__handleSubscriptionStatusDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleNextUpdateIfNeeded");
}

- (void)_handlePrivacyAcknowledgementDidChangeForIdentifier:(id)a3 isPrivacyAcknowledgementRequired:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  id v11;
  __int16 v12;
  _BOOL8 v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  NMLogForCategory(5);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = v6;
    v12 = 2048;
    v13 = v4;
    _os_log_impl(&dword_216E27000, v7, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Received privacy acknowledgement did change for %@, isPrivacyAcknowledgementRequired: %ld.", buf, 0x16u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __126__NMSMusicCatalogRecommendationsUpdater__handlePrivacyAcknowledgementDidChangeForIdentifier_isPrivacyAcknowledgementRequired___block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(queue, block);

}

uint64_t __126__NMSMusicCatalogRecommendationsUpdater__handlePrivacyAcknowledgementDidChangeForIdentifier_isPrivacyAcknowledgementRequired___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleNextUpdateIfNeeded");
}

- (void)_scheduleNextUpdateIfNeeded
{
  NSObject *v3;
  NSBackgroundActivityScheduler *updateScheduler;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  const char *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id buf[2];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_updateScheduler)
  {
    NMLogForCategory(5);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_216E27000, v3, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Invalidating previously scheduled update.", (uint8_t *)buf, 2u);
    }

    -[NSBackgroundActivityScheduler invalidate](self->_updateScheduler, "invalidate");
    updateScheduler = self->_updateScheduler;
    self->_updateScheduler = 0;

  }
  if ((-[NRPairedDeviceRegistry isPaired](self->_pairedDeviceRegistry, "isPaired") & 1) == 0)
  {
    NMLogForCategory(5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      v9 = "[Recommendation] (Music) (Catalog) Device is not paired, won't schedule next update.";
LABEL_15:
      _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)buf, 2u);
    }
LABEL_16:

    objc_msgSend((id)objc_opt_class(), "_clearLastUpdatedDateIfNeeded");
    return;
  }
  if (!-[NMSSubscriptionManager hasCapability:](self->_subscriptionManager, "hasCapability:", 1))
  {
    NMLogForCategory(5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      v9 = "[Recommendation] (Music) (Catalog) Account does not have full catalog playback capability, won't schedule next update.";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  v5 = -[ICPrivacyInfo privacyAcknowledgementRequiredForMusic](self->_privacyInfo, "privacyAcknowledgementRequiredForMusic");
  NMLogForCategory(5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_216E27000, v6, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Privacy acknowledgement is required for Music, won't schedule next update.", (uint8_t *)buf, 2u);
    }

  }
  else
  {
    if (v7)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_216E27000, v6, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Will get bag to determine next update window...", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v10 = objc_alloc(MEMORY[0x24BEC89F8]);
    objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithIdentity:", v11);

    objc_msgSend(MEMORY[0x24BEC8A38], "sharedBagProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __68__NMSMusicCatalogRecommendationsUpdater__scheduleNextUpdateIfNeeded__block_invoke;
    v14[3] = &unk_24D6482C0;
    objc_copyWeak(&v15, buf);
    objc_msgSend(v13, "getBagForRequestContext:withCompletionHandler:", v12, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
  }
}

void __68__NMSMusicCatalogRecommendationsUpdater__scheduleNextUpdateIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject **WeakRetained;
  NSObject **v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    NMLogForCategory(5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __68__NMSMusicCatalogRecommendationsUpdater__scheduleNextUpdateIfNeeded__block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v15 = WeakRetained;
  if (WeakRetained)
  {
    v16 = WeakRetained[1];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __68__NMSMusicCatalogRecommendationsUpdater__scheduleNextUpdateIfNeeded__block_invoke_20;
    v17[3] = &unk_24D647838;
    v17[4] = WeakRetained;
    v18 = v5;
    dispatch_async(v16, v17);

  }
}

uint64_t __68__NMSMusicCatalogRecommendationsUpdater__scheduleNextUpdateIfNeeded__block_invoke_20(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleNextUpdateWithBag:", *(_QWORD *)(a1 + 40));
}

- (void)_scheduleNextUpdateWithBag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  _BOOL4 v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  unint64_t retryAttempt;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t v32;
  NSBackgroundActivityScheduler *v33;
  NSBackgroundActivityScheduler *updateScheduler;
  NSBackgroundActivityScheduler *v35;
  _QWORD v36[4];
  NSBackgroundActivityScheduler *v37;
  id v38;
  __int128 v39;
  uint64_t v40;
  _BYTE buf[24];
  double v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1470]), "initWithIdentifier:", CFSTR("com.apple.NanoMusicSync.NMSMusicCatalogRecommendationsUpdater"));
  v39 = 0uLL;
  v40 = 0;
  v6 = (void *)objc_opt_class();
  if (v6)
  {
    objc_msgSend(v6, "_configurationWithBag:", v4);
  }
  else
  {
    v39 = 0uLL;
    v40 = 0;
  }
  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "catalogRecommendationsLastUpdateDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)objc_opt_class();
    *(_OWORD *)buf = v39;
    *(_QWORD *)&buf[16] = v40;
    objc_msgSend(v9, "_nextUpdateDelayAfterDate:configuration:", v8, buf);
    v11 = v10;
    v12 = v10 > 0.0;
    NMLogForCategory(5);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v8;
        _os_log_impl(&dword_216E27000, v13, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Last updated date is %@, will schedule next update for later.", buf, 0xCu);
      }

      objc_msgSend(v5, "setInterval:", (double)(86400 * v39));
      objc_msgSend(v5, "setDelay:", v11);
      objc_msgSend(v5, "setTolerance:", 1800.0);
    }
    else
    {
      if (v14)
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v8;
        _os_log_impl(&dword_216E27000, v13, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Last updated date is %@, will schedule next update for now.", buf, 0xCu);
      }

    }
  }
  else
  {
    NMLogForCategory(5);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216E27000, v15, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Last updated date not found, will schedule next update for now at a higher priority.", buf, 2u);
    }

    objc_msgSend(v5, "setQualityOfService:", 17);
  }
  if (self->_retryAttempt)
  {
    NMLogForCategory(5);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      retryAttempt = self->_retryAttempt;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = retryAttempt;
      _os_log_impl(&dword_216E27000, v16, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Will schedule retry attempt: %lu.", buf, 0xCu);
    }

    v18 = self->_retryAttempt;
    v19 = objc_msgSend(&unk_24D6558D8, "count");
    if (v18 >= v19)
      v20 = v19;
    else
      v20 = v18;
    objc_msgSend(&unk_24D6558C0, "objectAtIndexedSubscript:", v20 - 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v22;
    objc_msgSend(v5, "delay");
    objc_msgSend(v5, "setDelay:", v24 + v23 * 60.0);

    objc_msgSend(v5, "setInterval:", (double)(86400 * v39));
    objc_msgSend(v5, "setTolerance:", 60.0);
  }
  NMLogForCategory(5);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v5, "delay");
    objc_msgSend(v26, "dateWithTimeIntervalSinceNow:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delay");
    v29 = v28;
    objc_msgSend(v5, "tolerance");
    v31 = v30;
    objc_msgSend(v5, "interval");
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v27;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v29;
    *(_WORD *)&buf[22] = 2048;
    v42 = v31 / 60.0;
    v43 = 2048;
    v44 = v32;
    _os_log_impl(&dword_216E27000, v25, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Scheduling next update for %@ (in %f seconds) +/-%f minutes, interval: %f.", buf, 0x2Au);

  }
  objc_initWeak((id *)buf, self);
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __68__NMSMusicCatalogRecommendationsUpdater__scheduleNextUpdateWithBag___block_invoke;
  v36[3] = &unk_24D6482E8;
  objc_copyWeak(&v38, (id *)buf);
  v33 = v5;
  v37 = v33;
  -[NSBackgroundActivityScheduler scheduleWithBlock:](v33, "scheduleWithBlock:", v36);
  updateScheduler = self->_updateScheduler;
  self->_updateScheduler = v33;
  v35 = v33;

  objc_destroyWeak(&v38);
  objc_destroyWeak((id *)buf);

}

void __68__NMSMusicCatalogRecommendationsUpdater__scheduleNextUpdateWithBag___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[1];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68__NMSMusicCatalogRecommendationsUpdater__scheduleNextUpdateWithBag___block_invoke_2;
    block[3] = &unk_24D647098;
    block[4] = WeakRetained;
    v8 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v6, block);

  }
  else
  {
    (*((void (**)(id, uint64_t))v3 + 2))(v3, 1);
  }

}

uint64_t __68__NMSMusicCatalogRecommendationsUpdater__scheduleNextUpdateWithBag___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performNextUpdateWithScheduler:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ ($76119E9FC4E615FCD2412858B276E5B9)_configurationWithBag:(SEL)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  NSUInteger v11;
  int v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSUInteger v26;
  int v27;
  int v28;
  void *v29;
  NSObject *v30;
  $76119E9FC4E615FCD2412858B276E5B9 *result;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = v5;
  *(_OWORD *)&retstr->var0 = xmmword_216E746F0;
  retstr->var1.length = 235;
  if (v5)
  {
    objc_msgSend(v5, "numberForBagKey:", CFSTR("forYouFetchMinutesStart"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberForBagKey:", CFSTR("forYouFetchMinutesEnd"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NMLogForCategory(5);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v32 = 138412546;
      v33 = v7;
      v34 = 2112;
      v35 = v8;
      _os_log_impl(&dword_216E27000, v9, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Next update window from bag is: %@ - %@", (uint8_t *)&v32, 0x16u);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (objc_msgSend(v7, "intValue") & 0x80000000) == 0
      && (int)objc_msgSend(v8, "intValue") <= 1439
      && (v10 = objc_msgSend(v8, "intValue"), v10 > (int)objc_msgSend(v7, "intValue")))
    {
      v11 = (int)objc_msgSend(v7, "intValue");
      v12 = objc_msgSend(v8, "intValue");
      v13 = objc_msgSend(v7, "intValue");
      retstr->var1.location = v11;
      retstr->var1.length = v12 - v13;
    }
    else
    {
      NMLogForCategory(5);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[NMSMusicCatalogRecommendationsUpdater _configurationWithBag:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

    }
  }
  v22 = (void *)CFPreferencesCopyAppValue(CFSTR("debugForYouFetchConfigEnabled"), CFSTR("com.apple.NanoMusicSync"));
  if (objc_msgSend(v22, "BOOLValue"))
  {
    v23 = (void *)CFPreferencesCopyAppValue(CFSTR("debugForYouFetchMinutesStart"), CFSTR("com.apple.NanoMusicSync"));
    v24 = (void *)CFPreferencesCopyAppValue(CFSTR("debugForYouFetchMinutesEnd"), CFSTR("com.apple.NanoMusicSync"));
    NMLogForCategory(5);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v32 = 138412546;
      v33 = v23;
      v34 = 2112;
      v35 = v24;
      _os_log_impl(&dword_216E27000, v25, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) (DebugOverrides) Update window from defaults is: %@ - %@", (uint8_t *)&v32, 0x16u);
    }

    v26 = (int)objc_msgSend(v23, "intValue");
    v27 = objc_msgSend(v24, "intValue");
    v28 = objc_msgSend(v23, "intValue");
    retstr->var1.location = v26;
    retstr->var1.length = v27 - v28;
    v29 = (void *)CFPreferencesCopyAppValue(CFSTR("debugForYouFetchDaysFrequency"), CFSTR("com.apple.NanoMusicSync"));
    if (v29)
    {
      NMLogForCategory(5);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v32 = 138412290;
        v33 = v29;
        _os_log_impl(&dword_216E27000, v30, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) (DebugOverrides) Update interval from defaults is: %@ days.", (uint8_t *)&v32, 0xCu);
      }

      retstr->var0 = objc_msgSend(v29, "integerValue");
    }

  }
  return result;
}

+ (double)_nextUpdateDelayAfterDate:(id)a3 configuration:(id *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSUInteger location;
  int64_t v12;
  void *v13;
  double v14;
  double v15;

  v5 = (objc_class *)MEMORY[0x24BDBCE68];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setDay:", a4->var0);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingComponents:toDate:options:", v7, v6, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "components:fromDate:", 2097180, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  location = a4->var1.location;
  v12 = location + arc4random_uniform(a4->var1.length);
  objc_msgSend(v10, "setHour:", v12 / 60);
  objc_msgSend(v10, "setMinute:", v12 % 60);
  objc_msgSend(v8, "dateFromComponents:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceNow");
  v15 = v14;

  return v15;
}

- (BOOL)_needsInitialContentUpdate
{
  void *v2;
  void *v3;
  BOOL v4;

  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "catalogRecommendationsLastUpdateDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (void)_performNextUpdateWithScheduler:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  BOOL v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(id, uint64_t);
  id v19;
  id buf[2];

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((-[NRPairedDeviceRegistry isPaired](self->_pairedDeviceRegistry, "isPaired") & 1) == 0)
  {
    NMLogForCategory(5);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      v15 = "[Recommendation] (Music) (Catalog) Device is not paired, won't perform next update.";
LABEL_10:
      _os_log_impl(&dword_216E27000, v9, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)buf, 2u);
    }
LABEL_11:

    objc_msgSend((id)objc_opt_class(), "_clearLastUpdatedDateIfNeeded");
    v7[2](v7, 1);
    goto LABEL_12;
  }
  v8 = -[NMSSubscriptionManager hasCapability:](self->_subscriptionManager, "hasCapability:", 1);
  NMLogForCategory(5);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v10)
    {
      LOWORD(buf[0]) = 0;
      v15 = "[Recommendation] (Music) (Catalog) Account does not have full catalog playback capability, won't perform next update.";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v10)
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_216E27000, v9, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Will get bag to determine current staleness period...", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v11 = objc_alloc(MEMORY[0x24BEC89F8]);
  objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithIdentity:", v12);

  objc_msgSend(MEMORY[0x24BEC8A38], "sharedBagProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __91__NMSMusicCatalogRecommendationsUpdater__performNextUpdateWithScheduler_completionHandler___block_invoke;
  v16[3] = &unk_24D648310;
  objc_copyWeak(&v19, buf);
  v17 = v6;
  v18 = v7;
  objc_msgSend(v14, "getBagForRequestContext:withCompletionHandler:", v13, v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(buf);
LABEL_12:

}

void __91__NMSMusicCatalogRecommendationsUpdater__performNextUpdateWithScheduler_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject **WeakRetained;
  NSObject **v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    NMLogForCategory(5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __91__NMSMusicCatalogRecommendationsUpdater__performNextUpdateWithScheduler_completionHandler___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  v15 = WeakRetained;
  if (WeakRetained)
  {
    v16 = WeakRetained[1];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __91__NMSMusicCatalogRecommendationsUpdater__performNextUpdateWithScheduler_completionHandler___block_invoke_49;
    v17[3] = &unk_24D647D40;
    v17[4] = WeakRetained;
    v18 = a1[4];
    v19 = v5;
    v20 = a1[5];
    dispatch_async(v16, v17);

  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }

}

uint64_t __91__NMSMusicCatalogRecommendationsUpdater__performNextUpdateWithScheduler_completionHandler___block_invoke_49(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performNextUpdateWithScheduler:urlBag:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_performNextUpdateWithScheduler:(id)a3 urlBag:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  NSObject *v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  double v16;
  NMSAppActivityStatus *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  NMSMusicRecommendationsRequest *v20;
  _QWORD v21[4];
  void (**v22)(id, uint64_t);
  id v23;
  uint8_t buf[4];
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v8, "shouldDefer"))
  {
    NMLogForCategory(5);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216E27000, v11, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Background task asked to defer, won't perform next update.", buf, 2u);
    }

    v10[2](v10, 2);
    goto LABEL_16;
  }
  objc_msgSend((id)objc_opt_class(), "_stalenessIntervalWithBag:", v9);
  if (v12 < 0.0)
  {
    NMLogForCategory(5);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216E27000, v13, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Bag indicates to never fetch, won't perform next update.", buf, 2u);
    }
LABEL_8:

    v10[2](v10, 1);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCatalogRecommendationsLastUpdateDate:", v14);

    -[NMSMusicCatalogRecommendationsUpdater _scheduleNextUpdateIfNeeded](self, "_scheduleNextUpdateIfNeeded");
    goto LABEL_16;
  }
  v16 = v12;
  v17 = -[NMSAppActivityStatus initWithBundleID:]([NMSAppActivityStatus alloc], "initWithBundleID:", CFSTR("com.apple.NanoMusic"));
  v18 = -[NMSAppActivityStatus isAppContentDormantWithInterval:](v17, "isAppContentDormantWithInterval:", v16);

  NMLogForCategory(5);
  v13 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v19)
    {
      *(_DWORD *)buf = 134217984;
      v25 = v16;
      _os_log_impl(&dword_216E27000, v13, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) App is considered content dormant for staleness interval: %f, won't perform next update.", buf, 0xCu);
    }
    goto LABEL_8;
  }
  if (v19)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216E27000, v13, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Performing catalog recommendations request...", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  v20 = objc_alloc_init(NMSMusicRecommendationsRequest);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __98__NMSMusicCatalogRecommendationsUpdater__performNextUpdateWithScheduler_urlBag_completionHandler___block_invoke;
  v21[3] = &unk_24D648338;
  objc_copyWeak(&v23, (id *)buf);
  v22 = v10;
  -[NMSMusicRecommendationsRequest performWithResponseHandler:](v20, "performWithResponseHandler:", v21);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
LABEL_16:

}

void __98__NMSMusicCatalogRecommendationsUpdater__performNextUpdateWithScheduler_urlBag_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject **WeakRetained;
  NSObject **v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  NSObject **v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  NMLogForCategory(5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __98__NMSMusicCatalogRecommendationsUpdater__performNextUpdateWithScheduler_urlBag_completionHandler___block_invoke_cold_1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v5;
    _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Finished performing catalog recommendations request: %@", buf, 0xCu);
  }

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v16 = WeakRetained;
  if (WeakRetained)
  {
    v17 = WeakRetained[1];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __98__NMSMusicCatalogRecommendationsUpdater__performNextUpdateWithScheduler_urlBag_completionHandler___block_invoke_54;
    v18[3] = &unk_24D647D40;
    v19 = v6;
    v20 = v16;
    v21 = v5;
    v22 = *(id *)(a1 + 32);
    dispatch_async(v17, v18);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __98__NMSMusicCatalogRecommendationsUpdater__performNextUpdateWithScheduler_urlBag_completionHandler___block_invoke_54(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  if (!*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64);
    if (v2)
      (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 48));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v3 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    ++*(_QWORD *)(v3 + 56);
  }
  else
  {
    *(_QWORD *)(v3 + 56) = 0;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCatalogRecommendationsLastUpdateDate:", v4);

  }
  return objc_msgSend(*(id *)(a1 + 40), "_scheduleNextUpdateIfNeeded");
}

+ (double)_stalenessIntervalWithBag:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  double v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "numberForBagKey:", CFSTR("forYouFetchDaysTillStale"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NMLogForCategory(5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412290;
      v24 = v5;
      _os_log_impl(&dword_216E27000, v6, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Update staleness period from bag is: %@ days", (uint8_t *)&v23, 0xCu);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "doubleValue");
      v8 = v7 * 24.0 * 60.0 * 60.0;
    }
    else
    {
      NMLogForCategory(5);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[NMSMusicCatalogRecommendationsUpdater _stalenessIntervalWithBag:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

      v8 = 1209600.0;
    }

  }
  else
  {
    v8 = 1209600.0;
  }
  v17 = (void *)CFPreferencesCopyAppValue(CFSTR("debugForYouFetchConfigEnabled"), CFSTR("com.apple.NanoMusicSync"));
  if (objc_msgSend(v17, "BOOLValue"))
  {
    v18 = (void *)CFPreferencesCopyAppValue(CFSTR("debugForYouFetchMinutesTillStale"), CFSTR("com.apple.NanoMusicSync"));
    objc_msgSend(v18, "doubleValue");
    v20 = v19;
    NMLogForCategory(5);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412290;
      v24 = v18;
      _os_log_impl(&dword_216E27000, v21, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) (DebugOverrides) Update staleness period from defaults is: %@ minutes", (uint8_t *)&v23, 0xCu);
    }
    v8 = v20 * 60.0;

  }
  return v8;
}

+ (void)_clearLastUpdatedDateIfNeeded
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "catalogRecommendationsLastUpdateDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    NMLogForCategory(5);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_216E27000, v4, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Clearing last updated date.", v6, 2u);
    }

    +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCatalogRecommendationsLastUpdateDate:", 0);

  }
}

- (id)updateHandlerBlock
{
  return self->_updateHandlerBlock;
}

- (void)setUpdateHandlerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandlerBlock, 0);
  objc_storeStrong((id *)&self->_updateScheduler, 0);
  objc_storeStrong((id *)&self->_privacyObservationToken, 0);
  objc_storeStrong((id *)&self->_privacyInfo, 0);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_storeStrong((id *)&self->_pairedDeviceRegistry, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __68__NMSMusicCatalogRecommendationsUpdater__scheduleNextUpdateIfNeeded__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_216E27000, a2, a3, "[Recommendation] (Music) (Catalog) Failed to get bag to determine next update window (will fall back to use predefined values): %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)_configurationWithBag:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_4(&dword_216E27000, a1, a3, "[Recommendation] (Music) (Catalog) Invalid update window from bag, will fall back to use predefined values.", a5, a6, a7, a8, 0);
}

void __91__NMSMusicCatalogRecommendationsUpdater__performNextUpdateWithScheduler_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_216E27000, a2, a3, "[Recommendation] (Music) (Catalog) Failed to get bag to determine staleness period (will fall back to use predefined values): %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __98__NMSMusicCatalogRecommendationsUpdater__performNextUpdateWithScheduler_urlBag_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_216E27000, a2, a3, "[Recommendation] (Music) (Catalog) Failed to perform catalog recommendations request: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)_stalenessIntervalWithBag:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_4(&dword_216E27000, a1, a3, "[Recommendation] (Music) (Catalog) Invalid update staleness period from bag, will fall back to use predefined values.", a5, a6, a7, a8, 0);
}

@end
