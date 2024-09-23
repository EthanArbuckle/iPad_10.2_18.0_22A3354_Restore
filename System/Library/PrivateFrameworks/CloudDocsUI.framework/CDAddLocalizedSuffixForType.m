@implementation CDAddLocalizedSuffixForType

void __CDAddLocalizedSuffixForType_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)BRLocalizedStringSuffixesByType;
  BRLocalizedStringSuffixesByType = v0;

}

@end
