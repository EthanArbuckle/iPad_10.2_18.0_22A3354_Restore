@implementation IsAV1DecoderHardwareAccelerated

uint64_t __mv_IsAV1DecoderHardwareAccelerated_block_invoke()
{
  uint64_t result;

  result = VTIsHardwareDecodeSupported(0x61763031u);
  if ((_DWORD)result)
    sAV1DecoderIsHardwareAccelerated = 1;
  return result;
}

@end
