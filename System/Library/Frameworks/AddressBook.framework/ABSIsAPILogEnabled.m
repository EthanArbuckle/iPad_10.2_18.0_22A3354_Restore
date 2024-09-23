@implementation ABSIsAPILogEnabled

uint64_t __ABSIsAPILogEnabled_block_invoke()
{
  uint64_t result;

  result = ABSIsLogEnabled((uint64_t)CFSTR("API"));
  ABSIsAPILogEnabled_result = result;
  return result;
}

@end
