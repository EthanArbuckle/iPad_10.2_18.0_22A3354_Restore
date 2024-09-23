@implementation SUUIContactsUIFramework

void *__SUUIContactsUIFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/ContactsUI.framework/ContactsUI", 1);
  SUUIContactsUIFramework_sHandle = (uint64_t)result;
  return result;
}

@end
