@implementation FBKSSP2Log

void __FBKSSP2Log_block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;

  +[FBKSStrings FeedbackServiceBundleIdentifier](_TtC15FeedbackService11FBKSStrings, "FeedbackServiceBundleIdentifier");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v0 = os_log_create((const char *)objc_msgSend(v2, "UTF8String"), "sp2");
  v1 = (void *)FBKSSP2Log_handle;
  FBKSSP2Log_handle = (uint64_t)v0;

}

@end
