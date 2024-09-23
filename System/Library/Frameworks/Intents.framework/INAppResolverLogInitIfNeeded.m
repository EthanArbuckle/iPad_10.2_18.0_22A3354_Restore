@implementation INAppResolverLogInitIfNeeded

void __INAppResolverLogInitIfNeeded_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)INLogShortcutsSubsystem, (const char *)INLogCategoryAppResolver);
  v1 = (void *)INLogContextAppResolver;
  INLogContextAppResolver = (uint64_t)v0;

}

@end
