@implementation HDSIsGreenTeaDevice

uint64_t __HDSIsGreenTeaDevice_block_invoke()
{
  uint64_t result;

  if ((MGGetBoolAnswer() & 1) != 0)
    result = 1;
  else
    result = MGGetBoolAnswer();
  HDSIsGreenTeaDevice_result = result;
  return result;
}

@end
