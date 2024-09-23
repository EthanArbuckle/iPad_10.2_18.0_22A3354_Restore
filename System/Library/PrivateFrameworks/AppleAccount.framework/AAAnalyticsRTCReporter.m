@implementation AAAnalyticsRTCReporter

+ (id)reporter
{
  if (reporter_onceToken != -1)
    dispatch_once(&reporter_onceToken, &__block_literal_global_24);
  return (id)reporter_rtcReporter;
}

void __34__AAAnalyticsRTCReporter_reporter__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id *v3;
  void *v4;
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = (void *)MEMORY[0x1E0CF0E80];
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v3 = (id *)getkCDPRTCClientTypeSymbolLoc_ptr;
  v14 = getkCDPRTCClientTypeSymbolLoc_ptr;
  if (!getkCDPRTCClientTypeSymbolLoc_ptr)
  {
    v4 = (void *)CoreCDPLibrary();
    v3 = (id *)dlsym(v4, "kCDPRTCClientType");
    v12[3] = (uint64_t)v3;
    getkCDPRTCClientTypeSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v11, 8);
  if (!v3)
    __34__AAAnalyticsRTCReporter_reporter__block_invoke_cold_1();
  v5 = *v3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v6 = (_QWORD *)getkCDPRTCClientNameDNUSymbolLoc_ptr;
  v14 = getkCDPRTCClientNameDNUSymbolLoc_ptr;
  if (!getkCDPRTCClientNameDNUSymbolLoc_ptr)
  {
    v7 = (void *)CoreCDPLibrary();
    v6 = dlsym(v7, "kCDPRTCClientNameDNU");
    v12[3] = (uint64_t)v6;
    getkCDPRTCClientNameDNUSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v11, 8);
  if (!v6)
    __34__AAAnalyticsRTCReporter_reporter__block_invoke_cold_2();
  objc_msgSend(v2, "analyticsTransportRTCWithClientType:clientBundleId:clientName:", v5, v1, *v6, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CF0E70], "analyticsReporterWithTransport:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)reporter_rtcReporter;
  reporter_rtcReporter = v9;

}

void __34__AAAnalyticsRTCReporter_reporter__block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSNumber *const getkCDPRTCClientType(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AAAnalyticsRTCReporter.m"), 15, CFSTR("%s"), dlerror());

  __break(1u);
}

void __34__AAAnalyticsRTCReporter_reporter__block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *const getkCDPRTCClientNameDNU(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AAAnalyticsRTCReporter.m"), 16, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
