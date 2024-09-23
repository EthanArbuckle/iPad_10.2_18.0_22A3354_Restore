@implementation AFAssistantCapable

uint64_t __AFAssistantCapable_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AFAssistantCapable_isCapable = result;
  return result;
}

@end
