@implementation HandleManagedDefaultsLoggingChanged

uint64_t ___HandleManagedDefaultsLoggingChanged_block_invoke()
{
  int v0;
  uint64_t result;

  v0 = IsAppleInternalBuild();
  result = LogControl();
  if (v0)
    return LogControl();
  return result;
}

@end
