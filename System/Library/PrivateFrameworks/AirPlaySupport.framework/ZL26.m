@implementation ZL26

APSRealTimeSignalGuts *___ZL26_APSRealTimeSignalFinalizePKv_block_invoke(uint64_t a1)
{
  APSRealTimeSignalGuts *result;

  result = *(APSRealTimeSignalGuts **)(a1 + 32);
  if (result)
  {
    APSRealTimeSignalGuts::~APSRealTimeSignalGuts(result);
    JUMPOUT(0x1CAA42B64);
  }
  return result;
}

@end
