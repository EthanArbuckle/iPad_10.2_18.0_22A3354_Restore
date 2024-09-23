@implementation ATXDigestOnboardingLogging

- (ATXDigestOnboardingLogging)init
{
  void *v3;
  void *v4;
  ATXDigestOnboardingLogging *v5;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = -[ATXDigestOnboardingLogging initWithDigestOnboardingLoggingBiomeStream:digestOnboardingAppSelectionLoggingBiomeStream:](self, "initWithDigestOnboardingLoggingBiomeStream:digestOnboardingAppSelectionLoggingBiomeStream:", v3, v4);

  return v5;
}

- (ATXDigestOnboardingLogging)initWithDigestOnboardingLoggingBiomeStream:(id)a3 digestOnboardingAppSelectionLoggingBiomeStream:(id)a4
{
  id v7;
  id v8;
  ATXDigestOnboardingLogging *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXDigestOnboardingLogging;
  v9 = -[ATXDigestOnboardingLogging init](&v14, sel_init);
  if (v9)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("ATXDigestOnboardingLogging.queue", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_digestOnboardingLoggingBiomeStream, a3);
    objc_storeStrong((id *)&v9->_digestOnboardingAppSelectionLoggingBiomeStream, a4);
  }

  return v9;
}

- (void)logDigestOnboardingWithEntrySource:(int)a3 digestSetupOutcome:(int)a4 finalUIShown:(int)a5 timeTaken:(double)a6 didSelectShowMore:(BOOL)a7 numDaysForAverageNotificationCount:(unint64_t)a8 shownApps:(id)a9 appsAddedToDigest:(id)a10 deliveryTimes:(id)a11
{
  _BOOL8 v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;
  id v19;
  id v20;
  void *v21;
  ATXDigestOnboardingLoggingEvent *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;

  v12 = a7;
  v14 = *(_QWORD *)&a5;
  v15 = *(_QWORD *)&a4;
  v16 = *(_QWORD *)&a3;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v21 = (void *)objc_opt_new();
  v22 = -[ATXDigestOnboardingLoggingEvent initWithSessionUUID:entrySource:digestOnboardingOutcome:finalUIShown:didSelectShowMore:timeTaken:deliveryTimes:]([ATXDigestOnboardingLoggingEvent alloc], "initWithSessionUUID:entrySource:digestOnboardingOutcome:finalUIShown:didSelectShowMore:timeTaken:deliveryTimes:", v21, v16, v15, v14, v12, v20, a6);

  -[ATXDigestOnboardingLoggingBiomeStream source](self->_digestOnboardingLoggingBiomeStream, "source");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sendEvent:", v22);

  v24 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __202__ATXDigestOnboardingLogging_logDigestOnboardingWithEntrySource_digestSetupOutcome_finalUIShown_timeTaken_didSelectShowMore_numDaysForAverageNotificationCount_shownApps_appsAddedToDigest_deliveryTimes___block_invoke;
  v29[3] = &unk_1E4D5A3B8;
  v29[4] = self;
  v30 = v18;
  v31 = v19;
  v32 = v21;
  v26 = v21;
  v27 = v19;
  v28 = v18;
  objc_msgSend(v24, "appsSortedByNotificationsReceivedInPreviousNumDays:completionHandler:", v25, v29);

}

uint64_t __202__ATXDigestOnboardingLogging_logDigestOnboardingWithEntrySource_digestSetupOutcome_finalUIShown_timeTaken_didSelectShowMore_numDaysForAverageNotificationCount_shownApps_appsAddedToDigest_deliveryTimes___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "logDigestOnboardingAppSelectionForShownApps:appsAddedToDigest:rankedApps:sessionUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2, *(_QWORD *)(a1 + 56));
}

- (void)logDigestOnboardingAppSelectionForShownApps:(id)a3 appsAddedToDigest:(id)a4 rankedApps:(id)a5 sessionUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v11, "count"))
  {
    v13 = 0;
    do
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bundleId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v21, "containsObject:", v15);

      if ((_DWORD)v16)
      {
        objc_msgSend(v14, "bundleId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v10, "containsObject:", v17);

      }
      else
      {
        v18 = 0;
      }
      -[ATXDigestOnboardingLogging onBoardingAppSelectionEventWithApp:rank:addedToDigest:wasShownInDigest:sessionUUID:](self, "onBoardingAppSelectionEventWithApp:rank:addedToDigest:wasShownInDigest:sessionUUID:", v14, ++v13, v18, v16, v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXDigestOnboardingAppSelectionLoggingBiomeStream source](self->_digestOnboardingAppSelectionLoggingBiomeStream, "source");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sendEvent:", v19);

    }
    while (objc_msgSend(v11, "count") > v13);
  }

}

- (id)onBoardingAppSelectionEventWithApp:(id)a3 rank:(unint64_t)a4 addedToDigest:(BOOL)a5 wasShownInDigest:(BOOL)a6 sessionUUID:(id)a7
{
  id v11;
  id v12;
  ATXDigestOnboardingAppSelectionLoggingEvent *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  ATXDigestOnboardingAppSelectionLoggingEvent *v18;
  uint64_t v20;

  v11 = a7;
  v12 = a3;
  v13 = [ATXDigestOnboardingAppSelectionLoggingEvent alloc];
  objc_msgSend(v12, "bundleId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "avgNumBasicNotifications");
  v16 = objc_msgSend(v12, "avgNumMessageNotifications");
  v17 = objc_msgSend(v12, "avgNumTimeSensitiveNonMessageNotifications");

  BYTE1(v20) = a6;
  LOBYTE(v20) = a5;
  v18 = -[ATXDigestOnboardingAppSelectionLoggingEvent initWithSessionUUID:bundleId:avgNumBasicNotifications:avgNumMessageNotifications:avgNumTimeSensitiveNonMessageNotifications:rank:addedToDigest:wasShownInDigestOnboarding:](v13, "initWithSessionUUID:bundleId:avgNumBasicNotifications:avgNumMessageNotifications:avgNumTimeSensitiveNonMessageNotifications:rank:addedToDigest:wasShownInDigestOnboarding:", v11, v14, v15, v16, v17, a4, v20);

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestOnboardingAppSelectionLoggingBiomeStream, 0);
  objc_storeStrong((id *)&self->_digestOnboardingLoggingBiomeStream, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
