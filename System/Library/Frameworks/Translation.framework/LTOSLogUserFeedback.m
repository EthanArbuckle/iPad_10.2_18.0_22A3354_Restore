@implementation LTOSLogUserFeedback

void ___LTOSLogUserFeedback_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Translation", "UserFeedback");
  v1 = (void *)_LTOSLogUserFeedback_log;
  _LTOSLogUserFeedback_log = (uint64_t)v0;

}

@end
