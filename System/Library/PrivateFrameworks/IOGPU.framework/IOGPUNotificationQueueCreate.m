@implementation IOGPUNotificationQueueCreate

uint64_t __IOGPUNotificationQueueCreate_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_iogpuTimebaseInfo);
}

@end
