@implementation AntiScreenCaptureGetStatus

CFArrayRef __AntiScreenCaptureGetStatus_block_invoke()
{
  CFArrayRef result;

  result = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&AntiScreenCaptureGetStatus_wirelessDisplayName, 1, MEMORY[0x1E0C9B378]);
  AntiScreenCaptureGetStatus_wirelessDisplayList = (uint64_t)result;
  return result;
}

@end
