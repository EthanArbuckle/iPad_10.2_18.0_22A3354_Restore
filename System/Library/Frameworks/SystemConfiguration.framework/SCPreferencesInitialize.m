@implementation SCPreferencesInitialize

uint64_t ____SCPreferencesInitialize_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kSCPreferencesTypeID = result;
  return result;
}

@end
