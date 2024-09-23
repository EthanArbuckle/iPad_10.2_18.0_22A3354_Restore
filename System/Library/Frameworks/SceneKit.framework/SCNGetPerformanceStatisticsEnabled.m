@implementation SCNGetPerformanceStatisticsEnabled

void __SCNGetPerformanceStatisticsEnabled_block_invoke()
{
  char *v0;

  v0 = getenv("SCN_ENABLE_COLLECTION");
  if (v0 && !strcmp(v0, "YES"))
  {
    if (SCNInitializeForDebugging(void)::onceToken != -1)
      dispatch_once(&SCNInitializeForDebugging(void)::onceToken, &__block_literal_global_68);
  }
}

@end
