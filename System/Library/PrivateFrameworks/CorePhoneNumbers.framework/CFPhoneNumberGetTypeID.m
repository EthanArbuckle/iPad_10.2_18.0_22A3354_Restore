@implementation CFPhoneNumberGetTypeID

uint64_t __CFPhoneNumberGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kCFPhoneNumberTypeID = result;
  return result;
}

@end
