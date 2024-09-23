@implementation DMCLKLogoutSupportClass

uint64_t __DMCLKLogoutSupportClass_block_invoke()
{
  uint64_t result;

  if (LoginKitBundle_onceToken != -1)
    dispatch_once(&LoginKitBundle_onceToken, &__block_literal_global_101);
  result = objc_msgSend((id)LoginKitBundle_retval, "classNamed:", CFSTR("LKLogoutSupport"));
  DMCLKLogoutSupportClass_LKLogoutSupportClass = result;
  return result;
}

@end
