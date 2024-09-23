@implementation AVPlayerSetCachedIAPDModeActive

uint64_t __AVPlayerSetCachedIAPDModeActive_block_invoke(uint64_t result)
{
  sAVPlayerIAPDExtendedModeIsActive = *(_BYTE *)(result + 32);
  return result;
}

@end
