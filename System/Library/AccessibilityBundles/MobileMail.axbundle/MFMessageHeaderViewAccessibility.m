@implementation MFMessageHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFMessageHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("MFExpandedMessageCell"));
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (int64_t)accessibilityNavigationStyle
{
  return 2;
}

- (int64_t)accessibilityContainerType
{
  void *v2;
  void *v3;
  void *v4;

  -[MFMessageHeaderViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_5, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityMessageIndexDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return 4 * (v4 == 0);
}

uint64_t __62__MFMessageHeaderViewAccessibility_accessibilityContainerType__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("MFExpandedMessageCell"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("message.header"));
}

@end
