@implementation NPDeviceSupportsFeedPersonalization

uint64_t __NPDeviceSupportsFeedPersonalization_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  NPDeviceSupportsFeedPersonalization_result = result;
  return result;
}

@end
