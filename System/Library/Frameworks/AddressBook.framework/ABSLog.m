@implementation ABSLog

+ (id)log
{
  if (log_cn_once_token_0 != -1)
    dispatch_once(&log_cn_once_token_0, &__block_literal_global_5);
  return (id)log_cn_once_object_0;
}

void __13__ABSLog_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "addressbook");
  v1 = (void *)log_cn_once_object_0;
  log_cn_once_object_0 = (uint64_t)v0;

}

+ (id)apiLog
{
  if (apiLog_cn_once_token_1 != -1)
    dispatch_once(&apiLog_cn_once_token_1, &__block_literal_global_8_0);
  return (id)apiLog_cn_once_object_1;
}

void __16__ABSLog_apiLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "addressbook-api");
  v1 = (void *)apiLog_cn_once_object_1;
  apiLog_cn_once_object_1 = (uint64_t)v0;

}

@end
