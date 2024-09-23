@implementation SFLogInitIfNeeded

void __SFLogInitIfNeeded_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create((const char *)kSFLoggingSubsystem, (const char *)kSFLogConnection);
  v1 = (void *)SFLogConnection;
  SFLogConnection = (uint64_t)v0;

  v2 = os_log_create((const char *)kSFLoggingSubsystem, (const char *)kSFLogFramework);
  v3 = (void *)SFLogFramework;
  SFLogFramework = (uint64_t)v2;

}

@end
