@implementation InCallControlsBaseCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.InCallControlsBaseCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.InCallControlsBaseCell"), CFSTR("titleLabel"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[InCallControlsBaseCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
