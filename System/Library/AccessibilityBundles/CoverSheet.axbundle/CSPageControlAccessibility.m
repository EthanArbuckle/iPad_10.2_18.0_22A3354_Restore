@implementation CSPageControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSPageControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)accessibilityIncrement
{
  uint64_t v3;

  if (-[CSPageControlAccessibility _accessibilityIsRTL](self, "_accessibilityIsRTL"))
    v3 = 1;
  else
    v3 = 2;
  -[CSPageControlAccessibility _accessibilityScrollPageInDirection:shouldSendScrollFailed:](self, "_accessibilityScrollPageInDirection:shouldSendScrollFailed:", v3, 0);
}

- (void)accessibilityDecrement
{
  uint64_t v3;

  if (-[CSPageControlAccessibility _accessibilityIsRTL](self, "_accessibilityIsRTL"))
    v3 = 2;
  else
    v3 = 1;
  -[CSPageControlAccessibility _accessibilityScrollPageInDirection:shouldSendScrollFailed:](self, "_accessibilityScrollPageInDirection:shouldSendScrollFailed:", v3, 0);
}

@end
