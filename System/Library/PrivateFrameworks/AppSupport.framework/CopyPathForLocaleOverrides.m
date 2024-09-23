@implementation CopyPathForLocaleOverrides

id ___CopyPathForLocaleOverrides_block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  _CopyPathForLocaleOverrides_appSupportBundle = (uint64_t)result;
  return result;
}

@end
