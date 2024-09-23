@implementation SIWordTrieGetTypeID

uint64_t __SIWordTrieGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kSIWordTrieTypeID = result;
  return result;
}

@end
