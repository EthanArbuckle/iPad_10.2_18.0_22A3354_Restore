@implementation FigCPERemoteSetStorageLocation

CFMutableDictionaryRef __FigCPERemoteSetStorageLocation_block_invoke()
{
  CFMutableDictionaryRef result;

  result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  FigCPERemoteSetStorageLocation_serverSandboxRegistrations = (uint64_t)result;
  return result;
}

@end
