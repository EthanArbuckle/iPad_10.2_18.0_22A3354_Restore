@implementation CMIOLogLevel

uint64_t __CMIOLogLevel_block_invoke()
{
  uint64_t result;

  result = CMIOPreferencesGetIntegerValue(CFSTR("Debug"), 0);
  CMIOLogLevel::cmioLevel = result;
  return result;
}

@end
