@implementation BNRegisterBannerKitLogging

void __BNRegisterBannerKitLogging_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  os_log_t v10;
  void *v11;
  os_log_t v12;
  void *v13;
  os_log_t v14;
  void *v15;
  os_log_t v16;
  void *v17;
  os_log_t v18;
  void *v19;

  v0 = os_log_create((const char *)BNLogSubsystem, "Presentable");
  v1 = (void *)BNLogPresentable;
  BNLogPresentable = (uint64_t)v0;

  v2 = os_log_create((const char *)BNLogSubsystem, "Posting");
  v3 = (void *)BNLogPosting;
  BNLogPosting = (uint64_t)v2;

  v4 = os_log_create((const char *)BNLogSubsystem, "Considering");
  v5 = (void *)BNLogConsidering;
  BNLogConsidering = (uint64_t)v4;

  v6 = os_log_create((const char *)BNLogSubsystem, "Pending");
  v7 = (void *)BNLogPending;
  BNLogPending = (uint64_t)v6;

  v8 = os_log_create((const char *)BNLogSubsystem, "Presenting");
  v9 = (void *)BNLogPresenting;
  BNLogPresenting = (uint64_t)v8;

  v10 = os_log_create((const char *)BNLogSubsystem, "Suspending");
  v11 = (void *)BNLogSuspending;
  BNLogSuspending = (uint64_t)v10;

  v12 = os_log_create((const char *)BNLogSubsystem, "Hosting-service");
  v13 = (void *)BNLogHostingService;
  BNLogHostingService = (uint64_t)v12;

  v14 = os_log_create((const char *)BNLogSubsystem, "Hosting-host");
  v15 = (void *)BNLogHostingHost;
  BNLogHostingHost = (uint64_t)v14;

  v16 = os_log_create((const char *)BNLogSubsystem, "Context-service");
  v17 = (void *)BNLogContextService;
  BNLogContextService = (uint64_t)v16;

  v18 = os_log_create((const char *)BNLogSubsystem, "Context-host");
  v19 = (void *)BNLogContextHost;
  BNLogContextHost = (uint64_t)v18;

}

@end
