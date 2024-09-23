@implementation WKContentViewAccessibility__MobileMail__WebKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WKContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("MFExpandedMessageCell"));
}

- (int64_t)accessibilityContainerType
{
  void *v2;
  void *v3;
  void *v4;

  -[WKContentViewAccessibility__MobileMail__WebKit _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_7, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityMessageIndexDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return 4 * (v4 == 0);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("message.content"));
}

@end
