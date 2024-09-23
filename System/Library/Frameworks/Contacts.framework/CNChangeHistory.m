@implementation CNChangeHistory

+ (OS_os_log)os_log
{
  if (os_log_cn_once_token_0_25 != -1)
    dispatch_once(&os_log_cn_once_token_0_25, &__block_literal_global_145);
  return (OS_os_log *)(id)os_log_cn_once_object_0_25;
}

void __25__CNChangeHistory_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "change-history");
  v1 = (void *)os_log_cn_once_object_0_25;
  os_log_cn_once_object_0_25 = (uint64_t)v0;

}

@end
