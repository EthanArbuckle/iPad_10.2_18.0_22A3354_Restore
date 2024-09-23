@implementation MCLKLogoutSupportClass

uint64_t __MCLKLogoutSupportClass_block_invoke()
{
  uint64_t result;

  if (LoginKitBundle_onceToken != -1)
    dispatch_once(&LoginKitBundle_onceToken, &__block_literal_global_230);
  result = objc_msgSend((id)LoginKitBundle_retval, "classNamed:", CFSTR("LKLogoutSupport"));
  MCLKLogoutSupportClass_LKLogoutSupportClass = result;
  return result;
}

@end
