@implementation DOMNodeAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DOMNode");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DOMNode"), CFSTR("handleKeyWebEvent:"), "v", "@", 0);
}

- (void)handleKeyWebEvent:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DOMNodeAccessibility;
  v3 = a3;
  -[DOMNodeAccessibility handleKeyWebEvent:](&v4, sel_handleKeyWebEvent_, v3);
  sendNotificationAfterHandlingWebKeyEventIfNeeded(v3);

}

@end
