@implementation CMContinuityCaptureGetHostTimeInNanoSec

uint64_t __CMContinuityCaptureGetHostTimeInNanoSec_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&CMContinuityCaptureGetHostTimeInNanoSec_s_timebase_info);
}

@end
