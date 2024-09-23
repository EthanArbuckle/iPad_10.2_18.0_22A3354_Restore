@implementation CorePhoneNumbersLibrary

void *__CorePhoneNumbersLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CorePhoneNumbers.framework/CorePhoneNumbers", 2);
  CorePhoneNumbersLibrary_sLib = (uint64_t)result;
  return result;
}

@end
