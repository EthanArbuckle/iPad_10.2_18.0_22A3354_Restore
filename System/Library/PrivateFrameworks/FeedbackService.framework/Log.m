@implementation Log

void __Log_block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;

  +[FBKSStrings FeedbackServiceBundleIdentifier](_TtC15FeedbackService11FBKSStrings, "FeedbackServiceBundleIdentifier");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v0 = os_log_create((const char *)objc_msgSend(v2, "UTF8String"), "http");
  v1 = (void *)Log_handle;
  Log_handle = (uint64_t)v0;

}

void __Log_block_invoke_0()
{
  os_log_t v0;
  void *v1;
  id v2;

  +[FBKSStrings FeedbackServiceBundleIdentifier](_TtC15FeedbackService11FBKSStrings, "FeedbackServiceBundleIdentifier");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v0 = os_log_create((const char *)objc_msgSend(v2, "UTF8String"), "device-token");
  v1 = (void *)Log_handle_0;
  Log_handle_0 = (uint64_t)v0;

}

@end
