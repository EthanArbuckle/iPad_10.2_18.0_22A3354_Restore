@implementation AVPlayerGetCachedIAPDModeActive

uint64_t __AVPlayerGetCachedIAPDModeActive_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = sAVPlayerIAPDExtendedModeIsActive;
  return result;
}

@end
