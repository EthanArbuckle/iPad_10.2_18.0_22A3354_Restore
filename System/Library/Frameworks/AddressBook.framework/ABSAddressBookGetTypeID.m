@implementation ABSAddressBookGetTypeID

uint64_t __ABSAddressBookGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  kABCAddressBookTypeID = result;
  return result;
}

@end
