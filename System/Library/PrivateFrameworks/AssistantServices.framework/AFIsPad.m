@implementation AFIsPad

uint64_t __AFIsPad_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AFIsPad_isPad = result;
  return result;
}

@end
