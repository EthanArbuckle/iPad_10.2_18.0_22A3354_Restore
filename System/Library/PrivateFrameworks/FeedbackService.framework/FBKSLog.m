@implementation FBKSLog

void __FBKSLog_block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;

  +[FBKSStrings FeedbackServiceBundleIdentifier](_TtC15FeedbackService11FBKSStrings, "FeedbackServiceBundleIdentifier");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v0 = os_log_create((const char *)objc_msgSend(v2, "UTF8String"), "shared");
  v1 = (void *)FBKSLog_handle;
  FBKSLog_handle = (uint64_t)v0;

}

@end
