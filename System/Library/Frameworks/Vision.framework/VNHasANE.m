@implementation VNHasANE

uint64_t __VNHasANE_block_invoke()
{
  uint64_t result;

  result = MGIsQuestionValid();
  if ((_DWORD)result)
  {
    result = MGGetBoolAnswer();
    VNHasANE::hasANESupport = result;
  }
  return result;
}

@end
