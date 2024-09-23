@implementation OctaviaGetExclusiveDisplayList

CFArrayRef __OctaviaGetExclusiveDisplayList_block_invoke()
{
  CFArrayRef result;

  result = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&_block_invoke_kWirelessDisplayName, 1, MEMORY[0x1E0C9B378]);
  OctaviaGetExclusiveDisplayList_exclusiveDisplayList = (uint64_t)result;
  return result;
}

@end
