@implementation FLSignpostLoggingInit

void __FLSignpostLoggingInit_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.feedbacklogger", "Signposts");
  v1 = (void *)FL_LOG_SIGNPOSTS;
  FL_LOG_SIGNPOSTS = (uint64_t)v0;

}

@end
