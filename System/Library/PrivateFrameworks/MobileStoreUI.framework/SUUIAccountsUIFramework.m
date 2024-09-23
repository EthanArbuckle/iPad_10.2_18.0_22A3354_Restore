@implementation SUUIAccountsUIFramework

void *__SUUIAccountsUIFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AccountsUI.framework/AccountsUI", 1);
  SUUIAccountsUIFramework_sHandle = (uint64_t)result;
  return result;
}

@end
