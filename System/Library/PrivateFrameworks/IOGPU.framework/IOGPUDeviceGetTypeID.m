@implementation IOGPUDeviceGetTypeID

uint64_t __IOGPUDeviceGetTypeID_block_invoke()
{
  kIOGPUDeviceID = _CFRuntimeRegisterClass();
  return mach_timebase_info((mach_timebase_info_t)&timebase_info);
}

@end
