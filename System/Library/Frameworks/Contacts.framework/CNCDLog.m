@implementation CNCDLog

+ (OS_os_log)saving
{
  if (saving_cn_once_token_0 != -1)
    dispatch_once(&saving_cn_once_token_0, &__block_literal_global_141);
  return (OS_os_log *)(id)saving_cn_once_object_0;
}

void __17__CNCDLog_saving__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "saving");
  v1 = (void *)saving_cn_once_object_0;
  saving_cn_once_object_0 = (uint64_t)v0;

}

@end
