@implementation VTShouldRunVideoDecodersInProcess

uint64_t __VTShouldRunVideoDecodersInProcess_block_invoke()
{
  uint64_t result;

  if (currentProcessHasTrueBooleanEntitlement(CFSTR("com.apple.videotoolbox.decode-in-process")))
    sVTRunVideoDecodersInProcess = 1;
  result = VTVideoCodecService_ShouldUseOOPDecodeForVideoPlayer();
  if ((_DWORD)result)
  {
    result = FigServer_IsMediaplaybackd();
    if ((_DWORD)result)
      sVTRunVideoDecodersInProcess = 0;
  }
  return result;
}

@end
