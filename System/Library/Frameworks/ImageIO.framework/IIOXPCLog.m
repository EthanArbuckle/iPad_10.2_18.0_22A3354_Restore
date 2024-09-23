@implementation IIOXPCLog

uint64_t __IIOXPCLog_block_invoke()
{
  uint64_t result;

  result = IIO_OSAppleInternalBuild();
  if ((_DWORD)result)
    IIOXPCLog::logXPC = (gIIODebugFlags & 0xC0000) != 0;
  return result;
}

@end
