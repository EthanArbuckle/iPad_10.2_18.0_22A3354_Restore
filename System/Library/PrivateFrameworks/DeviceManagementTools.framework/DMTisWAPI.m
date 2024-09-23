@implementation DMTisWAPI

uint64_t __DMTisWAPI_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  DMTisWAPI_wapi = result;
  return result;
}

@end
