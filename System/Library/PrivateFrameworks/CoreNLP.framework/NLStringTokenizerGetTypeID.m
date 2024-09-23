@implementation NLStringTokenizerGetTypeID

uint64_t __NLStringTokenizerGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kNLStringTokenizerTypeID = result;
  return result;
}

@end
