@implementation UseMarginAttributesForDefaultSpacingToSuperview

uint64_t __UseMarginAttributesForDefaultSpacingToSuperview_block_invoke()
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    result = objc_msgSend((id)objc_opt_class(), "_UIWantsMarginAttributeSupport");
    UseMarginAttributesForDefaultSpacingToSuperview_wantsMarginAttributeSupport = result;
  }
  return result;
}

@end
