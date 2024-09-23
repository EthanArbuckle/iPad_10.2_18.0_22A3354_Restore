@implementation CollectionAccessoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.CollectionAccessoryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.CollectionAccessoryView"), CFSTR("title"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[CollectionAccessoryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CollectionAccessoryViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CollectionAccessoryViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
