@implementation MCMCrashOnException

uint64_t __MCMCrashOnException_block_invoke()
{
  return pthread_mutex_init(&MCMCrashOnException_crashLock, 0);
}

@end
