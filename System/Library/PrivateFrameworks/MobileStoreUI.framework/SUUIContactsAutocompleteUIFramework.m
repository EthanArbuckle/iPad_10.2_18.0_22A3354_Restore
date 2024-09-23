@implementation SUUIContactsAutocompleteUIFramework

void *__SUUIContactsAutocompleteUIFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/ContactsAutocompleteUI.framework/ContactsAutocompleteUI", 1);
  SUUIContactsAutocompleteUIFramework_sHandle = (uint64_t)result;
  return result;
}

@end
