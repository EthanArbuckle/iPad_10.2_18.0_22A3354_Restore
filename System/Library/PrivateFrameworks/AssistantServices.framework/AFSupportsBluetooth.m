@implementation AFSupportsBluetooth

uint64_t __AFSupportsBluetooth_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AFSupportsBluetooth_supportsBluetooth = result;
  return result;
}

@end
