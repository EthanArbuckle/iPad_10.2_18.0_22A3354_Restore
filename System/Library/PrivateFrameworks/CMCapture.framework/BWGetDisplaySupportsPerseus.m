@implementation BWGetDisplaySupportsPerseus

uint64_t __BWGetDisplaySupportsPerseus_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  BWGetDisplaySupportsPerseus_displaySupportsPerseus = result;
  return result;
}

@end
