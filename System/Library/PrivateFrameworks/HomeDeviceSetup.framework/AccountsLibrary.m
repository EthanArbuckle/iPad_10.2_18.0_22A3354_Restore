@implementation AccountsLibrary

void *__AccountsLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/Accounts.framework/Accounts", 2);
  AccountsLibrary_sLib = (uint64_t)result;
  return result;
}

@end
