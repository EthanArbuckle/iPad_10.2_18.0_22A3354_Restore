@implementation CPIsInternalDevice

uint64_t __CPIsInternalDevice_block_invoke()
{
  uint64_t result;

  if ((MGGetBoolAnswer() & 1) != 0)
    result = 1;
  else
    result = MGGetBoolAnswer();
  CPIsInternalDevice_result = result;
  return result;
}

@end
