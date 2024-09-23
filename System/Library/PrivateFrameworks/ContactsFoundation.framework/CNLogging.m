@implementation CNLogging

+ (OS_os_log)apiUsageLog
{
  if (apiUsageLog_cn_once_token_1 != -1)
    dispatch_once(&apiUsageLog_cn_once_token_1, &__block_literal_global_3_4);
  return (OS_os_log *)(id)apiUsageLog_cn_once_object_1;
}

void __24__CNLogging_apiUsageLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "api");
  v1 = (void *)apiUsageLog_cn_once_object_1;
  apiUsageLog_cn_once_object_1 = (uint64_t)v0;

}

+ (OS_os_log)notificationOSLog
{
  if (notificationOSLog_cn_once_token_0 != -1)
    dispatch_once(&notificationOSLog_cn_once_token_0, &__block_literal_global_36);
  return (OS_os_log *)(id)notificationOSLog_cn_once_object_0;
}

void __30__CNLogging_notificationOSLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "notifications");
  v1 = (void *)notificationOSLog_cn_once_object_0;
  notificationOSLog_cn_once_object_0 = (uint64_t)v0;

}

+ (OS_os_log)sdkBreakageLog
{
  if (sdkBreakageLog_cn_once_token_2 != -1)
    dispatch_once(&sdkBreakageLog_cn_once_token_2, &__block_literal_global_5_2);
  return (OS_os_log *)(id)sdkBreakageLog_cn_once_object_2;
}

void __27__CNLogging_sdkBreakageLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "sdk");
  v1 = (void *)sdkBreakageLog_cn_once_object_2;
  sdkBreakageLog_cn_once_object_2 = (uint64_t)v0;

}

@end
