@implementation EFScheduler(MessageUI)

+ (id)__mui_nextRunLoopMainThreadScheduler
{
  if (__mui_nextRunLoopMainThreadScheduler_onceToken != -1)
    dispatch_once(&__mui_nextRunLoopMainThreadScheduler_onceToken, &__block_literal_global_0);
  return (id)__mui_nextRunLoopMainThreadScheduler_scheduler;
}

@end
