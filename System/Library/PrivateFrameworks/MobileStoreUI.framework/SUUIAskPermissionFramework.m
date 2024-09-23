@implementation SUUIAskPermissionFramework

void *__SUUIAskPermissionFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AskPermission.framework/AskPermission", 1);
  SUUIAskPermissionFramework_sHandle = (uint64_t)result;
  return result;
}

@end
