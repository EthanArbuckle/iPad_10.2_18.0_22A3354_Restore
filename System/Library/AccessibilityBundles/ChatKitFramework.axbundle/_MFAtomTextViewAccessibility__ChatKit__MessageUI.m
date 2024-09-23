@implementation _MFAtomTextViewAccessibility__ChatKit__MessageUI

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_MFAtomTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MFAtomTextViewAccessibility__ChatKit__MessageUI;
  v3 = -[_MFAtomTextViewAccessibility__ChatKit__MessageUI accessibilityTraits](&v8, sel_accessibilityTraits);
  -[_MFAtomTextViewAccessibility__ChatKit__MessageUI _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = ~*MEMORY[0x24BEBB198];
  else
    v5 = -1;
  v6 = v5 & v3;

  return v6;
}

@end
