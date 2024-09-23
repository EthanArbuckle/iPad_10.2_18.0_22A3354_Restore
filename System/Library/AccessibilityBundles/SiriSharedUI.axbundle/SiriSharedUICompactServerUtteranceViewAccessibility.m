@implementation SiriSharedUICompactServerUtteranceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriSharedUICompactServerUtteranceView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriSharedUICompactServerUtteranceView"), CFSTR("_serverLabels"), "NSMutableArray");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SiriSharedUICompactServerUtteranceViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_serverLabels"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23491E32C]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityIdentifier
{
  return CFSTR("SiriSharedUICompactServerUtteranceView");
}

@end
