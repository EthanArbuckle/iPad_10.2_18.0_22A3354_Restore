@implementation ComposePlaceholderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ComposePlaceholderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ComposePlaceholderView"), CFSTR("subjectField"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeSubjectView"), CFSTR("text"), "@", 0);

}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[ComposePlaceholderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subjectField"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
