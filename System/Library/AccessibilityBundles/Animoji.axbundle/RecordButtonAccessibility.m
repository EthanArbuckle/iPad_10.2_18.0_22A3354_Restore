@implementation RecordButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("RecordButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("RecordButton"), CFSTR("UIControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIControl"), CFSTR("enabled"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return -[RecordButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("enabled"));
}

@end
