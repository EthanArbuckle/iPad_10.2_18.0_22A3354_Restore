@implementation AMPAddOverridesForSupportingLayoutDirectionOnUIView

uint64_t (*__AMPAddOverridesForSupportingLayoutDirectionOnUIView_block_invoke())(void)
{
  objc_class *v0;
  objc_method *InstanceMethod;
  uint64_t (*result)(void);

  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel_traitCollection);
  result = (uint64_t (*)(void))method_setImplementation(InstanceMethod, (IMP)swizzle_UIView_traitCollection);
  sOriginal_UIView_traitCollection = result;
  return result;
}

@end
