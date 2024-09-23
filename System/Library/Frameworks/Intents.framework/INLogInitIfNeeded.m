@implementation INLogInitIfNeeded

void __INLogInitIfNeeded_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)INLogSiriSubsystem, (const char *)INLogCategoryIntents);
  v1 = (void *)INSiriLogContextIntents;
  INSiriLogContextIntents = (uint64_t)v0;

}

@end
