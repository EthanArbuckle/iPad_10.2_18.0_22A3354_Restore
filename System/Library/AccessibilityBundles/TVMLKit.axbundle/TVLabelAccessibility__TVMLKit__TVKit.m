@implementation TVLabelAccessibility__TVMLKit__TVKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TVLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IKTextElement"), CFSTR("badges"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IKTextBadgeAttachment"), CFSTR("badge"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IKViewElement"), CFSTR("accessibilityText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IKImageElement"), CFSTR("url"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TVLabelAccessibility__TVMLKit__TVKit;
  -[TVLabelAccessibility__TVMLKit__TVKit accessibilityLabel](&v7, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVLabelAccessibility__TVMLKit__TVKit _atvaccessibilityITMLAccessibilityContent](self, "_atvaccessibilityITMLAccessibilityContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFFA80], "textByReconcilingClientText:withServerText:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
