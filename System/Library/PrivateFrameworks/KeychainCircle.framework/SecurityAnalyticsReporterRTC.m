@implementation SecurityAnalyticsReporterRTC

+ (id)rtcAnalyticsReporter
{
  if (rtcAnalyticsReporter_onceToken != -1)
    dispatch_once(&rtcAnalyticsReporter_onceToken, &__block_literal_global);
  return (id)rtcAnalyticsReporter_rtcReporter;
}

+ (void)sendMetricWithEvent:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  BOOL v13;

  v9 = a3;
  v7 = a5;
  if (objc_msgSend(v9, "permittedToSendMetrics"))
  {
    objc_msgSend(v9, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__SecurityAnalyticsReporterRTC_sendMetricWithEvent_success_error___block_invoke;
    block[3] = &unk_24C7B9120;
    v11 = v9;
    v13 = a4;
    v12 = v7;
    dispatch_sync(v8, block);

  }
}

void __66__SecurityAnalyticsReporterRTC_sendMetricWithEvent_success_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "getEvent");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("didSucceed"));

  objc_msgSend(v4, "populateUnderlyingErrorsStartingWithRootError:", *(_QWORD *)(a1 + 40));
  +[SecurityAnalyticsReporterRTC rtcAnalyticsReporter](SecurityAnalyticsReporterRTC, "rtcAnalyticsReporter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendEvent:", v4);

}

void __52__SecurityAnalyticsReporterRTC_rtcAnalyticsReporter__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v0 = (void *)getAAFAnalyticsTransportRTCClass_softClass;
  v15 = getAAFAnalyticsTransportRTCClass_softClass;
  if (!getAAFAnalyticsTransportRTCClass_softClass)
  {
    v7 = MEMORY[0x24BDAC760];
    v8 = 3221225472;
    v9 = __getAAFAnalyticsTransportRTCClass_block_invoke;
    v10 = &unk_24C7B9780;
    v11 = &v12;
    __getAAFAnalyticsTransportRTCClass_block_invoke((uint64_t)&v7);
    v0 = (void *)v13[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v12, 8);
  objc_msgSend(v1, "analyticsTransportRTCWithClientType:clientBundleId:clientName:", &unk_24C7BFD08, CFSTR("com.apple.securityd"), CFSTR("com.apple.aaa.dnu"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v3 = (void *)getAAFAnalyticsReporterClass_softClass;
  v15 = getAAFAnalyticsReporterClass_softClass;
  if (!getAAFAnalyticsReporterClass_softClass)
  {
    v7 = MEMORY[0x24BDAC760];
    v8 = 3221225472;
    v9 = __getAAFAnalyticsReporterClass_block_invoke;
    v10 = &unk_24C7B9780;
    v11 = &v12;
    __getAAFAnalyticsReporterClass_block_invoke((uint64_t)&v7);
    v3 = (void *)v13[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v12, 8);
  objc_msgSend(v4, "analyticsReporterWithTransport:", v2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)rtcAnalyticsReporter_rtcReporter;
  rtcAnalyticsReporter_rtcReporter = v5;

}

@end
