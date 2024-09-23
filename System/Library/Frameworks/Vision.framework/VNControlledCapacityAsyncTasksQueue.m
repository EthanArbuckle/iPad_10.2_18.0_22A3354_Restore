@implementation VNControlledCapacityAsyncTasksQueue

+ (id)dispatchQueueAttribute
{
  return dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
}

@end
