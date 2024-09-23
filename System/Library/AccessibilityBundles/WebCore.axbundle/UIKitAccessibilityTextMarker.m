@implementation UIKitAccessibilityTextMarker

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WebAccessibilityTextMarker");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityTextMarker"), CFSTR("dataRepresentation"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityTextMarker"), CFSTR("initWithData: accessibilityObject:"), "@", "@", "@", 0);

}

- (UIKitAccessibilityTextMarker)initWithData:(id)a3
{
  return -[UIKitAccessibilityTextMarker initWithData:accessibilityObject:](self, "initWithData:accessibilityObject:", a3, 0);
}

@end
