@implementation FigRoutingSessionManager

uint64_t __FigRoutingSessionManager_ensureConfigurationInitialized_block_invoke()
{
  gConfigurationMutex = FigSimpleMutexCreate();
  LOWORD(gConfiguration) = 257;
  *(_QWORD *)((char *)&gConfiguration + 4) = 0x3F0000003F4CCCCDLL;
  xmmword_1EE2B3510 = xmmword_1937A4CD0;
  xmmword_1EE2B3520 = xmmword_1937A4CE0;
  xmmword_1EE2B3530 = xmmword_1937A4CF0;
  xmmword_1EE2B3540 = xmmword_1937A4D00;
  return FigMobileAsset_RegisterForAssetUpdates();
}

@end
