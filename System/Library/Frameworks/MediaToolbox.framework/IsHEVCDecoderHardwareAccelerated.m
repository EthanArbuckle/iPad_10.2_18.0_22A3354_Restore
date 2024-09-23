@implementation IsHEVCDecoderHardwareAccelerated

uint64_t __mv_IsHEVCDecoderHardwareAccelerated_block_invoke()
{
  uint64_t result;

  result = VTIsHardwareDecodeSupported(0x68766331u);
  if ((_DWORD)result)
    sHEVCDecoderIsHardwareAccelerated = 1;
  return result;
}

@end
