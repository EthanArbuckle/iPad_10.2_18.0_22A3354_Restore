@implementation FVDUtilsEncryptedDecodeSupported

uint64_t __FVDUtilsEncryptedDecodeSupported_block_invoke()
{
  uint64_t result;

  result = VTIsHardwareDecodeSupported(0x6F687663u);
  FVDUtilsEncryptedDecodeSupported_result = result;
  return result;
}

@end
