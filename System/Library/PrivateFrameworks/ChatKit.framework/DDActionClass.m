@implementation DDActionClass

uint64_t ____DDActionClass_block_invoke()
{
  uint64_t result;

  result = MEMORY[0x193FF3C18](CFSTR("DDAction"), CFSTR("DataDetectorsUI"));
  __DDActionClass__actionClass = result;
  return result;
}

@end
