@implementation IIOEnableRestrictedDecoding

uint64_t __IIOEnableRestrictedDecoding_block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if ((gIIODebugFlags & 0x4000000000000) != 0)
  {
    result = IIO_OSAppleInternalBuild();
    if ((_DWORD)result)
      result = (uint64_t)ImageIOLog("••• CGImageSourceEnableRestrictedDecoding - restricted decoding (no IOSurface,...) is enabled for this process\n");
  }
  gPermissions |= 0x10uLL;
  gPermissionsChanged = 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) = 0;
  return result;
}

@end
