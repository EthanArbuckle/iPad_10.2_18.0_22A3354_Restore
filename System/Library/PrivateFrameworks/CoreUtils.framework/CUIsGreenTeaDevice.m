@implementation CUIsGreenTeaDevice

uint64_t __CUIsGreenTeaDevice_block_invoke()
{
  uint64_t result;

  if ((MGGetBoolAnswer() & 1) != 0)
    result = 1;
  else
    result = MGGetBoolAnswer();
  CUIsGreenTeaDevice_sResult = result;
  return result;
}

@end
