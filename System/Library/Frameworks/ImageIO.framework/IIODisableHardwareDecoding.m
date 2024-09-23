@implementation IIODisableHardwareDecoding

uint64_t __IIODisableHardwareDecoding_block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if ((gIIODebugFlags & 0x4000000000000) != 0)
  {
    result = IIO_OSAppleInternalBuild();
    if ((_DWORD)result)
      result = (uint64_t)ImageIOLog("••• CGImageSourceDisableHardwareDecoding - JPEG/HEIF hardware decoder will no longer be used in this process\n");
  }
  gPermissions &= ~8uLL;
  gPermissionsChanged = 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) = 0;
  return result;
}

@end
