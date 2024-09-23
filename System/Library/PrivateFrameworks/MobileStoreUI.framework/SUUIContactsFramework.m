@implementation SUUIContactsFramework

void *__SUUIContactsFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/Contacts.framework/Contacts", 1);
  SUUIContactsFramework_sHandle = (uint64_t)result;
  return result;
}

@end
