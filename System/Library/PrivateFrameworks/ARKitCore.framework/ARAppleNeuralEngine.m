@implementation ARAppleNeuralEngine

uint64_t __ARAppleNeuralEngine_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  s_deviceSupportsANE = result;
  return result;
}

@end
