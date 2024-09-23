@implementation SUICStreamingTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUICStreamingTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasProperty:withType:", CFSTR("SUICStreamingTextView"), CFSTR("text"), "@");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[SUICStreamingTextViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("text"));
}

- (id)accessibilityIdentifier
{
  return CFSTR("SUICStreamingTextView");
}

@end
