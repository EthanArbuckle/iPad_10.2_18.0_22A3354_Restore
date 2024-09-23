@implementation SUUIAccountsFramework

void *__SUUIAccountsFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/Accounts.framework/Accounts", 1);
  SUUIAccountsFramework_sHandle = (uint64_t)result;
  return result;
}

@end
