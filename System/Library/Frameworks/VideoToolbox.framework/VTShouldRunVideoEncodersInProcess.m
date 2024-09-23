@implementation VTShouldRunVideoEncodersInProcess

uint64_t __VTShouldRunVideoEncodersInProcess_block_invoke()
{
  uint64_t result;

  result = currentProcessHasTrueBooleanEntitlement(CFSTR("com.apple.videotoolbox.encode-in-process"));
  if ((_DWORD)result)
    sVTRunVideoEncodersInProcess = 1;
  return result;
}

@end
