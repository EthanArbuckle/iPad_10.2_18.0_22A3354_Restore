@implementation NSPNCShouldReturnEmptyString

uint64_t ____NSPNCShouldReturnEmptyString_block_invoke()
{
  uint64_t result;

  byte_1ECD09A11 = 1;
  result = dyld_program_sdk_at_least();
  byte_1ECD09A11 = result;
  return result;
}

@end
