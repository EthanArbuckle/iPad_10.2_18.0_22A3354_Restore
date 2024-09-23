@implementation VUITVLockupViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUITVLockupViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("VUILabel"), CFSTR("UILabel"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[VUITVLockupViewCellAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXLabelForElements();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __54__VUITVLockupViewCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x2349244BC](CFSTR("VUILabel"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
