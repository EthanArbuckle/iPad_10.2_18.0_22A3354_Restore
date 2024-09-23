@implementation CoreAnalyticsLibrary

void *__CoreAnalyticsLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreAnalytics.framework/CoreAnalytics", 2);
  CoreAnalyticsLibrary_sLib = (uint64_t)result;
  return result;
}

void *__CoreAnalyticsLibrary_block_invoke_8518()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreAnalytics.framework/CoreAnalytics", 2);
  CoreAnalyticsLibrary_sLib_8498 = (uint64_t)result;
  return result;
}

@end
